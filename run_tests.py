#!/usr/bin/env python3
"""
Geometry OS Comprehensive Test Runner

A unified test runner with support for:
- Parallel execution
- Coverage reporting
- Async test support
- Multiple output formats
- CI integration

Usage:
    python run_tests.py                    # Run all unit tests
    python run_tests.py --all              # Run all tests including slow/integration
    python run_tests.py --coverage         # Generate coverage report
    python run_tests.py --parallel 4       # Run with 4 workers
    python run_tests.py --ci               # CI mode with JUnit XML output
    python run_tests.py --html             # Generate HTML test report
"""

import argparse
import os
import subprocess
import sys
from pathlib import Path

# Project paths
PROJECT_ROOT = Path(__file__).parent
TESTS_DIR = PROJECT_ROOT / "tests"
COVERAGE_DIR = PROJECT_ROOT / "htmlcov"


def run_command(cmd: list[str], *, check: bool = True) -> subprocess.CompletedProcess:
    """Run a command and return the result."""
    print(f"Running: {' '.join(cmd)}")
    return subprocess.run(cmd, check=check, cwd=PROJECT_ROOT)


def run_tests(
    test_paths: list[str] | None = None,
    *,
    markers: str | None = None,
    exclude_markers: str | None = None,
    parallel: int | None = None,
    coverage: bool = False,
    html_report: bool = False,
    junit_xml: bool = False,
    json_report: bool = False,
    verbose: bool = True,
    fail_fast: bool = False,
    coverage_fail_under: int | None = None,
    extra_args: list[str] | None = None,
) -> int:
    """Run pytest with specified options.

    Returns:
        Exit code from pytest (0 = success)
    """
    cmd = [sys.executable, "-m", "pytest"]

    # Test paths
    has_test_paths = False
    if test_paths:
        cmd.extend(test_paths)
        has_test_paths = True
    elif extra_args:
        # Check if extra_args contains test paths
        for arg in extra_args:
            if arg.endswith(".py") or "test_" in arg or Path(arg).is_dir():
                has_test_paths = True
                break

    if not has_test_paths:
        cmd.append(str(TESTS_DIR))

    # Verbosity
    if verbose:
        cmd.append("-v")

    # Fail fast
    if fail_fast:
        cmd.append("-x")

    # Markers
    if markers:
        cmd.extend(["-m", markers])
    elif exclude_markers:
        cmd.extend(["-m", f"not {exclude_markers}"])

    # Parallel execution
    if parallel:
        cmd.extend(["-n", str(parallel), "--dist", "loadscope"])

    # Async mode
    cmd.extend(["--asyncio-mode=auto"])

    # Coverage
    if coverage:
        cmd.extend([
            "--cov=systems",
            "--cov=core",
            "--cov-report=term-missing:skip-covered",
            "--cov-report=html:htmlcov",
            "--cov-report=json:coverage.json",
        ])
        if coverage_fail_under:
            cmd.extend([f"--cov-fail-under={coverage_fail_under}"])

    # Reports
    if html_report:
        cmd.extend([
            "--html=test-report.html",
            "--self-contained-html",
        ])

    if junit_xml:
        cmd.extend(["--junitxml=junit.xml"])

    if json_report:
        cmd.extend(["--json-report", "--json-report-file=test-report.json"])

    # Extra arguments
    if extra_args:
        cmd.extend(extra_args)

    # Short traceback
    cmd.extend(["--tb=short"])

    # Strict markers
    cmd.append("--strict-markers")

    try:
        result = run_command(cmd, check=False)
        return result.returncode
    except KeyboardInterrupt:
        print("\n\nTest run interrupted by user.")
        return 130


def run_unit_tests(parallel: int | None = None, coverage: bool = False) -> int:
    """Run fast unit tests only."""
    print("=" * 60)
    print("Running Unit Tests (fast)")
    print("=" * 60)
    return run_tests(
        markers="not integration and not slow",
        parallel=parallel,
        coverage=coverage,
    )


def run_integration_tests(parallel: int | None = None, coverage: bool = False) -> int:
    """Run integration tests."""
    print("=" * 60)
    print("Running Integration Tests")
    print("=" * 60)
    return run_tests(
        markers="integration",
        parallel=parallel,
        coverage=coverage,
    )


def run_all_tests(
    parallel: int | None = None,
    coverage: bool = False,
    coverage_fail_under: int | None = None,
) -> int:
    """Run all tests."""
    print("=" * 60)
    print("Running All Tests")
    print("=" * 60)
    return run_tests(
        parallel=parallel,
        coverage=coverage,
        coverage_fail_under=coverage_fail_under,
    )


def run_async_tests(parallel: int | None = None, coverage: bool = False) -> int:
    """Run async tests only."""
    print("=" * 60)
    print("Running Async Tests")
    print("=" * 60)
    return run_tests(
        extra_args=["-k", "async"],
        parallel=parallel,
        coverage=coverage,
    )


def run_ci_tests() -> int:
    """Run tests in CI mode with all reports."""
    print("=" * 60)
    print("Running CI Tests")
    print("=" * 60)
    return run_tests(
        markers="not slow",
        parallel=os.cpu_count(),
        coverage=True,
        junit_xml=True,
        json_report=True,
        coverage_fail_under=30,
    )


def main() -> int:
    """Main entry point."""
    parser = argparse.ArgumentParser(
        description="Geometry OS Test Runner",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python run_tests.py                    # Run unit tests
  python run_tests.py --all              # Run all tests
  python run_tests.py --integration      # Run integration tests
  python run_tests.py --async            # Run async tests
  python run_tests.py --coverage         # Run with coverage
  python run_tests.py --parallel 4       # Run with 4 workers
  python run_tests.py --ci               # CI mode
  python run_tests.py --html             # Generate HTML report
        """,
    )

    # Test selection
    parser.add_argument(
        "--all",
        action="store_true",
        help="Run all tests (including slow/integration)",
    )
    parser.add_argument(
        "--unit",
        action="store_true",
        help="Run unit tests only (default)",
    )
    parser.add_argument(
        "--integration",
        action="store_true",
        help="Run integration tests only",
    )
    parser.add_argument(
        "--async",
        dest="async_tests",
        action="store_true",
        help="Run async tests only",
    )
    parser.add_argument(
        "--ci",
        action="store_true",
        help="Run in CI mode (generates all reports)",
    )

    # Execution options
    parser.add_argument(
        "-n",
        "--parallel",
        type=str,
        metavar="N",
        help="Run tests in parallel with N workers (use 'auto' for CPU count)",
    )
    parser.add_argument(
        "-x",
        "--fail-fast",
        action="store_true",
        help="Stop on first failure",
    )

    # Coverage options
    parser.add_argument(
        "--coverage",
        action="store_true",
        help="Generate coverage report",
    )
    parser.add_argument(
        "--coverage-fail-under",
        type=int,
        metavar="N",
        default=None,
        help="Fail if coverage is below N percent",
    )

    # Report options
    parser.add_argument(
        "--html",
        action="store_true",
        help="Generate HTML test report",
    )
    parser.add_argument(
        "--junit",
        action="store_true",
        help="Generate JUnit XML report",
    )
    parser.add_argument(
        "--json",
        action="store_true",
        help="Generate JSON test report",
    )

    # Verbosity
    parser.add_argument(
        "-v",
        "--verbose",
        action="store_true",
        default=True,
        help="Verbose output (default)",
    )
    parser.add_argument(
        "-q",
        "--quiet",
        action="store_true",
        help="Quiet output",
    )

    # Extra pytest arguments
    parser.add_argument(
        "extra_args",
        nargs="*",
        help="Extra arguments passed to pytest",
    )

    args = parser.parse_args()

    # Determine parallel workers
    parallel = None
    if args.parallel:
        if args.parallel.lower() == "auto":
            parallel = os.cpu_count()
        else:
            try:
                parallel = int(args.parallel)
            except ValueError:
                print(f"Invalid parallel value: {args.parallel}")
                return 1
    elif args.ci:
        parallel = os.cpu_count()

    # CI mode implies coverage and reports
    if args.ci:
        return run_ci_tests()

    # Run appropriate test suite
    if args.all:
        return run_all_tests(
            parallel=parallel,
            coverage=args.coverage,
            coverage_fail_under=args.coverage_fail_under,
        )
    elif args.integration:
        return run_integration_tests(parallel=parallel, coverage=args.coverage)
    elif args.async_tests:
        return run_async_tests(parallel=parallel, coverage=args.coverage)
    else:
        # Default: run unit tests
        return run_tests(
            markers="not integration and not slow",
            parallel=parallel,
            coverage=args.coverage,
            html_report=args.html,
            junit_xml=args.junit,
            json_report=args.json,
            verbose=not args.quiet,
            fail_fast=args.fail_fast,
            coverage_fail_under=args.coverage_fail_under,
            extra_args=args.extra_args if args.extra_args else None,
        )


if __name__ == "__main__":
    sys.exit(main())
