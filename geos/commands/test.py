"""geos test - Test execution and repair commands."""

import argparse
import sys
from typing import Dict, Any

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


def run(args: argparse.Namespace) -> int:
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


def _run_tests(args: argparse.Namespace) -> int:
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


def _watch_tests(args: argparse.Namespace) -> int:
    """Watch for file changes and rerun tests. TODO: Implement in Phase 2."""
    print("Watch mode not yet implemented. Use: pytest --watch", file=sys.stderr)
    return 2


def _fix_tests(args: argparse.Namespace) -> int:
    """Auto-fix collection errors. TODO: Implement in Phase 2."""
    print("Auto-fix not yet implemented.", file=sys.stderr)
    return 2


def _run_coverage(args: argparse.Namespace) -> int:
    """Run coverage report. TODO: Implement in Phase 2."""
    print("Coverage not yet implemented. Use: pytest --cov", file=sys.stderr)
    return 2


def _run_failed(args: argparse.Namespace) -> int:
    """Re-run failed tests. TODO: Implement in Phase 2."""
    print("Failed tests rerun not yet implemented. Use: pytest --lf", file=sys.stderr)
    return 2