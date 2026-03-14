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
)


def cmd_crystallize(args):
    """Compile .glyph to .rts.png"""
    import subprocess

    input_path = Path(args.input)
    output_path = Path(args.output)

    if not input_path.exists():
        print(f"Error: Input file not found: {input_path}")
        return 1

    print(f"Crystallizing {input_path}...")

    result = subprocess.run(
        [sys.executable, str(GLYPH_COMPILER), str(input_path), str(output_path)],
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
    print(f"  Target: 0.9000")
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
        stages.append(True)
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
        ("Visual Kernel", GEOS_ROOT / "systems" / "infinite_map_rs" / "src" / "visual_kernel_boot.rs"),
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


def main():
    parser = argparse.ArgumentParser(description="Geometry OS CLI")
    subparsers = parser.add_subparsers(dest="command", help="Command")

    # crystallize
    crystal = subparsers.add_parser("crystallize", help="Compile .glyph to .rts.png")
    crystal.add_argument("input", help="Input .glyph file")
    crystal.add_argument("output", help="Output .rts.png file")
    crystal.set_defaults(func=cmd_crystallize)

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

    args = parser.parse_args()

    if not args.command:
        parser.print_help()
        return 1

    return args.func(args)


if __name__ == "__main__":
    sys.exit(main())
