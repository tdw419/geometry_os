#!/usr/bin/env python3
"""Session Rotator CLI - Autonomous session rotation for AI coding agents.

Usage:
    session-rotator start [--search QUERY] [--max-sessions N]
    session-rotator stop
    session-rotator status [--json]
    session-rotator monitor [--follow]
    session-rotator logs [--tail N] [--session N]
    session-rotator repl
"""

import os
import sys
import json
import time
import click
from pathlib import Path

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

from cli_anything.session_rotator.core.orchestrator import Orchestrator, SessionStatus

# Try to import ReplSkin, fall back to basic output if not available
try:
    from cli_anything.session_rotator.utils.repl_skin import ReplSkin
    HAS_SKIN = True
except ImportError:
    HAS_SKIN = False


def get_skin():
    """Get REPL skin instance."""
    if HAS_SKIN:
        return ReplSkin("session-rotator", version="1.0.0")
    return None


def print_status_json(status: dict):
    """Print status as JSON."""
    print(json.dumps(status, indent=2))


def print_status_human(status: dict):
    """Print status for humans."""
    skin = get_skin()

    status_emoji = {
        "idle": "⚪",
        "running": "🟢",
        "rotating": "🔄",
        "complete": "✅",
        "error": "🔴"
    }

    emoji = status_emoji.get(status["status"], "❓")

    if skin:
        skin.info(f"{emoji} Status: {status['status'].upper()}")
        skin.status("Sessions", str(status["session_count"]))
        if status.get("orchestrator_pid"):
            skin.status("Orchestrator PID", str(status["orchestrator_pid"]))
        if status.get("cli_pid"):
            skin.status("CLI PID", str(status["cli_pid"]))
        if status.get("uptime"):
            uptime = int(status["uptime"])
            skin.status("Uptime", f"{uptime // 60}m {uptime % 60}s")
    else:
        print(f"\n{emoji} Session Rotator Status: {status['status'].upper()}")
        print(f"  Sessions rotated: {status['session_count']}")
        if status.get("orchestrator_pid"):
            print(f"  Orchestrator PID: {status['orchestrator_pid']}")
        if status.get("cli_pid"):
            print(f"  CLI PID: {status['cli_pid']}")
        if status.get("uptime"):
            uptime = int(status["uptime"])
            print(f"  Uptime: {uptime // 60}m {uptime % 60}s")
        print()


# ─────────────────────────────────────────────────────────────────────────────
# CLI Commands
# ─────────────────────────────────────────────────────────────────────────────

@click.group(invoke_without_command=True)
@click.option("--session-dir", default=".session", help="Session directory")
@click.option("--json", "json_output", is_flag=True, help="JSON output mode")
@click.version_option(version="1.0.0", prog_name="session-rotator")
@click.pass_context
def cli(ctx, session_dir, json_output):
    """Session Rotator - Autonomous session rotation for AI coding agents."""
    ctx.ensure_object(dict)
    ctx.obj["session_dir"] = session_dir
    ctx.obj["json_output"] = json_output
    ctx.obj["orchestrator"] = Orchestrator(session_dir=session_dir)

    # Enter REPL if no subcommand
    if ctx.invoked_subcommand is None:
        ctx.invoke(repl)


@cli.command()
@click.option("--search", "-s", "search_query", help="Search history for context")
@click.option("--max-sessions", "-m", default=50, help="Max sessions before stopping")
@click.option("--token-limit", "-t", default=150000, help="Token limit for rotation")
@click.option("--cli-command", "-c", default="claude", help="CLI command to run")
@click.option("--handoff", "-h", type=click.Path(), help="Handoff file path")
@click.pass_context
def start(ctx, search_query, max_sessions, token_limit, cli_command, handoff):
    """Start the session rotator."""
    orch = Orchestrator(
        session_dir=ctx.obj["session_dir"],
        cli_command=cli_command,
        max_sessions=max_sessions,
        token_limit=token_limit,
        search_query=search_query
    )

    skin = get_skin()

    if handoff:
        # Copy handoff file
        import shutil
        shutil.copy(handoff, Path(ctx.obj["session_dir"]) / "handoff.md")

    if skin:
        skin.print_banner()
        skin.info("Starting session rotator...")
        if search_query:
            skin.status("Search query", search_query)
        skin.status("Max sessions", str(max_sessions))
        skin.status("CLI command", cli_command)

    success = orch.start()

    if success:
        if skin:
            skin.success("Session rotator started!")
            skin.info("Run 'session-rotator monitor' to watch progress")
        else:
            print("✓ Session rotator started")
            print("  Run 'session-rotator monitor' to watch progress")
    else:
        if skin:
            skin.error("Failed to start session rotator")
        else:
            print("✗ Failed to start session rotator")
        sys.exit(1)


@cli.command()
@click.pass_context
def stop(ctx):
    """Stop the session rotator."""
    orch = ctx.obj["orchestrator"]
    skin = get_skin()

    if skin:
        skin.warning("Stopping session rotator...")

    success = orch.stop()

    if success:
        if skin:
            skin.success("Session rotator stopped")
        else:
            print("✓ Session rotator stopped")
    else:
        if skin:
            skin.error("Failed to stop session rotator")
        else:
            print("✗ Failed to stop session rotator")


@cli.command()
@click.option("--json", "json_output", is_flag=True, help="Output as JSON")
@click.pass_context
def status(ctx, json_output):
    """Get current status."""
    orch = ctx.obj["orchestrator"]
    stat = orch.get_status()

    if json_output or ctx.obj.get("json_output"):
        print_status_json(stat)
    else:
        print_status_human(stat)


@cli.command()
@click.option("--follow", "-f", is_flag=True, help="Follow logs in real-time")
@click.pass_context
def monitor(ctx, follow):
    """Monitor session rotator in real-time."""
    orch = ctx.obj["orchestrator"]
    skin = get_skin()

    if follow:
        print("Monitoring session rotator (Ctrl+C to stop)...\n")
        try:
            while True:
                # Clear screen
                print("\033[2J\033[H", end="")

                stat = orch.get_status()
                print_status_human(stat)

                # Show recent logs
                logs = orch.get_logs(tail=10)
                if logs:
                    print("\n--- Recent Output ---")
                    print(logs[-1500:])

                time.sleep(2)
        except KeyboardInterrupt:
            if skin:
                skin.info("Monitoring stopped")
            else:
                print("\nMonitoring stopped")
    else:
        stat = orch.get_status()
        print_status_human(stat)
        logs = orch.get_logs(tail=20)
        if logs:
            print("\n--- Recent Output ---")
            print(logs)


@cli.command()
@click.option("--tail", "-n", default=50, help="Number of lines to show")
@click.option("--session", "-s", "session_id", type=int, help="Specific session ID")
@click.pass_context
def logs(ctx, tail, session_id):
    """View session logs."""
    orch = ctx.obj["orchestrator"]
    content = orch.get_logs(session_id=session_id, tail=tail)
    print(content)


@cli.command()
@click.pass_context
def repl(ctx):
    """Interactive REPL mode."""
    skin = get_skin()

    if skin:
        skin.print_banner()
        skin.info("Welcome to Session Rotator REPL!")
        skin.info("Type 'help' for commands, 'exit' to quit.\n")
    else:
        print("\n=== Session Rotator REPL ===")
        print("Type 'help' for commands, 'exit' to quit.\n")

    orch = ctx.obj["orchestrator"]

    # Simple command loop
    while True:
        try:
            if skin:
                prompt = skin.prompt(project_name="rotator", modified=False)
            else:
                prompt = "session-rotator> "

            cmd = input(prompt).strip()

            if not cmd:
                continue

            if cmd in ("exit", "quit", "q"):
                if skin:
                    skin.print_goodbye()
                else:
                    print("Goodbye!")
                break

            elif cmd in ("help", "h", "?"):
                commands = {
                    "start [--search QUERY]": "Start the rotator",
                    "stop": "Stop the rotator",
                    "status": "Show current status",
                    "monitor": "Monitor in real-time",
                    "logs [--session N]": "View logs",
                    "clear": "Clear old logs",
                    "exit": "Exit REPL"
                }
                if skin:
                    skin.help(commands)
                else:
                    print("\nCommands:")
                    for cmd, desc in commands.items():
                        print(f"  {cmd:<25} {desc}")
                    print()

            elif cmd == "start":
                orch.start()
                print("Started")

            elif cmd == "stop":
                orch.stop()
                print("Stopped")

            elif cmd == "status":
                stat = orch.get_status()
                print_status_human(stat)

            elif cmd == "monitor":
                print("Press Ctrl+C to stop monitoring...")
                try:
                    while True:
                        stat = orch.get_status()
                        print_status_human(stat)
                        time.sleep(2)
                except KeyboardInterrupt:
                    print("\n")

            elif cmd == "logs":
                print(orch.get_logs())

            elif cmd == "clear":
                orch._clear_old_state()
                print("Cleared old state")

            elif cmd.startswith("logs "):
                try:
                    sid = int(cmd.split()[1])
                    print(orch.get_logs(session_id=sid))
                except (ValueError, IndexError):
                    print("Usage: logs <session_id>")

            else:
                if skin:
                    skin.error(f"Unknown command: {cmd}")
                else:
                    print(f"Unknown command: {cmd}")

        except KeyboardInterrupt:
            print("\n")
            continue
        except EOFError:
            break


def main():
    """Main entry point."""
    cli(obj={})


if __name__ == "__main__":
    main()
