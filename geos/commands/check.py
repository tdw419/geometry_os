"""geos check - Code quality commands."""

import argparse
import subprocess
import sys

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


def run(args: argparse.Namespace) -> int:
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


def _run_lint(args: argparse.Namespace) -> int:
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


def _run_types(args: argparse.Namespace) -> int:
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


def _run_imports(args: argparse.Namespace) -> int:
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


def _run_all(args: argparse.Namespace) -> int:
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