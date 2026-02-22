# ASCII Desktop Control - Tasks

- [x] 4.2 Create systemd service file
  - **Do**: Create `systemd/geometryos-directive-daemon.service` and `scripts/install_daemon.sh`
  - **Files**: `systemd/geometryos-directive-daemon.service`, `scripts/install_daemon.sh`
  - **Done when**: Service file exists and install script is executable
  - **Verify**: `test -x scripts/install_daemon.sh && test -f systemd/geometryos-directive-daemon.service`
  - **Commit**: `feat(daemon): add systemd service for directive polling`
