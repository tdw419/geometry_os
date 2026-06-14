#!/usr/bin/env python3
"""
G-Shell CLI - Main entry point

Usage:
    g-shell shell              # Start interactive G-Shell session
    g-shell map                # Show current spatial map
    g-shell spawn <cmd>        # Spawn a process in a tile
    g-shell ai <prompt>        # Send context to AI
    g-shell status             # Show system status
    g-shell --json             # JSON output for AI agents
"""

import json
import os
import sys
from pathlib import Path
from typing import Optional

import click

# Add Geometry OS to path for imports
# Path: apps/g-shell/agent-harness/cli_anything/gshell/gshell_cli.py -> geometry_os/
GEO_OS_ROOT = Path(__file__).parent.parent.parent.parent.parent.parent
if str(GEO_OS_ROOT) not in sys.path:
    sys.path.insert(0, str(GEO_OS_ROOT))


def get_gnb_state_path() -> Path:
    """Get the path to the GNB state file."""
    return GEO_OS_ROOT / ".geometry" / "gnb_state.ascii"


def get_terminal_fragment_path() -> Path:
    """Get the path to the terminal fragment file."""
    return GEO_OS_ROOT / ".geometry" / "ascii_scene" / "terminal_fragment.ascii"


def output_result(data: dict, json_output: bool = False):
    """Output result in human or JSON format."""
    if json_output:
        click.echo(json.dumps(data, indent=2))
    else:
        # Human-readable output
        if "error" in data:
            click.secho(f"Error: {data['error']}", fg="red", err=True)
        elif "message" in data:
            click.secho(data["message"], fg="green")
        elif "status" in data:
            click.echo(f"Status: {data['status']}")
        else:
            # Generic pretty print
            for key, value in data.items():
                if isinstance(value, dict):
                    click.echo(f"\n{key}:")
                    for k, v in value.items():
                        click.echo(f"  {k}: {v}")
                elif isinstance(value, list):
                    click.echo(f"\n{key}: {len(value)} items")
                    for item in value[:5]:
                        click.echo(f"  - {item}")
                    if len(value) > 5:
                        click.echo(f"  ... and {len(value) - 5} more")
                else:
                    click.echo(f"{key}: {value}")


# ============================================================================
# Main CLI Group
# ============================================================================

@click.group(invoke_without_command=True)
@click.option('--json', 'json_output', is_flag=True, help='Output in JSON format for AI agents')
@click.option('--verbose', '-v', is_flag=True, help='Verbose output')
@click.version_option(version='1.0.0', prog_name='g-shell')
@click.pass_context
def main(ctx, json_output, verbose):
    """G-Shell: AI-Native Terminal with Spatial Computing.

    A terminal that bridges Linux bash with Geometry OS spatial computing.
    Terminal state is encoded as Hilbert-mapped RGBA textures for AI perception.

    \b
    Quick Start:
        g-shell shell              Start interactive session
        g-shell map                Show spatial map
        g-shell --json status      JSON output for AI agents
    """
    ctx.ensure_object(dict)
    ctx.obj['json'] = json_output
    ctx.obj['verbose'] = verbose

    if ctx.invoked_subcommand is None:
        # Default: show help
        click.echo(ctx.get_help())


# ============================================================================
# Shell Command - Interactive Terminal
# ============================================================================

@main.command()
@click.option('--native', is_flag=True, help='Use native RGBA/Hilbert encoding')
@click.option('--bridge', is_flag=True, help='Start WebSocket bridge for PixiJS')
@click.pass_context
def shell(ctx, native, bridge):
    """Start interactive G-Shell terminal session.

    This launches a PTY-wrapped bash shell with AI context injection.
    All terminal output is captured and encoded for AI perception.

    \b
    Options:
        --native    Use native RGBA/Hilbert texture encoding
        --bridge    Start WebSocket bridge for PixiJS visualization
    """
    json_output = ctx.obj.get('json', False)

    try:
        # Import the native terminal
        from systems.visual_shell.native_geos_terminal import NativeGeosTerminal

        if bridge:
            click.secho("Starting G-Shell with WebSocket bridge...", fg="cyan")

        terminal = NativeGeosTerminal(
            use_native_encoding=native,
            start_bridge=bridge
        )

        output_result({
            "status": "starting",
            "message": "G-Shell terminal session started",
            "native_encoding": native,
            "bridge": bridge
        }, json_output)

        terminal.run()

    except ImportError as e:
        output_result({
            "error": f"Failed to import G-Shell modules: {e}",
            "hint": "Make sure Geometry OS is properly installed"
        }, json_output)
        sys.exit(1)
    except KeyboardInterrupt:
        output_result({"status": "terminated", "message": "G-Shell session ended"}, json_output)


# ============================================================================
# Map Command - Spatial Operations
# ============================================================================

@main.command()
@click.option('--list', 'list_all', is_flag=True, help='List all tiles')
@click.option('--find', metavar='PATTERN', help='Find tiles matching pattern')
@click.pass_context
def map(ctx, list_all, find):
    """Show current spatial map of terminal tiles.

    Displays the VAT (Virtual Addressable Tile) coordinates and
    current terminal positions in the infinite map.

    \b
    Examples:
        g-shell map              Show current map
        g-shell map --list       List all tiles
        g-shell map --find vim   Find tiles containing 'vim'
    """
    json_output = ctx.obj.get('json', False)

    try:
        from systems.visual_shell.geos_commands import GeosCommands

        cmd = GeosCommands()
        result = cmd.handle_map(list_tiles=list_all, find_pattern=find)

        output_result(result, json_output)

    except ImportError as e:
        # Fallback: read state directly
        gnb_path = get_gnb_state_path()
        if gnb_path.exists():
            content = gnb_path.read_text()
            output_result({
                "status": "ok",
                "source": "gnb_state",
                "content": content[:500] + "..." if len(content) > 500 else content
            }, json_output)
        else:
            output_result({
                "status": "empty",
                "message": "No spatial state found. Start a G-Shell session first."
            }, json_output)


# ============================================================================
# Spawn Command - Process Spawning
# ============================================================================

@main.command()
@click.argument('command', required=True, nargs=-1)
@click.option('--tile', metavar='ID', help='Tile ID to spawn in')
@click.option('--size', metavar='WxH', default='80x24', help='Tile size')
@click.pass_context
def spawn(ctx, command, tile, size):
    """Spawn a command in a new tile.

    Creates a new terminal tile in the spatial map and runs the command.

    \b
    Examples:
        g-shell spawn vim               Open vim in new tile
        g-shell spawn htop --tile 5     Spawn in specific tile
        g-shell spawn bash --size 120x40
    """
    json_output = ctx.obj.get('json', False)

    try:
        from systems.visual_shell.geos_commands import GeosCommands

        cmd = GeosCommands()
        result = cmd.handle_spawn(
            command=' '.join(command),
            tile_id=tile,
            size=size
        )

        output_result(result, json_output)

    except ImportError:
        output_result({
            "error": "GeosCommands not available",
            "command": ' '.join(command),
            "hint": "Use 'g-shell shell' for interactive mode"
        }, json_output)


# ============================================================================
# AI Command - Context Injection
# ============================================================================

@main.command('ai')
@click.argument('prompt', required=True, nargs=-1)
@click.option('--model', default='gemini', type=click.Choice(['gemini', 'claude']))
@click.pass_context
def ai_cmd(ctx, prompt, model):
    """Send prompt to AI with terminal context injection.

    Automatically includes current terminal state (visual substrate)
    in the prompt for AI understanding.

    \b
    Examples:
        g-shell ai "analyze my current screen"
        g-shell ai "what processes are running" --model claude
    """
    json_output = ctx.obj.get('json', False)

    try:
        from systems.visual_shell.context_injector import ContextInjector

        injector = ContextInjector()
        full_prompt = injector.wrap_prompt(' '.join(prompt), model=model)

        output_result({
            "status": "ready",
            "model": model,
            "prompt": full_prompt,
            "hint": f"Run: {model} \"{full_prompt[:100]}...\""
        }, json_output)

    except ImportError:
        # Fallback: read terminal fragment
        frag_path = get_terminal_fragment_path()
        if frag_path.exists():
            context = frag_path.read_text()
            output_result({
                "status": "ok",
                "model": model,
                "context": context[:500] + "..." if len(context) > 500 else context,
                "prompt": ' '.join(prompt)
            }, json_output)
        else:
            output_result({
                "error": "No terminal context available",
                "hint": "Start a G-Shell session first"
            }, json_output)


# ============================================================================
# Status Command
# ============================================================================

@main.command()
@click.pass_context
def status(ctx):
    """Show G-Shell system status.

    Displays information about:
    - GNB state file status
    - Terminal fragment status
    - WebSocket bridge status
    - Active tiles
    """
    json_output = ctx.obj.get('json', False)

    gnb_path = get_gnb_state_path()
    term_path = get_terminal_fragment_path()

    result = {
        "g-shell": {
            "version": "1.0.0",
            "root": str(GEO_OS_ROOT),
        },
        "state_files": {
            "gnb_state": {
                "exists": gnb_path.exists(),
                "path": str(gnb_path),
                "size": gnb_path.stat().st_size if gnb_path.exists() else 0
            },
            "terminal_fragment": {
                "exists": term_path.exists(),
                "path": str(term_path),
                "size": term_path.stat().st_size if term_path.exists() else 0
            }
        }
    }

    output_result(result, json_output)


# ============================================================================
# GLS Command - List Tiles
# ============================================================================

@main.command('gls')
@click.option('--all', '-a', 'show_all', is_flag=True, help='Show all details')
@click.pass_context
def gls(ctx, show_all):
    """List geometric tiles (g-ls).

    Shows all terminal tiles in the spatial map with their
    VAT coordinates and process information.

    \b
    Examples:
        g-shell gls          List tiles
        g-shell gls -a       Show all details
    """
    json_output = ctx.obj.get('json', False)

    try:
        from systems.visual_shell.geos_commands import GeosCommands

        cmd = GeosCommands()
        result = cmd.handle_gls(verbose=show_all)

        output_result(result, json_output)

    except ImportError:
        # Fallback
        output_result({
            "status": "limited",
            "message": "Use 'g-shell shell' for full functionality"
        }, json_output)


# ============================================================================
# REPL Mode
# ============================================================================

@main.command()
@click.pass_context
def repl(ctx):
    """Start G-Shell REPL mode.

    Interactive command loop for G-Shell commands.
    Type 'help' for available commands, 'exit' to quit.
    """
    json_output = ctx.obj.get('json', False)

    click.secho("G-Shell REPL v1.0.0", fg="cyan")
    click.secho("Type 'help' for commands, 'exit' to quit.\n", fg="dim")

    while True:
        try:
            line = click.prompt("g-shell", prompt_suffix="> ", default="")

            if not line.strip():
                continue

            parts = line.strip().split()
            cmd = parts[0].lower()

            if cmd in ('exit', 'quit', 'q'):
                click.secho("Goodbye!", fg="green")
                break
            elif cmd == 'help':
                click.echo("""
Available commands:
  map              Show spatial map
  spawn <cmd>      Spawn command in new tile
  ai <prompt>      Send prompt to AI with context
  status           Show system status
  gls              List geometric tiles
  exit             Exit REPL
""")
            elif cmd == 'map':
                ctx.invoke(map, list_all=False, find=None)
            elif cmd == 'status':
                ctx.invoke(status)
            elif cmd == 'gls':
                ctx.invoke(gls, show_all=False)
            elif cmd == 'spawn' and len(parts) > 1:
                ctx.invoke(spawn, command=parts[1:], tile=None, size='80x24')
            elif cmd == 'ai' and len(parts) > 1:
                ctx.invoke(ai_cmd, prompt=parts[1:], model='gemini')
            else:
                click.secho(f"Unknown command: {cmd}. Type 'help' for commands.", fg="yellow")

        except KeyboardInterrupt:
            click.echo()
            continue
        except EOFError:
            click.secho("\nGoodbye!", fg="green")
            break


# ============================================================================
# Entry Point
# ============================================================================

if __name__ == '__main__':
    main()
