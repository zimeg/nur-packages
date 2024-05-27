{ lib, stdenvNoCC, fetchFromGitHub, installShellFiles }:

stdenvNoCC.mkDerivation rec {
  pname = "wd";
  version = "0.7.0";

  src = fetchFromGitHub {
    owner = "mfaerevaag";
    repo = "wd";
    rev = "v${version}";
    sha256 = "sha256-u3n+JzInv8VajWAFXECuEOWuQurX8iWklwV2LG4Tj24=";
  };

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    install -Dm755 wd.plugin.zsh $out/share/wd/wd.plugin.zsh
    install -Dm755 wd.sh $out/share/wd/wd.sh
    installManPage wd.1
    installShellCompletion --zsh _wd.sh
  '';

  meta = with lib; {
    description = "Jump to custom directories in zsh";
    longDescription = ''
      `wd` (warp directory) lets you jump to custom directories in zsh, without
      using `cd`. Why? Because `cd` seems inefficient when the folder is
      frequently visited or has a long path.
    '';
    homepage = "https://github.com/mfaerevaag/wd";
    changelog = "https://github.com/mfaerevaag/wd/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = [ ];
    mainProgram = "wd";
    platforms = platforms.unix;
  };
}
