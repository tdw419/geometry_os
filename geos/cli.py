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

    return 0


if __name__ == "__main__":
    sys.exit(main())
