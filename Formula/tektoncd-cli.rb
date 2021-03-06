# This file was generated by GoReleaser. DO NOT EDIT.
class TektoncdCli < Formula
  desc "Tekton CLI - The command line interface for interacting with Tekton"
  homepage "https://github.com/tektoncd/cli"
  version "0.14.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/tektoncd/cli/releases/download/v0.14.0/tkn_0.14.0_Darwin_x86_64.tar.gz"
    sha256 "dbd958146be6ef74c54a802d812713d48a99243b1c71bb6f4561a73ca9d2b89d"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tektoncd/cli/releases/download/v0.14.0/tkn_0.14.0_Linux_x86_64.tar.gz"
      sha256 "61b2dbccbad5706460eba8ea5f8e600b39242a56e964a2b07720888fd5276494"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tektoncd/cli/releases/download/v0.14.0/tkn_0.14.0_Linux_arm64.tar.gz"
        sha256 "69afea755d0cadb4e9a08530574bf49ac6a002bed66e713246700c4466491676"
      else
      end
    end
  end

  def install
    bin.install_symlink "tkn" => "kubectl-tkn"
    bin.install "tkn" => "tkn"
    output = Utils.popen_read("SHELL=bash #{bin}/tkn completion bash")
    (bash_completion/"tkn").write output
    output = Utils.popen_read("SHELL=zsh #{bin}/tkn completion zsh")
    (zsh_completion/"_tkn").write output
    prefix.install_metafiles
  end

  test do
    system "#{bin}/tkn", "version"
  end
end
