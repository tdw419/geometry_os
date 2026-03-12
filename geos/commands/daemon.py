"""Daemon management command for GEOS CLI."""

import json
import sys
from argparse import Namespace
from pathlib import Path

from geos.utils.daemon_mgr import DaemonManager, DaemonStatus


def create_parser():
    """Create parser for daemon command."""
    import argparse

    parser = argparse.ArgumentParser(
        prog="geos daemon",
        description="Manage daemon lifecycle (start/stop/status/logs)"
    )

    subparsers = parser.add_subparsers(
        dest="subcommand",
        help="Subcommand",
        required=True
    )

    # Status subcommand
    status_parser = subparsers.add_parser(
        "status",
        help="Show daemon status"
    )
    status_parser.add_argument(
        "-n", "--name",
        help="Specific daemon name",
        type=str,
        default=None
    )
    status_parser.add_argument(
        "-a", "--all",
        help="Show status of all daemons",
        action="store_true",
        default=False
    )
    status_parser.add_argument(
        "-j", "--json",
        help="Output in JSON format",
        action="store_true",
        default=False
    )

    # Start subcommand
    start_parser = subparsers.add_parser(
        "start",
        help="Start a daemon"
    )
    start_parser.add_argument(
        "name",
        help="Daemon name to start",
        choices=["sisyphus", "swarm", "evolution"]
    )

    # Stop subcommand
    stop_parser = subparsers.add_parser(
        "stop",
        help="Stop a daemon"
    )
    stop_parser.add_argument(
        "name",
        help="Daemon name to stop",
        choices=["sisyphus", "swarm", "evolution"]
    )

    # Logs subcommand
    logs_parser = subparsers.add_parser(
        "logs",
        help="Show daemon logs"
    )
    logs_parser.add_argument(
        "name",
        help="Daemon name",
        choices=["sisyphus", "swarm", "evolution"]
    )
    logs_parser.add_argument(
        "-f", "--follow",
        help="Follow log output",
        action="store_true",
        default=False
    )
    logs_parser.add_argument(
        "-t", "--tail",
        help="Number of lines to show",
        type=int,
        default=100
    )

    return parser


def run(args: Namespace) -> int:
    """Run daemon command."""
    mgr = DaemonManager()

    if args.subcommand == "status":
        return run_status(mgr, args)
    elif args.subcommand == "start":
        return run_start(mgr, args)
    elif args.subcommand == "stop":
        return run_stop(mgr, args)
    elif args.subcommand == "logs":
        return run_logs(mgr, args)
    else:
        print(f"Unknown subcommand: {args.subcommand}")
        return 1


def run_status(mgr: DaemonManager, args: Namespace) -> int:
    """Handle status subcommand."""
    if args.name:
        # Single daemon status
        info = mgr.status(args.name)
        if info is None:
            print(f"Daemon '{args.name}' not found")
            return 1

        if args.json:
            print(json.dumps({
                "name": info.name,
                "status": info.status.value,
                "pid": info.pid,
                "path": info.path,
                "pid_file": info.pid_file,
                "uptime": info.uptime
            }, indent=2))
        else:
            print(f"{info.name}: {info.status.value}")
            if info.pid:
                print(f"  PID: {info.pid}")
            if info.uptime:
                print(f"  Uptime: {info.uptime}")
            print(f"  Path: {info.path}")
            print(f"  PID file: {info.pid_file}")
    else:
        # All daemons status
        daemons = mgr.discover()
        if args.json:
            print(json.dumps([
                {
                    "name": d.name,
                    "status": d.status.value,
                    "pid": d.pid,
                    "path": d.path,
                    "pid_file": d.pid_file,
                    "uptime": d.uptime
                }
                for d in daemons
            ], indent=2))
        else:
            for d in daemons:
                print(f"{d.name}: {d.status.value}")
                if d.pid:
                    print(f"  PID: {d.pid}")
                if d.uptime:
                    print(f"  Uptime: {d.uptime}")
                print()

    return 0


def run_start(mgr: DaemonManager, args: Namespace) -> int:
    """Handle start subcommand."""
    success, message = mgr.start(args.name)
    if success:
        print(message)
        return 0
    else:
        print(f"Error: {message}")
        return 1


def run_stop(mgr: DaemonManager, args: Namespace) -> int:
    """Handle stop subcommand."""
    success, message = mgr.stop(args.name)
    if success:
        print(message)
        return 0
    else:
        print(f"Error: {message}")
        return 1


def run_logs(mgr: DaemonManager, args: Namespace) -> int:
    """Handle logs subcommand."""
    log_file = Path(f".geometry/{args.name}.log")

    if not log_file.exists():
        print(f"No log file found: {log_file}")
        return 1

    try:
        with open(log_file, 'r') as f:
            lines = f.readlines()

        # Show tail lines
        tail_lines = lines[-args.tail:] if args.tail else lines

        for line in tail_lines:
            print(line.rstrip())

        # Follow if requested
        if args.follow:
            from time import sleep
            try:
                f.seek(0, 2)  # Seek to end
                while True:
                    line = f.readline()
                    if line:
                        print(line.rstrip())
                    else:
                        sleep(0.1)
            except KeyboardInterrupt:
                return 0

    except Exception as e:
        print(f"Error reading log file: {e}")
        return 1

    return 0