"""geos repl - Interactive DevOps shell."""

import argparse
import sys

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


def run(args: argparse.Namespace) -> int:
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


def _prompt_toolkit_repl() -> int:
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


def _basic_repl() -> int:
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