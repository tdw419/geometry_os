#!/usr/bin/env python3
"""GEOS CLI - Neural Bridge for Geometry OS."""

import argparse
import sys
from pathlib import Path

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent))

__version__ = "0.1.0"


def main():
    """Main entry point for geos CLI."""
    parser = argparse.ArgumentParser(
        prog="geos",
        description="Geometry OS Neural Bridge - Conversational CLI for autopilot collaboration",
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument("--version", action="version", version=f"%(prog)s {__version__}")

    subparsers = parser.add_subparsers(dest="command", help="Available commands")

    # geos status
    subparsers.add_parser("status", help="Show system health check")

    # geos chat
    subparsers.add_parser("chat", help="Start conversational REPL")

    # geos map
    p_map = subparsers.add_parser("map", help="ASCII map visualization")
    p_map.add_argument("--view", choices=["thoughts", "districts", "mutations"], default="districts")
    p_map.add_argument("--zoom", type=int, default=1, choices=[1, 2, 3, 4])
    p_map.add_argument("--watch", action="store_true", help="Live update every 2s")

    # geos inspect
    p_inspect = subparsers.add_parser("inspect", help="Inspect Hilbert sector")
    p_inspect.add_argument("address", help="Hilbert address (e.g., 0x8000)")
    p_inspect.add_argument("--format", choices=["rts", "raw"], default="rts")

    # geos test
    p_test = subparsers.add_parser("test", help="Test execution and repair", add_help=False)
    p_test.add_argument("test_args", nargs=argparse.REMAINDER, help="Test command arguments")

    # geos check
    p_check = subparsers.add_parser("check", help="Code quality checks", add_help=False)
    p_check.add_argument("check_args", nargs=argparse.REMAINDER, help="Check command arguments")

    # geos daemon
    p_daemon = subparsers.add_parser("daemon", help="Manage daemon lifecycle (start/stop/status/logs)", add_help=False)
    p_daemon.add_argument("daemon_args", nargs=argparse.REMAINDER, help="Daemon command arguments")

    # geos repl
    subparsers.add_parser("repl", help="Interactive DevOps shell")

    args = parser.parse_args()

    if args.command is None:
        parser.print_help()
        return 0

    # Import and run command
    if args.command == "status":
        from geos.commands.status import run
        return run(args)
    elif args.command == "chat":
        from geos.commands.chat import run
        return run(args)
    elif args.command == "map":
        from geos.commands.map import run
        return run(args)
    elif args.command == "inspect":
        from geos.commands.inspect import run
        return run(args)
    elif args.command == "test":
        from geos.commands.test import create_parser, run as test_run
        test_parser = create_parser()
        test_args = test_parser.parse_args(args.test_args)
        return test_run(test_args)
    elif args.command == "check":
        from geos.commands.check import create_parser, run as check_run
        check_parser = create_parser()
        check_args = check_parser.parse_args(args.check_args)
        return check_run(check_args)
    elif args.command == "daemon":
        from geos.commands.daemon import create_parser, run as daemon_run
        daemon_parser = create_parser()
        daemon_args = daemon_parser.parse_args(args.daemon_args)
        return daemon_run(daemon_args)
    elif args.command == "repl":
        from geos.commands.repl import run as repl_run
        return repl_run(args)

    return 0


if __name__ == "__main__":
    sys.exit(main())
