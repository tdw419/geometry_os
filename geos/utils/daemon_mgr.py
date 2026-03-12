"""Daemon lifecycle management utilities."""

import os
import signal
import subprocess
import sys
from dataclasses import dataclass
from enum import Enum
from pathlib import Path


class DaemonStatus(Enum):
    """Status of a daemon process."""

    RUNNING = "running"
    STOPPED = "stopped"
    UNKNOWN = "unknown"


@dataclass
class DaemonInfo:
    """Information about a daemon."""

    name: str
    path: str
    pid_file: str
    status: DaemonStatus = DaemonStatus.UNKNOWN
    pid: int | None = None
    uptime: str | None = None


class DaemonManager:
    """Manage daemon lifecycle (start, stop, status)."""

    # Known daemon locations
    DAEMON_PATHS = {
        "sisyphus": "systems/sisyphus/daemon.py",
        "swarm": "systems/swarm/daemon.py",
        "evolution": "systems/evolution_daemon/evolution_daemon.py",
    }

    def __init__(self, pid_dir: Path | None = None):
        self.pid_dir = pid_dir or Path(".geometry")

    def discover(self) -> list[DaemonInfo]:
        """Discover available daemons."""
        daemons = []

        for name, path in self.DAEMON_PATHS.items():
            if Path(path).exists():
                pid_file = self.pid_dir / f"{name}.pid"
                info = DaemonInfo(
                    name=name,
                    path=path,
                    pid_file=str(pid_file),
                )
                info.status = self._check_status(pid_file)
                if info.status == DaemonStatus.RUNNING:
                    info.pid = self._read_pid(pid_file)
                daemons.append(info)

        return daemons

    def status(self, name: str | None = None) -> DaemonInfo | None:
        """Get status of a specific daemon."""
        if name:
            daemons = self.discover()
            for d in daemons:
                if d.name == name:
                    return d
            return None
        return None

    def start(self, name: str) -> tuple[bool, str]:
        """Start a daemon."""
        if name not in self.DAEMON_PATHS:
            return False, f"Daemon '{name}' not found"

        path = self.DAEMON_PATHS[name]
        if not Path(path).exists():
            return False, f"Daemon script not found: {path}"

        pid_file = self.pid_dir / f"{name}.pid"

        # Check if already running
        if self._check_status(pid_file) == DaemonStatus.RUNNING:
            return False, f"Daemon '{name}' is already running"

        # Ensure pid directory exists
        self.pid_dir.mkdir(parents=True, exist_ok=True)

        # Start daemon in background
        try:
            proc = subprocess.Popen(
                [sys.executable, path],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
                start_new_session=True,
            )

            # Write PID file
            pid_file.write_text(str(proc.pid))

            return True, f"Started {name} (pid: {proc.pid})"
        except Exception as e:
            return False, f"Failed to start {name}: {e}"

    def stop(self, name: str) -> tuple[bool, str]:
        """Stop a daemon."""
        if name not in self.DAEMON_PATHS:
            return False, f"Daemon '{name}' not found"

        pid_file = self.pid_dir / f"{name}.pid"

        if self._check_status(pid_file) != DaemonStatus.RUNNING:
            return False, f"Daemon '{name}' is not running"

        pid = self._read_pid(pid_file)
        if pid is None:
            return False, f"Could not read PID for {name}"

        try:
            os.kill(pid, signal.SIGTERM)
            pid_file.unlink()
            return True, f"Stopped {name}"
        except ProcessLookupError:
            pid_file.unlink()
            return False, f"Process {pid} not found (cleaned up PID file)"
        except Exception as e:
            return False, f"Failed to stop {name}: {e}"

    def _check_status(self, pid_file: Path) -> DaemonStatus:
        """Check daemon status from PID file."""
        if not pid_file.exists():
            return DaemonStatus.STOPPED

        pid = self._read_pid(pid_file)
        if pid is None:
            return DaemonStatus.UNKNOWN

        try:
            os.kill(pid, 0)  # Check if process exists
            return DaemonStatus.RUNNING
        except ProcessLookupError:
            return DaemonStatus.STOPPED
        except PermissionError:
            return DaemonStatus.RUNNING  # Process exists but not ours

    def _read_pid(self, pid_file: Path) -> int | None:
        """Read PID from file."""
        try:
            return int(pid_file.read_text().strip())
        except (ValueError, FileNotFoundError):
            return None