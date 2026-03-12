# GEOS DevOps CLI Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add test, daemon, check, and repl commands to the existing geos CLI for developer productivity.

**Architecture:** Extend existing argparse-based CLI with new subparsers. Each command group (test, daemon, check) lives in its own module under `geos/commands/`. Shared utilities (JSON output, test runner, daemon manager) live in `geos/utils/`.

**Tech Stack:** Python 3.10+, argparse, pytest, watchdog, prompt_toolkit, ruff, mypy

---

## Chunk 1: Foundation & Test Run Command

### Task 1: Setup Utils Module

**Files:**
- Create: `geos/utils/__init__.py`
- Create: `geos/utils/json_output.py`
- Test: `tests/geos/utils/test_json_output.py`

- [ ] **Step 1: Write failing test for json_output**

```python
# tests/geos/utils/test_json_output.py
import pytest
from geos.utils.json_output import format_json_output


def test_format_json_output_basic():
    """Test basic JSON formatting."""
    data = {"key": "value", "number": 42}
    result = format_json_output(data)
    assert result == '{"key": "value", "number": 42}'


def test_format_json_output_sorted():
    """Test JSON formatting with sorted keys."""
    data = {"z": 1, "a": 2}
    result = format_json_output(data, sort_keys=True)
    assert result == '{"a": 2, "z": 1}'
```

- [ ] **Step 2: Run test to verify it fails**

Run: `pytest tests/geos/utils/test_json_output.py -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'geos.utils'"

- [ ] **Step 3: Create utils package and implementation**

```python
# geos/utils/__init__.py
"""GEOS CLI utilities."""

from geos.utils.json_output import format_json_output

__all__ = ["format_json_output"]
```

```python
# geos/utils/json_output.py
"""JSON output formatting utilities."""

import json
from typing import Any


def format_json_output(data: dict[str, Any], sort_keys: bool = False) -> str:
    """
    Format data as JSON string.

    Args:
        data: Dictionary to format
        sort_keys: Whether to sort keys alphabetically

    Returns:
        JSON string representation
    """
    return json.dumps(data, sort_keys=sort_keys, separators=(",", ":"))
```

- [ ] **Step 4: Run test to verify it passes**

Run: `pytest tests/geos/utils/test_json_output.py -v`
Expected: PASS (2 tests)

- [ ] **Step 5: Commit**

```bash
git add geos/utils/__init__.py geos/utils/json_output.py tests/geos/utils/test_json_output.py
git commit -m "feat(geos): add json_output utility module"
```

---

### Task 2: Test Runner Utility

**Files:**
- Create: `geos/utils/test_runner.py`
- Test: `tests/geos/utils/test_test_runner.py`

- [ ] **Step 1: Write failing test for TestRunner**

```python
# tests/geos/utils/test_test_runner.py
import pytest
from pathlib import Path
from geos.utils.test_runner import TestRunner, TestResult


def test_test_runner_init():
    """Test TestRunner initialization."""
    runner = TestRunner()
    assert runner.pytest_args == []


def test_test_runner_with_path():
    """Test TestRunner with path scope."""
    runner = TestRunner(path="tests/geos")
    assert "tests/geos" in runner.pytest_args


def test_test_runner_with_scope_evolution():
    """Test TestRunner with evolution scope."""
    runner = TestRunner(scope="evolution")
    assert "tests/evolution_daemon" in runner.pytest_args


def test_test_runner_run_empty_path(tmp_path):
    """Test TestRunner returns empty result for no tests."""
    runner = TestRunner(path=str(tmp_path))
    result = runner.run()
    assert isinstance(result, TestResult)
    assert result.total == 0
    assert result.passed == 0
    assert result.failed == 0
```

- [ ] **Step 2: Run test to verify it fails**

Run: `pytest tests/geos/utils/test_test_runner.py -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'geos.utils.test_runner'"

- [ ] **Step 3: Create test_runner implementation**

```python
# geos/utils/test_runner.py
"""Pytest integration for geos test command."""

import subprocess
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any

# Scope to path mapping
SCOPE_PATHS = {
    "evolution": "tests/evolution_daemon",
    "swarm": "tests/swarm",
    "visual": "tests/visual_shell",
}


@dataclass
class TestResult:
    """Result of a test run."""

    total: int = 0
    passed: int = 0
    failed: int = 0
    duration_ms: float = 0.0
    results: list[dict[str, Any]] = field(default_factory=list)
    success: bool = True
    error: str | None = None


class TestRunner:
    """Wrapper around pytest for running tests."""

    def __init__(
        self,
        path: str | None = None,
        scope: str | None = None,
        failfast: bool = False,
        verbose: bool = False,
        json_output: bool = False,
    ):
        self.path = path
        self.scope = scope
        self.failfast = failfast
        self.verbose = verbose
        self.json_output = json_output
        self.pytest_args = self._build_args()

    def _build_args(self) -> list[str]:
        """Build pytest argument list."""
        args = ["pytest", "--tb=short", "-q"]

        # Determine test path
        if self.path:
            args.append(self.path)
        elif self.scope and self.scope in SCOPE_PATHS:
            args.append(SCOPE_PATHS[self.scope])
        else:
            args.append("tests")

        if self.failfast:
            args.append("-x")

        if self.verbose:
            args.append("-v")

        return args

    def run(self) -> TestResult:
        """Run tests and return results."""
        try:
            result = subprocess.run(
                self.pytest_args,
                capture_output=True,
                text=True,
                timeout=300,
            )

            # Parse pytest output
            return self._parse_output(result.stdout, result.returncode)
        except subprocess.TimeoutExpired:
            return TestResult(success=False, error="Test run timed out")
        except FileNotFoundError:
            return TestResult(
                success=False,
                error="pytest not found. Install with: pip install pytest",
            )

    def _parse_output(self, output: str, returncode: int) -> TestResult:
        """Parse pytest output into TestResult."""
        # Simple parsing - count passed/failed from summary line
        # Example: "3 passed, 1 failed in 0.12s"
        import re

        result = TestResult(success=returncode == 0)

        # Look for summary line
        match = re.search(r"(\d+) passed", output)
        if match:
            result.passed = int(match.group(1))

        match = re.search(r"(\d+) failed", output)
        if match:
            result.failed = int(match.group(1))
            result.success = False

        match = re.search(r"(\d+) error", output)
        if match:
            result.failed += int(match.group(1))
            result.success = False

        result.total = result.passed + result.failed

        # Parse duration
        match = re.search(r"in ([\d.]+)s", output)
        if match:
            result.duration_ms = float(match.group(1)) * 1000

        return result
```

- [ ] **Step 4: Run test to verify it passes**

Run: `pytest tests/geos/utils/test_test_runner.py -v`
Expected: PASS (4 tests)

- [ ] **Step 5: Commit**

```bash
git add geos/utils/test_runner.py tests/geos/utils/test_test_runner.py
git commit -m "feat(geos): add test_runner utility for pytest integration"
```

---

### Task 3: Test Command - Run Subcommand

**Files:**
- Create: `geos/commands/test.py`
- Modify: `geos/cli.py`
- Test: `tests/geos/commands/test_test.py`

- [ ] **Step 1: Write failing test for test command**

```python
# tests/geos/commands/test_test.py
import pytest
from argparse import Namespace
from geos.commands.test import run, create_parser


def test_create_parser():
    """Test test command parser creation."""
    parser = create_parser()
    assert parser is not None

    # Test parsing run subcommand
    args = parser.parse_args(["run", "tests/geos"])
    assert args.subcommand == "run"
    assert args.path == "tests/geos"


def test_run_with_json_flag():
    """Test test run with JSON output."""
    args = Namespace(
        subcommand="run",
        path=None,
        scope=None,
        json=True,
        failfast=False,
        verbose=False,
        all=False,
    )
    # This will run actual tests, so we just verify it returns int
    result = run(args)
    assert isinstance(result, int)


def test_run_with_scope():
    """Test test run with scope flag."""
    args = Namespace(
        subcommand="run",
        path=None,
        scope="evolution",
        json=False,
        failfast=False,
        verbose=False,
        all=False,
    )
    result = run(args)
    assert isinstance(result, int)
```

- [ ] **Step 2: Run test to verify it fails**

Run: `pytest tests/geos/commands/test_test.py -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'geos.commands.test'"

- [ ] **Step 3: Create test command implementation**

```python
# geos/commands/test.py
"""geos test - Test execution and repair commands."""

import argparse
import sys
from typing import int as Int

from geos.utils.json_output import format_json_output
from geos.utils.test_runner import TestRunner


def create_parser() -> argparse.ArgumentParser:
    """Create the test subcommand parser."""
    parser = argparse.ArgumentParser(
        prog="geos test",
        description="Run and manage tests",
    )

    subparsers = parser.add_subparsers(dest="subcommand", help="Test commands")

    # geos test run [path]
    p_run = subparsers.add_parser("run", help="Run tests")
    p_run.add_argument("path", nargs="?", help="Path to test file or directory")
    p_run.add_argument("--json", action="store_true", help="JSON output")
    p_run.add_argument("--evolution", dest="scope", action="store_const", const="evolution", help="Run evolution tests")
    p_run.add_argument("--swarm", dest="scope", action="store_const", const="swarm", help="Run swarm tests")
    p_run.add_argument("--visual", dest="scope", action="store_const", const="visual", help="Run visual_shell tests")
    p_run.add_argument("--all", action="store_true", help="Run all tests")
    p_run.add_argument("--failfast", "-x", action="store_true", help="Stop on first failure")
    p_run.add_argument("--verbose", "-v", action="store_true", help="Verbose output")

    # geos test watch [path]
    p_watch = subparsers.add_parser("watch", help="Watch mode - rerun on file changes")
    p_watch.add_argument("path", nargs="?", help="Path to watch")
    p_watch.add_argument("--json", action="store_true", help="JSON output")

    # geos test fix
    p_fix = subparsers.add_parser("fix", help="Auto-fix collection errors")
    p_fix.add_argument("path", nargs="?", help="Path to fix")

    # geos test coverage [path]
    p_cov = subparsers.add_parser("coverage", help="Show coverage report")
    p_cov.add_argument("path", nargs="?", help="Path to analyze")

    # geos test failed
    subparsers.add_parser("failed", help="Re-run failed tests from last run")

    return parser


def run(args: argparse.Namespace) -> Int:
    """Run the test command."""
    if args.subcommand is None or args.subcommand == "run":
        return _run_tests(args)
    elif args.subcommand == "watch":
        return _watch_tests(args)
    elif args.subcommand == "fix":
        return _fix_tests(args)
    elif args.subcommand == "coverage":
        return _run_coverage(args)
    elif args.subcommand == "failed":
        return _run_failed(args)
    return 0


def _run_tests(args: argparse.Namespace) -> Int:
    """Execute test run."""
    runner = TestRunner(
        path=args.path if hasattr(args, 'path') and args.path else None,
        scope=args.scope if hasattr(args, 'scope') else None,
        failfast=args.failfast if hasattr(args, 'failfast') else False,
        verbose=args.verbose if hasattr(args, 'verbose') else False,
        json_output=args.json if hasattr(args, 'json') else False,
    )

    result = runner.run()

    if args.json if hasattr(args, 'json') else False:
        output = {
            "command": "test",
            "scope": args.scope if hasattr(args, 'scope') else None,
            "total": result.total,
            "passed": result.passed,
            "failed": result.failed,
            "duration_ms": result.duration_ms,
            "success": result.success,
        }
        if result.error:
            output["error"] = result.error
        print(format_json_output(output))
    else:
        if result.error:
            print(f"Error: {result.error}", file=sys.stderr)
            return 3
        print(f"Tests: {result.passed} passed, {result.failed} failed ({result.duration_ms:.0f}ms)")

    return 0 if result.success else 1


def _watch_tests(args: argparse.Namespace) -> Int:
    """Watch for file changes and rerun tests. TODO: Implement in Phase 2."""
    print("Watch mode not yet implemented. Use: pytest --watch", file=sys.stderr)
    return 2


def _fix_tests(args: argparse.Namespace) -> Int:
    """Auto-fix collection errors. TODO: Implement in Phase 2."""
    print("Auto-fix not yet implemented.", file=sys.stderr)
    return 2


def _run_coverage(args: argparse.Namespace) -> Int:
    """Run coverage report. TODO: Implement in Phase 2."""
    print("Coverage not yet implemented. Use: pytest --cov", file=sys.stderr)
    return 2


def _run_failed(args: argparse.Namespace) -> Int:
    """Re-run failed tests. TODO: Implement in Phase 2."""
    print("Failed tests rerun not yet implemented. Use: pytest --lf", file=sys.stderr)
    return 2
```

- [ ] **Step 4: Update main CLI to include test command**

```python
# Modify geos/cli.py - add after line 40 (after inspect parser):

    # geos test
    from geos.commands.test import create_parser as create_test_parser
    p_test = subparsers.add_parser("test", help="Test execution and repair", add_help=False)
    p_test.add_argument("test_args", nargs=argparse.REMAINDER, help="Test command arguments")

# And in the command dispatch section (after line 60):
    elif args.command == "test":
        from geos.commands.test import create_parser, run as test_run
        test_parser = create_parser()
        test_args = test_parser.parse_args(args.test_args)
        return test_run(test_args)
```

- [ ] **Step 5: Run test to verify it passes**

Run: `pytest tests/geos/commands/test_test.py -v`
Expected: PASS (3 tests)

- [ ] **Step 6: Commit**

```bash
git add geos/commands/test.py geos/cli.py tests/geos/commands/test_test.py
git commit -m "feat(geos): add test run command with scope and json flags"
```

---

## Chunk 2: Daemon Management

### Task 4: Daemon Manager Utility

**Files:**
- Create: `geos/utils/daemon_mgr.py`
- Test: `tests/geos/utils/test_daemon_mgr.py`

- [ ] **Step 1: Write failing test for daemon manager**

```python
# tests/geos/utils/test_daemon_mgr.py
import os
import pytest
from pathlib import Path
from geos.utils.daemon_mgr import DaemonManager, DaemonInfo, DaemonStatus


def test_daemon_manager_discover():
    """Test daemon discovery."""
    mgr = DaemonManager()
    daemons = mgr.discover()
    assert isinstance(daemons, list)
    # Should find at least sisyphus and swarm
    names = [d.name for d in daemons]
    assert "sisyphus" in names or "swarm" in names


def test_daemon_info_dataclass():
    """Test DaemonInfo dataclass."""
    info = DaemonInfo(
        name="test",
        path="/path/to/daemon.py",
        pid_file="/tmp/test.pid",
    )
    assert info.name == "test"
    assert info.status == DaemonStatus.UNKNOWN


def test_daemon_status_from_pid_file(tmp_path):
    """Test reading status from PID file."""
    mgr = DaemonManager(pid_dir=tmp_path)

    # Create a PID file with current process
    pid_file = tmp_path / "test.pid"
    pid_file.write_text(str(os.getpid()))

    status = mgr._check_status(pid_file)
    assert status == DaemonStatus.RUNNING


def test_daemon_status_stale_pid(tmp_path):
    """Test detecting stale PID file."""
    mgr = DaemonManager(pid_dir=tmp_path)

    # Create a PID file with non-existent PID
    pid_file = tmp_path / "test.pid"
    pid_file.write_text("99999999")

    status = mgr._check_status(pid_file)
    assert status == DaemonStatus.STOPPED
```

- [ ] **Step 2: Run test to verify it fails**

Run: `pytest tests/geos/utils/test_daemon_mgr.py -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'geos.utils.daemon_mgr'"

- [ ] **Step 3: Create daemon manager implementation**

```python
# geos/utils/daemon_mgr.py
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
```

- [ ] **Step 4: Run test to verify it passes**

Run: `pytest tests/geos/utils/test_daemon_mgr.py -v`
Expected: PASS (4 tests)

- [ ] **Step 5: Commit**

```bash
git add geos/utils/daemon_mgr.py tests/geos/utils/test_daemon_mgr.py
git commit -m "feat(geos): add daemon_mgr utility for daemon lifecycle"
```

---

### Task 5: Daemon Command

**Files:**
- Create: `geos/commands/daemon.py`
- Modify: `geos/cli.py`
- Test: `tests/geos/commands/test_daemon.py`

- [ ] **Step 1: Write failing test for daemon command**

```python
# tests/geos/commands/test_daemon.py
import pytest
from argparse import Namespace
from geos.commands.daemon import run, create_parser


def test_create_parser():
    """Test daemon command parser creation."""
    parser = create_parser()
    assert parser is not None

    args = parser.parse_args(["status"])
    assert args.subcommand == "status"


def test_status_command():
    """Test daemon status command."""
    args = Namespace(
        subcommand="status",
        name=None,
        all=True,
        json=False,
    )
    result = run(args)
    assert isinstance(result, int)


def test_status_json():
    """Test daemon status with JSON output."""
    args = Namespace(
        subcommand="status",
        name=None,
        all=True,
        json=True,
    )
    result = run(args)
    assert isinstance(result, int)
```

- [ ] **Step 2: Run test to verify it fails**

Run: `pytest tests/geos/commands/test_daemon.py -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'geos.commands.daemon'"

- [ ] **Step 3: Create daemon command implementation**

```python
# geos/commands/daemon.py
"""geos daemon - Daemon lifecycle management commands."""

import argparse
import sys
from typing import int as Int

from geos.utils.daemon_mgr import DaemonManager, DaemonStatus
from geos.utils.json_output import format_json_output


def create_parser() -> argparse.ArgumentParser:
    """Create the daemon subcommand parser."""
    parser = argparse.ArgumentParser(
        prog="geos daemon",
        description="Manage daemon lifecycle",
    )

    subparsers = parser.add_subparsers(dest="subcommand", help="Daemon commands")

    # geos daemon start <name>
    p_start = subparsers.add_parser("start", help="Start a daemon")
    p_start.add_argument("name", help="Daemon name (sisyphus, evolution, swarm)")
    p_start.add_argument("--all", action="store_true", help="Start all daemons")

    # geos daemon stop <name>
    p_stop = subparsers.add_parser("stop", help="Stop a daemon")
    p_stop.add_argument("name", help="Daemon name")
    p_stop.add_argument("--all", action="store_true", help="Stop all daemons")

    # geos daemon status [name]
    p_status = subparsers.add_parser("status", help="Show daemon status")
    p_status.add_argument("name", nargs="?", help="Daemon name (all if not specified)")
    p_status.add_argument("--all", action="store_true", help="Show all daemons")
    p_status.add_argument("--json", action="store_true", help="JSON output")

    # geos daemon logs <name>
    p_logs = subparsers.add_parser("logs", help="Tail daemon logs")
    p_logs.add_argument("name", help="Daemon name")
    p_logs.add_argument("--follow", "-f", action="store_true", help="Follow log output")

    # geos daemon restart <name>
    p_restart = subparsers.add_parser("restart", help="Restart a daemon")
    p_restart.add_argument("name", help="Daemon name")

    return parser


def run(args: argparse.Namespace) -> Int:
    """Run the daemon command."""
    if args.subcommand == "start":
        return _start_daemon(args)
    elif args.subcommand == "stop":
        return _stop_daemon(args)
    elif args.subcommand == "status":
        return _status_daemon(args)
    elif args.subcommand == "logs":
        return _logs_daemon(args)
    elif args.subcommand == "restart":
        return _restart_daemon(args)
    return 0


def _start_daemon(args: argparse.Namespace) -> Int:
    """Start daemon(s)."""
    mgr = DaemonManager()

    if getattr(args, 'all', False):
        daemons = mgr.discover()
        for d in daemons:
            success, msg = mgr.start(d.name)
            print(msg)
        return 0

    success, msg = mgr.start(args.name)
    print(msg)
    return 0 if success else 1


def _stop_daemon(args: argparse.Namespace) -> Int:
    """Stop daemon(s)."""
    mgr = DaemonManager()

    if getattr(args, 'all', False):
        daemons = mgr.discover()
        for d in daemons:
            success, msg = mgr.stop(d.name)
            print(msg)
        return 0

    success, msg = mgr.stop(args.name)
    print(msg)
    return 0 if success else 1


def _status_daemon(args: argparse.Namespace) -> Int:
    """Show daemon status."""
    mgr = DaemonManager()
    json_out = getattr(args, 'json', False)

    if args.name:
        info = mgr.status(args.name)
        if info is None:
            print(f"Daemon '{args.name}' not found", file=sys.stderr)
            return 1
        infos = [info]
    else:
        infos = mgr.discover()

    if json_out:
        output = {
            "command": "daemon",
            "subcommand": "status",
            "daemons": [
                {
                    "name": d.name,
                    "status": d.status.value,
                    "pid": d.pid,
                }
                for d in infos
            ]
        }
        print(format_json_output(output))
    else:
        for d in infos:
            status_icon = "●" if d.status == DaemonStatus.RUNNING else "○"
            pid_str = f"pid: {d.pid}" if d.pid else ""
            print(f"{d.name:<12} {status_icon} {d.status.value:<8} {pid_str}")

    return 0


def _logs_daemon(args: argparse.Namespace) -> Int:
    """Tail daemon logs. TODO: Implement log file discovery."""
    print(f"Logs for {args.name} not yet implemented.", file=sys.stderr)
    print("Check .geometry/logs/ for daemon logs.", file=sys.stderr)
    return 2


def _restart_daemon(args: argparse.Namespace) -> Int:
    """Restart a daemon."""
    mgr = DaemonManager()

    # Stop then start
    success, msg = mgr.stop(args.name)
    if success:
        print(msg)
    success, msg = mgr.start(args.name)
    print(msg)
    return 0 if success else 1
```

- [ ] **Step 4: Update main CLI to include daemon command**

Add to `geos/cli.py` after the test command section:

```python
    # geos daemon
    p_daemon = subparsers.add_parser("daemon", help="Daemon lifecycle management", add_help=False)
    p_daemon.add_argument("daemon_args", nargs=argparse.REMAINDER, help="Daemon command arguments")
```

And in the dispatch section:

```python
    elif args.command == "daemon":
        from geos.commands.daemon import create_parser, run as daemon_run
        daemon_parser = create_parser()
        daemon_args = daemon_parser.parse_args(args.daemon_args)
        return daemon_run(daemon_args)
```

- [ ] **Step 5: Run test to verify it passes**

Run: `pytest tests/geos/commands/test_daemon.py -v`
Expected: PASS (3 tests)

- [ ] **Step 6: Commit**

```bash
git add geos/commands/daemon.py geos/cli.py tests/geos/commands/test_daemon.py
git commit -m "feat(geos): add daemon command for lifecycle management"
```

---


## Chunk 3: Code Quality (Check Command)

### Task 6: Check Command

**Files:**
- Create: `geos/commands/check.py`
- Modify: `geos/cli.py`
- Test: `tests/geos/commands/test_check.py`

- [ ] **Step 1: Write failing test for check command**

```python
# tests/geos/commands/test_check.py
import pytest
from argparse import Namespace
from geos.commands.check import run, create_parser


def test_create_parser():
    """Test check command parser creation."""
    parser = create_parser()
    assert parser is not None

    args = parser.parse_args(["lint"])
    assert args.subcommand == "lint"


def test_lint_command():
    """Test check lint command."""
    args = Namespace(
        subcommand="lint",
        path=None,
        fix=False,
        json=False,
    )
    result = run(args)
    assert isinstance(result, int)


def test_types_command():
    """Test check types command."""
    args = Namespace(
        subcommand="types",
        path=None,
        fix=False,
        json=False,
    )
    result = run(args)
    assert isinstance(result, int)
```

- [ ] **Step 2: Run test to verify it fails**

Run: `pytest tests/geos/commands/test_check.py -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'geos.commands.check'"

- [ ] **Step 3: Create check command implementation**

```python
# geos/commands/check.py
"""geos check - Code quality commands."""

import argparse
import subprocess
import sys
from typing import int as Int

from geos.utils.json_output import format_json_output


def create_parser() -> argparse.ArgumentParser:
    """Create the check subcommand parser."""
    parser = argparse.ArgumentParser(
        prog="geos check",
        description="Code quality checks",
    )

    subparsers = parser.add_subparsers(dest="subcommand", help="Check commands")

    # geos check lint [path]
    p_lint = subparsers.add_parser("lint", help="Run linting")
    p_lint.add_argument("path", nargs="?", default=".", help="Path to check")
    p_lint.add_argument("--fix", action="store_true", help="Auto-fix issues")
    p_lint.add_argument("--json", action="store_true", help="JSON output")

    # geos check types [path]
    p_types = subparsers.add_parser("types", help="Run type checking")
    p_types.add_argument("path", nargs="?", default=".", help="Path to check")
    p_types.add_argument("--json", action="store_true", help="JSON output")

    # geos check imports [path]
    p_imports = subparsers.add_parser("imports", help="Check import organization")
    p_imports.add_argument("path", nargs="?", default=".", help="Path to check")
    p_imports.add_argument("--fix", action="store_true", help="Auto-fix issues")

    # geos check all [path]
    p_all = subparsers.add_parser("all", help="Run all checks")
    p_all.add_argument("path", nargs="?", default=".", help="Path to check")
    p_all.add_argument("--fix", action="store_true", help="Auto-fix issues")
    p_all.add_argument("--json", action="store_true", help="JSON output")

    return parser


def run(args: argparse.Namespace) -> Int:
    """Run the check command."""
    if args.subcommand == "lint":
        return _run_lint(args)
    elif args.subcommand == "types":
        return _run_types(args)
    elif args.subcommand == "imports":
        return _run_imports(args)
    elif args.subcommand == "all":
        return _run_all(args)
    return 0


def _run_lint(args: argparse.Namespace) -> Int:
    """Run ruff linting."""
    cmd = ["ruff", "check", args.path or "."]
    if args.fix:
        cmd.append("--fix")

    try:
        result = subprocess.run(cmd, capture_output=True, text=True)
        if args.json:
            # Parse ruff output to JSON
            output = {
                "command": "check",
                "subcommand": "lint",
                "path": args.path,
                "success": result.returncode == 0,
                "output": result.stdout,
            }
            print(format_json_output(output))
        else:
            print(result.stdout)
            if result.stderr:
                print(result.stderr, file=sys.stderr)
        return result.returncode
    except FileNotFoundError:
        print("ruff not found. Install with: pip install ruff", file=sys.stderr)
        return 3


def _run_types(args: argparse.Namespace) -> Int:
    """Run mypy type checking."""
    cmd = ["mypy", args.path or "."]

    try:
        result = subprocess.run(cmd, capture_output=True, text=True)
        if args.json:
            output = {
                "command": "check",
                "subcommand": "types",
                "path": args.path,
                "success": result.returncode == 0,
                "output": result.stdout,
            }
            print(format_json_output(output))
        else:
            print(result.stdout)
            if result.stderr:
                print(result.stderr, file=sys.stderr)
        return result.returncode
    except FileNotFoundError:
        print("mypy not found. Install with: pip install mypy", file=sys.stderr)
        return 3


def _run_imports(args: argparse.Namespace) -> Int:
    """Check import organization using ruff."""
    cmd = ["ruff", "check", "--select", "I", args.path or "."]
    if args.fix:
        cmd.append("--fix")

    try:
        result = subprocess.run(cmd, capture_output=True, text=True)
        print(result.stdout)
        return result.returncode
    except FileNotFoundError:
        print("ruff not found. Install with: pip install ruff", file=sys.stderr)
        return 3


def _run_all(args: argparse.Namespace) -> Int:
    """Run all checks."""
    exit_code = 0

    print("=== Lint ===")
    lint_result = _run_lint(args)
    exit_code = max(exit_code, lint_result)

    print("\n=== Types ===")
    types_result = _run_types(args)
    exit_code = max(exit_code, types_result)

    print("\n=== Imports ===")
    imports_result = _run_imports(args)
    exit_code = max(exit_code, imports_result)

    return exit_code
```

- [ ] **Step 4: Update main CLI to include check command**

Add to `geos/cli.py`:

```python
    # geos check
    p_check = subparsers.add_parser("check", help="Code quality checks", add_help=False)
    p_check.add_argument("check_args", nargs=argparse.REMAINDER, help="Check command arguments")
```

And in dispatch:

```python
    elif args.command == "check":
        from geos.commands.check import create_parser, run as check_run
        check_parser = create_parser()
        check_args = check_parser.parse_args(args.check_args)
        return check_run(check_args)
```

- [ ] **Step 5: Run test to verify it passes**

Run: `pytest tests/geos/commands/test_check.py -v`
Expected: PASS (3 tests)

- [ ] **Step 6: Commit**

```bash
git add geos/commands/check.py geos/cli.py tests/geos/commands/test_check.py
git commit -m "feat(geos): add check command for lint, types, imports"
```

---

## Chunk 4: REPL

### Task 7: REPL Command

**Files:**
- Create: `geos/commands/repl.py`
- Modify: `geos/cli.py`
- Test: `tests/geos/commands/test_repl.py`

- [ ] **Step 1: Write failing test for repl command**

```python
# tests/geos/commands/test_repl.py
import pytest
from argparse import Namespace
from geos.commands.repl import create_parser


def test_create_parser():
    """Test repl command parser creation."""
    parser = create_parser()
    assert parser is not None


def test_repl_banner(capsys):
    """Test REPL banner output."""
    from geos.commands.repl import print_banner
    print_banner()
    captured = capsys.readouterr()
    assert "GEOS DevOps CLI" in captured.out
```

- [ ] **Step 2: Run test to verify it fails**

Run: `pytest tests/geos/commands/test_repl.py -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'geos.commands.repl'"

- [ ] **Step 3: Create repl command implementation**

```python
# geos/commands/repl.py
"""geos repl - Interactive DevOps shell."""

import argparse
import sys
from typing import int as Int

try:
    from prompt_toolkit import PromptSession
    from prompt_toolkit.history import FileHistory
    from prompt_toolkit.auto_suggest import AutoSuggestFromHistory
    HAS_PROMPT_TOOLKIT = True
except ImportError:
    HAS_PROMPT_TOOLKIT = False

from geos.utils.json_output import format_json_output

__version__ = "1.0.0"


def create_parser() -> argparse.ArgumentParser:
    """Create the repl subcommand parser."""
    parser = argparse.ArgumentParser(
        prog="geos repl",
        description="Interactive DevOps shell",
    )
    return parser


def run(args: argparse.Namespace) -> Int:
    """Run the REPL."""
    print_banner()

    if not HAS_PROMPT_TOOLKIT:
        print("Warning: prompt_toolkit not installed. Using basic REPL.", file=sys.stderr)
        print("Install with: pip install prompt_toolkit", file=sys.stderr)
        return _basic_repl()

    return _prompt_toolkit_repl()


def print_banner() -> None:
    """Print REPL banner."""
    print(f"GEOS DevOps CLI v{__version__}")
    print("Type 'help' for commands, 'exit' to quit.")
    print()


def _prompt_toolkit_repl() -> Int:
    """REPL with prompt_toolkit features."""
    history_file = ".geometry/repl_history"
    
    session: PromptSession = PromptSession(
        history=FileHistory(history_file),
        auto_suggest=AutoSuggestFromHistory(),
    )

    while True:
        try:
            line = session.prompt("geos> ").strip()
        except KeyboardInterrupt:
            print()
            continue
        except EOFError:
            print("exit")
            break

        if not line:
            continue

        if line in ("exit", "quit", "q"):
            break

        if line == "help":
            _print_help()
            continue

        # Parse and execute command
        _execute_command(line)

    return 0


def _basic_repl() -> Int:
    """Basic REPL without prompt_toolkit."""
    while True:
        try:
            line = input("geos> ").strip()
        except KeyboardInterrupt:
            print()
            continue
        except EOFError:
            print("exit")
            break

        if not line:
            continue

        if line in ("exit", "quit", "q"):
            break

        if line == "help":
            _print_help()
            continue

        _execute_command(line)

    return 0


def _print_help() -> None:
    """Print help message."""
    print("Commands:")
    print("  test [args]     Run tests")
    print("  daemon [args]   Manage daemons")
    print("  check [args]    Code quality checks")
    print("  help            Show this help")
    print("  exit            Exit REPL")
    print()


def _execute_command(line: str) -> None:
    """Execute a command line."""
    parts = line.split()
    if not parts:
        return

    command = parts[0]
    args = parts[1:]

    if command == "test":
        _run_test(args)
    elif command == "daemon":
        _run_daemon(args)
    elif command == "check":
        _run_check(args)
    else:
        print(f"Unknown command: {command}", file=sys.stderr)


def _run_test(args: list[str]) -> None:
    """Run test command in REPL."""
    from geos.commands.test import create_parser, run as test_run
    parser = create_parser()
    try:
        parsed = parser.parse_args(args)
        test_run(parsed)
    except SystemExit:
        pass  # argparse calls exit on error


def _run_daemon(args: list[str]) -> None:
    """Run daemon command in REPL."""
    from geos.commands.daemon import create_parser, run as daemon_run
    parser = create_parser()
    try:
        parsed = parser.parse_args(args)
        daemon_run(parsed)
    except SystemExit:
        pass


def _run_check(args: list[str]) -> None:
    """Run check command in REPL."""
    from geos.commands.check import create_parser, run as check_run
    parser = create_parser()
    try:
        parsed = parser.parse_args(args)
        check_run(parsed)
    except SystemExit:
        pass
```

- [ ] **Step 4: Update main CLI to include repl command**

Add to `geos/cli.py`:

```python
    # geos repl
    subparsers.add_parser("repl", help="Interactive DevOps shell")
```

And in dispatch:

```python
    elif args.command == "repl":
        from geos.commands.repl import run as repl_run
        return repl_run(args)
```

- [ ] **Step 5: Run test to verify it passes**

Run: `pytest tests/geos/commands/test_repl.py -v`
Expected: PASS (2 tests)

- [ ] **Step 6: Commit**

```bash
git add geos/commands/repl.py geos/cli.py tests/geos/commands/test_repl.py
git commit -m "feat(geos): add repl command for interactive DevOps shell"
```

---

## Summary

**Files Created:**
- `geos/utils/__init__.py`
- `geos/utils/json_output.py`
- `geos/utils/test_runner.py`
- `geos/utils/daemon_mgr.py`
- `geos/commands/test.py`
- `geos/commands/daemon.py`
- `geos/commands/check.py`
- `geos/commands/repl.py`
- `tests/geos/utils/test_json_output.py`
- `tests/geos/utils/test_test_runner.py`
- `tests/geos/utils/test_daemon_mgr.py`
- `tests/geos/commands/test_test.py`
- `tests/geos/commands/test_daemon.py`
- `tests/geos/commands/test_check.py`
- `tests/geos/commands/test_repl.py`

**Files Modified:**
- `geos/cli.py` - Add new subparsers and dispatch

**Usage Examples:**
```bash
# Test commands
geos test run --evolution
geos test run tests/swarm --json
geos test watch

# Daemon commands
geos daemon status --all
geos daemon start sisyphus
geos daemon stop evolution

# Check commands
geos check lint --fix
geos check types
geos check all

# REPL
geos repl
```
