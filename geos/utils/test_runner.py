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