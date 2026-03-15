#!/usr/bin/env python3
"""
Geometry OS CLI - Direct access to substrate operations.

Usage:
    geos_cli.py crystallize <input.glyph> <output.rts.png>
    geos_cli.py benchmark <glyph_file>
    geos_cli.py boot-sim [--verbose]
    geos_cli.py status
    geos_cli.py hilbert d2xy <index> [--grid-size 4096]
    geos_cli.py hilbert xy2d <x> <y> [--grid-size 4096]
    geos_cli.py glyph-patch --address <addr> --opcode <op> [--stratum <st>] [--p1 <p1>] [--p2 <p2>] [--vm-id <id>]
    geos_cli.py linux-to-glyph --binary <binary> --output <output>
"""

import argparse
import asyncio
import json
import sys
from pathlib import Path

# Add src to path
sys.path.insert(0, str(Path(__file__).parent))

from geos_mcp_server import (
    GEOS_ROOT,
    GLYPH_COMPILER,
    hilbert_d2xy,
    hilbert_xy2d,
    calculate_sls,
    parse_glyph_file,
    WINDOW_MANAGER_GLYPH,
    UBUNTU_KERNEL,
    BOOT_SCRIPT,
    DAEMON_URL,
    tool_glyph_patch,
    tool_linux_to_glyph,
    tool_mem_peek,
    tool_mem_poke,
    tool_gpu_write,
    tool_gpu_exec,
    tool_gpu_pause,
    tool_gpu_vmstate,
    tool_daemon_status,
    tool_substrate_load,
)
import requests


def cmd_crystallize(args):
    """Compile .glyph to .rts.png"""
    import subprocess

    input_path = Path(args.input)
    output_path = Path(args.output)
    dense = args.dense

    if not input_path.exists():
        print(f"Error: Input file not found: {input_path}")
        return 1

    print(f"Crystallizing {input_path}...")

    cmd = [sys.executable, str(GLYPH_COMPILER), str(input_path), str(output_path)]
    if dense:
        cmd.append("--dense")

    result = subprocess.run(
        cmd,
        capture_output=True,
        text=True,
        cwd=str(GEOS_ROOT)
    )

    if result.returncode != 0:
        print(f"Compilation failed:\n{result.stderr}")
        return 1

    output_size = output_path.stat().st_size if output_path.exists() else 0
    print(f"✓ Compiled to {output_path} ({output_size} bytes)")

    if result.stdout.strip():
        print(result.stdout)

    return 0


def cmd_benchmark(args):
    """Benchmark Spatial Locality Score"""
    glyph_file = Path(args.glyph_file)
    grid_size = args.grid_size

    if not glyph_file.exists():
        print(f"Error: Glyph file not found: {glyph_file}")
        return 1

    print(f"Benchmarking {glyph_file}...")

    instructions = parse_glyph_file(str(glyph_file))
    sls = calculate_sls(instructions, grid_size)

    # Stratum distribution
    stratum_names = {0: "SUBSTRATE", 1: "MEMORY", 2: "LOGIC", 3: "SPEC", 4: "INTENT"}
    stratum_counts = {0: 0, 1: 0, 2: 0, 3: 0, 4: 0}
    for op, st, p1, p2 in instructions:
        if st in stratum_counts:
            stratum_counts[st] += 1

    print(f"\n{'='*50}")
    print(f"  Spatial Locality Score: {sls:.4f}")
    print(f"  Target: 0.0000")
    print(f"  Status: {'✓ PASS' if sls >= 0.90 else '✗ FAIL'}")
    print(f"{'='*50}")
    print(f"\nInstruction Count: {len(instructions)}")
    print(f"Grid Size: {grid_size}x{grid_size}")
    print(f"\nStratum Distribution:")
    for st, count in stratum_counts.items():
        if count > 0:
            pct = (count / len(instructions)) * 100
            print(f"  {stratum_names[st]:12} {count:5} ({pct:5.1f}%)")

    # Recommendation
    if sls < 0.70:
        print("\n⚠ CRITICAL: SLS below 0.70. Consider Warp-Interleaved Mapping.")
    elif sls < 0.85:
        print("\n⚠ WARNING: SLS below target. Review instruction ordering.")
    elif sls < 0.90:
        print("\n⚡ CLOSE: Near target. Minor optimizations may help.")
    else:
        print("\n✓ OPTIMAL: SLS target achieved.")

    return 0


def cmd_boot_sim(args):
    """Simulate boot chain"""
    verbose = args.verbose

    print("\n" + "="*60)
    print("  Geometry OS Boot Chain Simulation")
    print("="*60 + "\n")

    stages = []

    # Stage 1: UEFI
    bootloader = GEOS_ROOT / "bootloader" / "efi" / "boot.c"
    if bootloader.exists():
        print("[1] UEFI Bootloader")
        print(f"    File: {bootloader.relative_to(GEOS_ROOT)}")
        print("    Status: ✓ PRESENT")
        if verbose:
            print("    Actions:")
            print("      - Find AMD GPU on PCI bus")
            print("      - Map GPU MMIO (BAR0)")
            print("      - Allocate glyph memory")
            print("      - Load kernel and glyphs")
        stages.append(True)
    else:
        print("[1] UEFI Bootloader: ✗ MISSING")
        stages.append(False)

    # Stage 2: Kernel
    kernel = GEOS_ROOT / "kernel" / "geos" / "main.c"
    if kernel.exists():
        print("\n[2] Geometry OS Kernel")
        print(f"    File: {kernel.relative_to(GEOS_ROOT)}")
        print("    Status: ✓ PRESENT")
        stages.append(True)
    else:
        print("\n[2] Geometry OS Kernel: ✗ MISSING")
        stages.append(False)

    # Stage 3: Window Manager
    if WINDOW_MANAGER_GLYPH.exists():
        print("\n[3] Window Manager Glyph")
        print(f"    File: {WINDOW_MANAGER_GLYPH.relative_to(GEOS_ROOT)}")
        print("    Status: ✓ PRESENT")
        stages.append(True)
    else:
        print("\n[3] Window Manager Glyph: ✗ MISSING")
        stages.append(False)

    # Stage 4: Ubuntu kernel
    if UBUNTU_KERNEL.exists():
        print("\n[4] Ubuntu Kernel (Transpiled)")
        print(f"    File: {UBUNTU_KERNEL.relative_to(GEOS_ROOT)}")
        print("    Status: ✓ PRESENT")
    else:
        print("\n[4] Ubuntu Kernel (Transpiled): ⚠ OPTIONAL (not found)")

    # Stage 5: Boot script
    if BOOT_SCRIPT.exists():
        print("\n[5] Boot Chain Builder")
        print(f"    File: {BOOT_SCRIPT.relative_to(GEOS_ROOT)}")
        print("    Status: ✓ PRESENT")
        stages.append(True)
    else:
        print("\n[5] Boot Chain Builder: ✗ MISSING")
        stages.append(False)

    # Summary
    ready = all(stages[:3])  # First 3 are critical
    print("\n" + "="*60)
    if ready:
        print("  Boot Chain: ✓ READY")
        print("  Next: Flash to USB and boot on AMD hardware")
    else:
        print("  Boot Chain: ✗ NOT READY")
        print("  Fix missing components above")
    print("="*60 + "\n")

    return 0 if ready else 1


def cmd_status(args):
    """Show Geometry OS status"""
    print("\n" + "="*60)
    print("  Geometry OS Status")
    print("="*60)
    print(f"\nRoot: {GEOS_ROOT}")

    checks = [
        ("Glyph Compiler", GLYPH_COMPILER),
        ("Window Manager", WINDOW_MANAGER_GLYPH),
        ("Ubuntu Kernel", UBUNTU_KERNEL),
        ("Boot Script", BOOT_SCRIPT),
        ("UEFI Bootloader", GEOS_ROOT / "bootloader" / "efi" / "boot.c"),
        ("Bare Metal Kernel", GEOS_ROOT / "kernel" / "geos" / "main.c"),
    ]

    print("\nComponents:")
    for name, path in checks:
        status = "✓" if path.exists() else "✗"
        rel_path = path.relative_to(GEOS_ROOT) if path.exists() else path
        print(f"  {status} {name}: {rel_path}")

    present = sum(1 for _, p in checks if p.exists())
    print(f"\nTotal: {present}/{len(checks)} components present")

    return 0


def cmd_hilbert(args):
    """Hilbert curve operations"""
    grid_size = args.grid_size

    if args.operation == "d2xy":
        index = args.index
        x, y = hilbert_d2xy(grid_size, index)
        print(f"Hilbert index {index} → ({x}, {y}) on {grid_size}x{grid_size} grid")
    elif args.operation == "xy2d":
        x, y = args.x, args.y
        d = hilbert_xy2d(grid_size, x, y)
        print(f"({x}, {y}) → Hilbert index {d} on {grid_size}x{grid_size} grid")

    return 0


def cmd_glyph_patch(args):
    """Hot-patch glyph instruction"""
    result = asyncio.run(tool_glyph_patch({
        "address": args.address,
        "opcode": args.opcode,
        "stratum": args.stratum,
        "p1": args.p1,
        "p2": args.p2,
        "vm_id": args.vm_id
    }))
    print(result[0].text)
    return 0


def cmd_linux_to_glyph(args):
    """Transpile Linux ELF to glyph"""
    result = asyncio.run(tool_linux_to_glyph({
        "binary": args.binary,
        "output": args.output,
        "dense": args.dense
    }))
    print(result[0].text)
    return 0


def cmd_firmware(args):
    """Crystallize firmware blobs into RTS textures"""
    import sys
    sys.path.insert(0, str(GEOS_ROOT / "systems"))
    from geos.firmware import crystallize_firmware, crystallize_amdgpu_firmware, extract_firmware

    if args.operation == "crystallize":
        result = crystallize_firmware(
            args.firmware,
            args.output,
            args.name
        )
        print(f"✓ Crystallized: {result.name}")
        print(f"  Size: {result.original_size} bytes")
        print(f"  Grid: {result.grid_size}x{result.grid_size}")
        print(f"  Checksum: {result.checksum}")
        print(f"  Output: {result.texture_path}")
        return 0

    elif args.operation == "extract":
        data, meta = extract_firmware(args.texture, args.output)
        print(f"✓ Extracted: {meta.name}")
        print(f"  Size: {len(data)} bytes")
        print(f"  Checksum: {meta.checksum}")
        if args.output:
            print(f"  Output: {args.output}")
        return 0

    elif args.operation == "batch-amd":
        output_dir = args.output_dir or str(GEOS_ROOT / "kernel" / "firmware")
        results = crystallize_amdgpu_firmware(args.firmware_dir, output_dir)
        print(f"\n✓ Crystallized {len(results)} firmware blobs to {output_dir}")
        return 0

    return 1


# ============================================================================
# GPU Daemon Commands
# ============================================================================

def cmd_daemon_status(args):
    """Check daemon status"""
    result = asyncio.run(tool_daemon_status({}))
    print(result[0].text)
    return 0


def cmd_peek(args):
    """Read GPU memory"""
    result = asyncio.run(tool_mem_peek({"addr": args.addr, "size": args.size}))
    print(result[0].text)
    return 0


def cmd_poke(args):
    """Write to GPU memory"""
    result = asyncio.run(tool_mem_poke({"addr": args.addr, "val": args.val}))
    print(result[0].text)
    return 0


def cmd_gpu_write(args):
    """Batch write to GPU memory"""
    result = asyncio.run(tool_gpu_write({"addr": args.addr, "data": args.data}))
    print(result[0].text)
    return 0


def cmd_gpu_exec(args):
    """Execute command via daemon"""
    result = asyncio.run(tool_gpu_exec({
        "cmd": args.cmd,
        "cwd": args.cwd,
        "timeout": args.timeout
    }))
    print(result[0].text)
    return 0


def cmd_gpu_pause(args):
    """Pause all VMs"""
    result = asyncio.run(tool_gpu_pause({}))
    print(result[0].text)
    return 0


def cmd_gpu_vmstate(args):
    """Query VM state"""
    result = asyncio.run(tool_gpu_vmstate({"vm": args.vm}))
    print(result[0].text)
    return 0


def cmd_substrate_load(args):
    """Load substrate to daemon"""
    result = asyncio.run(tool_substrate_load({"rts_file": args.rts_file}))
    print(result[0].text)
    return 0


def main():
    parser = argparse.ArgumentParser(description="Geometry OS CLI")
    subparsers = parser.add_subparsers(dest="command", help="Command")

    # crystallize
    crystal = subparsers.add_parser("crystallize", help="Compile .glyph to .rts.png")
    crystal.add_argument("input", help="Input .glyph file")
    crystal.add_argument("output", help="Output .rts.png file")
    crystal.add_argument("--dense", action="store_true", help="Enable dense packing")
    crystal.set_defaults(func=cmd_crystallize)

    # linux-to-glyph
    l2g = subparsers.add_parser("linux-to-glyph", help="Transpile Linux ELF to glyph texture")
    l2g.add_argument("binary", help="Input RISC-V ELF binary")
    l2g.add_argument("output", help="Output .rts.png file")
    l2g.add_argument("--dense", action="store_true", help="Enable dense packing")
    l2g.set_defaults(func=cmd_linux_to_glyph)

    # glyph-patch
    patch = subparsers.add_parser("glyph-patch", help="Hot-patch glyph instruction in VRAM")
    patch.add_argument("--address", required=True, help="Hilbert index or hex address")
    patch.add_argument("--opcode", type=int, required=True, help="New opcode (R channel)")
    patch.add_argument("--stratum", type=int, default=0, help="Stratum (G channel)")
    patch.add_argument("--p1", type=int, default=0, help="Param 1 (B channel)")
    patch.add_argument("--p2", type=int, default=0, help="Param 2 (A channel)")
    patch.add_argument("--vm-id", type=int, default=0, help="VM ID to patch")
    patch.set_defaults(func=cmd_glyph_patch)

    # benchmark
    bench = subparsers.add_parser("benchmark", help="Benchmark Spatial Locality Score")
    bench.add_argument("glyph_file", help=".glyph file to analyze")
    bench.add_argument("--grid-size", type=int, default=4096, help="Grid size")
    bench.set_defaults(func=cmd_benchmark)

    # boot-sim
    boot = subparsers.add_parser("boot-sim", help="Simulate boot chain")
    boot.add_argument("--verbose", "-v", action="store_true", help="Verbose output")
    boot.set_defaults(func=cmd_boot_sim)

    # status
    status = subparsers.add_parser("status", help="Show Geometry OS status")
    status.set_defaults(func=cmd_status)

    # hilbert
    hilbert = subparsers.add_parser("hilbert", help="Hilbert curve operations")
    hilbert.add_argument("operation", choices=["d2xy", "xy2d"], help="Conversion direction")
    hilbert.add_argument("--index", type=int, help="Hilbert index (for d2xy)")
    hilbert.add_argument("--x", type=int, help="X coordinate (for xy2d)")
    hilbert.add_argument("--y", type=int, help="Y coordinate (for xy2d)")
    hilbert.add_argument("--grid-size", type=int, default=4096, help="Grid size")
    hilbert.set_defaults(func=cmd_hilbert)

    # firmware
    firmware = subparsers.add_parser("firmware", help="Crystallize firmware blobs into RTS textures")
    firmware.add_argument("operation", choices=["crystallize", "extract", "batch-amd"],
                         help="Operation: crystallize, extract, or batch-amd")
    firmware.add_argument("--firmware", "-f", help="Input firmware .bin file")
    firmware.add_argument("--texture", "-t", help="Input .rts.png texture (for extract)")
    firmware.add_argument("--output", "-o", help="Output file path")
    firmware.add_argument("--name", "-n", help="Friendly name for firmware")
    firmware.add_argument("--firmware-dir", default="/lib/firmware/amdgpu",
                         help="Directory containing AMD firmware files")
    firmware.add_argument("--output-dir", help="Output directory for batch-amd")
    firmware.set_defaults(func=cmd_firmware)

    # === GPU Daemon Commands ===

    # daemon-status
    ds = subparsers.add_parser("daemon-status", help="Check Ouroboros daemon status")
    ds.set_defaults(func=cmd_daemon_status)

    # peek
    peek = subparsers.add_parser("peek", help="Read GPU memory at address")
    peek.add_argument("addr", help="Hilbert address (hex, e.g. 0x100000)")
    peek.add_argument("--size", "-s", type=int, default=16, help="Number of words to read")
    peek.set_defaults(func=cmd_peek)

    # poke
    poke = subparsers.add_parser("poke", help="Write value to GPU memory")
    poke.add_argument("addr", help="Hilbert address (hex)")
    poke.add_argument("val", help="Value to write (hex)")
    poke.set_defaults(func=cmd_poke)

    # gpu-write
    gw = subparsers.add_parser("gpu-write", help="Batch write values to GPU memory")
    gw.add_argument("addr", help="Starting address (hex)")
    gw.add_argument("data", nargs="+", type=int, help="Values to write (space-separated integers)")
    gw.set_defaults(func=cmd_gpu_write)

    # gpu-exec
    ge = subparsers.add_parser("gpu-exec", help="Execute shell command via daemon")
    ge.add_argument("cmd", help="Shell command to execute")
    ge.add_argument("--cwd", "-c", help="Working directory")
    ge.add_argument("--timeout", "-t", type=int, default=30, help="Timeout in seconds")
    ge.set_defaults(func=cmd_gpu_exec)

    # gpu-pause
    gp = subparsers.add_parser("gpu-pause", help="Pause all GPU VMs")
    gp.set_defaults(func=cmd_gpu_pause)

    # gpu-vmstate
    gv = subparsers.add_parser("gpu-vmstate", help="Query VM state")
    gv.add_argument("--vm", "-v", type=int, default=0, help="VM ID (0-7)")
    gv.set_defaults(func=cmd_gpu_vmstate)

    # substrate-load
    sl = subparsers.add_parser("substrate-load", help="Load .rts.png to daemon")
    sl.add_argument("rts_file", help="Path to .rts.png file")
    sl.set_defaults(func=cmd_substrate_load)

    args = parser.parse_args()

    if not args.command:
        parser.print_help()
        return 1

    return args.func(args)


if __name__ == "__main__":
    sys.exit(main())
