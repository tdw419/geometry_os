"""Core orchestrator logic for session rotation."""

import os
import subprocess
import json
import time
from pathlib import Path
from typing import Optional, Dict, Any
from dataclasses import dataclass, field
from enum import Enum


class SessionStatus(Enum):
    IDLE = "idle"
    RUNNING = "running"
    ROTATING = "rotating"
    COMPLETE = "complete"
    ERROR = "error"


@dataclass
class SessionState:
    """State of the orchestrator."""
    status: SessionStatus = SessionStatus.IDLE
    session_count: int = 0
    current_pid: Optional[int] = None
    orchestrator_pid: Optional[int] = None
    started_at: Optional[float] = None
    config: Dict[str, Any] = field(default_factory=dict)


class Orchestrator:
    """Manages session rotation lifecycle."""

    def __init__(self,
                 session_dir: str = ".session",
                 cli_command: str = "claude",
                 max_sessions: int = 50,
                 token_limit: int = 150000,
                 search_query: Optional[str] = None,
                 continuous: bool = False):
        self.session_dir = Path(session_dir)
        self.cli_command = cli_command
        self.max_sessions = max_sessions
        self.token_limit = token_limit
        self.search_query = search_query
        self.continuous = continuous
        self.state = SessionState()
        self._process: Optional[subprocess.Popen] = None

    def _ensure_dirs(self):
        """Ensure session directories exist."""
        self.session_dir.mkdir(parents=True, exist_ok=True)
        (self.session_dir / "logs").mkdir(parents=True, exist_ok=True)

    def _clear_old_state(self):
        """Clear old logs and state from previous runs."""
        import glob
        for f in glob.glob(str(self.session_dir / "logs" / "*.log")):
            os.remove(f)
        state_file = self.session_dir / "state.json"
        if state_file.exists():
            os.remove(state_file)
        handoff = self.session_dir / "handoff.md"
        if handoff.exists():
            os.remove(handoff)

    def _build_prompt(self) -> str:
        """Build prompt using build_prompt.py."""
        script_dir = Path(__file__).parent.parent.parent  # Go up to session_rotator/
        build_prompt_script = script_dir / "build_prompt.py"

        cmd = ["python3", str(build_prompt_script), "--auto"]
        if self.search_query:
            cmd.extend(["--search", self.search_query])

        result = subprocess.run(cmd, capture_output=True, text=True)
        return result.stdout

    def _save_state(self):
        """Save current state to file."""
        state_file = self.session_dir / "state.json"
        data = {
            "status": self.state.status.value,
            "session_count": self.state.session_count,
            "current_pid": self.state.current_pid,
            "orchestrator_pid": self.state.orchestrator_pid,
            "started_at": self.state.started_at,
            "config": self.state.config
        }
        state_file.write_text(json.dumps(data, indent=2))

    def _detect_event(self, log_file: Path) -> str:
        """Detect event from log file."""
        script_dir = Path(__file__).parent.parent.parent
        detect_script = script_dir / "detect_event.py"

        cmd = ["python3", str(detect_script),
               "--handoff", str(self.session_dir / "handoff.md"),
               "--log", str(log_file),
               "--no-token-check"]

        result = subprocess.run(cmd, capture_output=True, text=True)
        return result.stdout.strip()

    def start(self) -> bool:
        """Start the orchestrator."""
        self._ensure_dirs()
        self._clear_old_state()

        self.state.status = SessionStatus.RUNNING
        self.state.started_at = time.time()
        self.state.orchestrator_pid = os.getpid()
        self._save_state()

        # Find orchestrator.sh - check multiple locations
        script_dir = Path(__file__).parent.parent.parent  # cli_anything/session_rotator
        possible_paths = [
            script_dir.parent.parent / "orchestrator.sh",  # session_rotator/orchestrator.sh
            script_dir / "orchestrator.sh",
            Path.cwd() / "orchestrator.sh",
            Path(__file__).parent.parent.parent.parent / "orchestrator.sh",  # geometry_os/session_rotator/orchestrator.sh
            Path(__file__).parent.parent.parent.parent.parent / "session_rotator" / "orchestrator.sh",
        ]

        orchestrator_script = None
        for p in possible_paths:
            if p.exists():
                orchestrator_script = p
                break

        if not orchestrator_script:
            raise FileNotFoundError("Could not find orchestrator.sh")

        env = os.environ.copy()
        env["CLI_COMMAND"] = self.cli_command
        env["MAX_SESSIONS"] = str(self.max_sessions)
        env["TOKEN_LIMIT"] = str(self.token_limit)
        env["SESSION_DIR"] = str(self.session_dir)
        if self.search_query:
            env["SEARCH_QUERY"] = self.search_query
        if self.continuous:
            env["CONTINUOUS_MODE"] = "1"

        self._process = subprocess.Popen(
            [str(orchestrator_script)],
            env=env,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            cwd=str(orchestrator_script.parent)
        )

        self.state.current_pid = self._process.pid
        self._save_state()

        return True

    def stop(self) -> bool:
        """Stop the orchestrator."""
        if self._process:
            self._process.terminate()
            try:
                self._process.wait(timeout=5)
            except subprocess.TimeoutExpired:
                self._process.kill()

        # Also kill any stray processes
        subprocess.run(["pkill", "-f", "orchestrator.sh"],
                      capture_output=True)
        subprocess.run(["pkill", "-f", "claude --"],
                      capture_output=True)

        self.state.status = SessionStatus.IDLE
        self.state.current_pid = None
        self._save_state()

        return True

    def get_status(self) -> Dict[str, Any]:
        """Get current orchestrator status."""
        # Load state from file first (most reliable)
        state_file = self.session_dir / "state.json"
        if state_file.exists():
            try:
                data = json.loads(state_file.read_text())
                self.state.session_count = data.get("session_count", 0)
                file_status = data.get("status", "idle")
                if file_status == "complete":
                    self.state.status = SessionStatus.COMPLETE
                elif file_status == "running":
                    self.state.status = SessionStatus.RUNNING
                else:
                    self.state.status = SessionStatus.IDLE
            except (json.JSONDecodeError, KeyError):
                pass

        # Check if orchestrator process is running
        result = subprocess.run(
            ["pgrep", "-f", "orchestrator.sh"],
            capture_output=True, text=True
        )
        if result.returncode == 0 and result.stdout.strip():
            self.state.status = SessionStatus.RUNNING
            self.state.orchestrator_pid = int(result.stdout.strip().split()[0])
        elif self.state.status == SessionStatus.RUNNING:
            # Process died but state wasn't updated
            self.state.status = SessionStatus.IDLE

        return {
            "status": self.state.status.value,
            "session_count": self.state.session_count,
            "orchestrator_pid": self.state.orchestrator_pid,
            "cli_pid": self._get_cli_pid(),
            "started_at": self.state.started_at,
            "uptime": time.time() - self.state.started_at if self.state.started_at else 0
        }

    def _get_cli_pid(self) -> Optional[int]:
        """Get the CLI process PID."""
        result = subprocess.run(
            ["pgrep", "-f", "claude --"],
            capture_output=True, text=True
        )
        if result.returncode == 0 and result.stdout.strip():
            return int(result.stdout.strip().split()[0])
        return None

    def get_logs(self, session_id: Optional[int] = None, tail: int = 50) -> str:
        """Get session logs."""
        logs_dir = self.session_dir / "logs"

        if session_id is not None:
            log_file = logs_dir / f"session_{session_id}.log"
            if log_file.exists():
                lines = log_file.read_text().splitlines()
                return "\n".join(lines[-tail:])
            return f"No log for session {session_id}"

        # Get all logs
        all_logs = []
        for log_file in sorted(logs_dir.glob("session_*.log")):
            content = log_file.read_text()
            if content.strip():
                all_logs.append(f"=== {log_file.name} ===\n{content[-2000:]}")

        return "\n\n".join(all_logs)

    def tail_logs(self, follow: bool = True):
        """Tail logs in real-time."""
        logs_dir = self.session_dir / "logs"

        if follow:
            # Use tail -f for live following
            subprocess.run([
                "tail", "-f", str(logs_dir / "*.log")
            ])
        else:
            print(self.get_logs())
