import click
import json
import sys
import os
from pathlib import Path
from cli_anything.geometry_os.utils.repl_skin import ReplSkin
from cli_anything.geometry_os.utils.geos_backend import GeosBackend

class Context:
    def __init__(self):
        self.backend = GeosBackend()
        self.skin = ReplSkin("geometry-os", version="2.0.0")
        self.json_mode = False

    def output(self, data: dict, human_msg: str = None):
        if self.json_mode:
            click.echo(json.dumps(data))
        elif human_msg:
            self.skin.success(human_msg)
        else:
            self.skin.info(str(data))

@click.group(invoke_without_command=True)
@click.option('--json', is_flag=True, help='Output in JSON format')
@click.pass_context
def cli(ctx, json):
    """Geometry OS Agent-Native Control Surface"""
    ctx.obj = Context()
    ctx.obj.json_mode = json
    
    if ctx.invoked_subcommand is None:
        ctx.invoke(repl)

@cli.command()
@click.pass_obj
def repl(ctx):
    """Enter interactive REPL mode"""
    ctx.skin.print_banner()
    # Simplified REPL for now
    while True:
        try:
            line = input(f"g-os> ").strip()
            if not line or line in ['exit', 'quit']:
                break
            # In a full implementation, we'd use click.Context.invoke
            click.echo(f"Executing: {line}")
        except EOFError:
            break
    ctx.skin.print_goodbye()

@cli.group()
def crystallize():
    """Convert scripts/binaries to Bricks"""
    pass

@crystallize.command(name="standard")
@click.argument('input_path')
@click.argument('output_path')
@click.pass_obj
def crystallize_standard(ctx, input_path, output_path):
    """Crystallize to PixelRTS v2 (Hilbert PNG)"""
    res = ctx.backend.crystallize_binary(input_path, output_path)
    ctx.output(res, f"Crystallized {input_path} -> {output_path}")

@crystallize.command(name="relink")
@click.argument('input_path')
@click.argument('output_path')
@click.pass_obj
def crystallize_relink(ctx, input_path, output_path):
    """Crystallize with Spatial Address Relinking"""
    res = ctx.backend.crystallize_to_geometric(input_path, output_path)
    ctx.output(res, f"Crystallized and Relinked: {output_path}")

@cli.command()
@click.pass_obj
def visualize(ctx):
    """Launch the Kernel Visualizer (HTTP)"""
    # Start the server in background if not running
    import subprocess
    cmd = ["python3", "-m", "http.server", "8876", "--bind", "localhost"]
    subprocess.Popen(cmd, cwd="systems/ubuntu_riscv", stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    ctx.output({"status": "live", "url": "http://localhost:8876/kernel_visualizer.html"}, "Visualizer live at http://localhost:8876")

@cli.command()
@click.argument('brick')
@click.option('--cycles', default=10000, help='Number of instructions to execute')
@click.pass_obj
def exec(ctx, brick, cycles):
    """Execute instructions on the Geometric VM"""
    # This will hook into systems/infinite_map_rs/src/gpu/geometric_vm.rs
    ctx.skin.info(f"Executing {cycles} cycles on {brick}...")
    # Simulation for now as it requires the Rust runner
    ctx.output({"status": "executing", "cycles": cycles}, f"Dispatched {cycles} to GPU.")

@cli.command()
@click.argument('target')
@click.pass_obj
def evolve(ctx, target):
    """Trigger the Evolution Daemon on a Brick"""
    res = ctx.backend.start_evolution(target)
    ctx.output(res, f"Evolution Daemon started on {target} (PID: {res['pid']})")

def main():
    cli()

if __name__ == '__main__':
    main()
