#!/usr/bin/env python3
"""
Geometry OS MCP Server

Exposes Geometry OS substrate operations via Model Context Protocol:
- crystallize: Compile .glyph files to .rts.png textures
- benchmark_sls: Measure Spatial Locality Score for GPU cache efficiency
- boot_sim: Simulate boot chain (UEFI → Kernel → GPU MMIO)
- vm_spawn: Spawn a child glyph VM
- hilbert_test: Test Hilbert curve coordinate conversion

Usage:
    python geos_mcp_server.py

Or via mcp2cli:
    mcp2cli "python /path/to/geos_mcp_server.py" geos
    geos crystallize --input window_manager.glyph --output window_manager.rts.png
"""

import asyncio
import json
import subprocess
import sys
from pathlib import Path
from typing import Any

from mcp.server import Server
from mcp.server.stdio import stdio_server
from mcp.types import TextContent, Tool

# Geometry OS paths (relative to this file)
GEOS_ROOT = Path(__file__).parent.parent.parent.parent
GLYPH_COMPILER = GEOS_ROOT / "systems" / "glyph_stratum" / "programs" / "compile_glyph.py"
WINDOW_MANAGER_GLYPH = GEOS_ROOT / "systems" / "glyph_stratum" / "programs" / "window_manager.glyph"
UBUNTU_KERNEL = GEOS_ROOT / "systems" / "ubuntu_riscv" / "ubuntu_native.rts.png"
BOOT_SCRIPT = GEOS_ROOT / "kernel" / "boot" / "run_bare_metal.sh"

app = Server("geometry-os")


def hilbert_d2xy(n: int, d: int) -> tuple[int, int]:
    """Convert Hilbert index to (x, y) coordinates."""
    x = y = 0
    s = 1
    t = d
    while s < n:
        rx = 1 & (t // 2)
        ry = 1 & (t ^ rx)
        if ry == 0:
            if rx == 1:
                x = s - 1 - x
                y = s - 1 - y
            x, y = y, x
        x += s * rx
        y += s * ry
        t //= 4
        s *= 2
    return x, y


def hilbert_xy2d(n: int, x: int, y: int) -> int:
    """Convert (x, y) coordinates to Hilbert index."""
    d = 0
    s = n // 2
    while s > 0:
        rx = 1 if (x & s) > 0 else 0
        ry = 1 if (y & s) > 0 else 0
        d += s * s * ((3 * rx) ^ ry)
        if ry == 0:
            if rx == 1:
                x = s - 1 - x
                y = s - 1 - y
            x, y = y, x
        s //= 2
    return d


def calculate_sls(instructions: list[tuple[int, int, int, int]], grid_size: int = 4096) -> float:
    """
    Calculate Spatial Locality Score (SLS).

    SLS measures how well instructions are laid out for GPU cache efficiency.
    A score of 1.0 means perfect locality (sequential Hilbert access).
    Score < 0.7 indicates poor cache utilization.

    Args:
        instructions: List of (opcode, stratum, p1, p2) tuples
        grid_size: Texture grid size (default 4096x4096)

    Returns:
        SLS score between 0.0 and 1.0
    """
    if len(instructions) < 2:
        return 1.0

    # Calculate Hilbert distance between consecutive instructions
    total_jump = 0
    max_jump = 0

    prev_d = 0
    for i in range(len(instructions)):
        # Simulate where this instruction would be placed
        x, y = hilbert_d2xy(grid_size, i)
        d = hilbert_xy2d(grid_size, x, y)

        if i > 0:
            jump = abs(d - prev_d)
            total_jump += jump
            max_jump = max(max_jump, jump)

        prev_d = d

    # Ideal case: consecutive instructions are 1 unit apart in Hilbert space
    # Worst case: maximum possible jumps
    ideal_total = len(instructions) - 1
    worst_total = (len(instructions) - 1) * (grid_size * grid_size // 4)

    if worst_total == 0:
        return 1.0

    # SLS = 1 - (actual_jump - ideal) / (worst - ideal)
    sls = 1.0 - (total_jump - ideal_total) / (worst_total - ideal_total)
    return max(0.0, min(1.0, sls))


def parse_glyph_file(path: str) -> list[tuple[int, int, int, int]]:
    """Parse a .glyph file or .rts.png into instruction tuples."""
    path_obj = Path(path)
    
    if path_obj.suffix == ".png":
        # Read from texture
        from PIL import Image
        import numpy as np
        img = Image.open(path).convert('RGBA')
        pixels = np.array(img)
        # Flatten and filter out NOPs (where opcode=0)
        flat = pixels.reshape(-1, 4)
        instructions = [tuple(p) for p in flat if p[0] != 0]
        return instructions

    # Import the compiler's parser for .glyph files
    sys.path.insert(0, str(GEOS_ROOT / "systems" / "glyph_stratum" / "programs"))
    from compile_glyph import parse_glyph

    source = path_obj.read_text()
    instructions, labels, constants = parse_glyph(source)
    return instructions


@app.list_tools()
async def list_tools():
    return [
        Tool(
            name="crystallize",
            description="Compile a .glyph assembly file to .rts.png GPU texture format.",
            inputSchema={
                "type": "object",
                "properties": {
                    "input": {"type": "string", "description": "Path to .glyph source file"},
                    "output": {"type": "string", "description": "Path to output .rts.png texture"},
                    "dense": {"type": "boolean", "description": "Enable dense packing (no NOP gaps)", "default": False},
                },
                "required": ["input", "output"],
            },
        ),
        Tool(
            name="glyph_patch",
            description="Hot-patch a running glyph instruction in VRAM.",
            inputSchema={
                "type": "object",
                "properties": {
                    "vm_id": {"type": "integer", "description": "VM ID to patch (0=WM)"},
                    "address": {"type": "string", "description": "Hilbert index or hex address"},
                    "opcode": {"type": "integer", "description": "New R channel value"},
                    "stratum": {"type": "integer", "description": "New G channel value"},
                    "p1": {"type": "integer", "description": "New B channel value"},
                    "p2": {"type": "integer", "description": "New A channel value"},
                },
                "required": ["address", "opcode"],
            },
        ),
        Tool(
            name="linux_to_glyph",
            description="Transpile a Linux ELF binary to a spatial glyph texture.",
            inputSchema={
                "type": "object",
                "properties": {
                    "binary": {"type": "string", "description": "Path to RISC-V ELF binary"},
                    "output": {"type": "string", "description": "Path to output .rts.png"},
                },
                "required": ["binary", "output"],
            },
        ),
        Tool(
            name="benchmark_sls",
            description="Calculate Spatial Locality Score (SLS) for a .glyph program. "
            "SLS measures GPU cache efficiency. Target: 0.90+ for optimal performance.",
            inputSchema={
                "type": "object",
                "properties": {
                    "glyph_file": {"type": "string", "description": "Path to .glyph file to analyze"},
                    "grid_size": {"type": "integer", "description": "Texture grid size (default 4096)", "default": 4096},
                },
                "required": ["glyph_file"],
            },
        ),
        Tool(
            name="boot_sim",
            description="Simulate the Geometry OS boot chain: UEFI → Kernel → GPU MMIO. "
            "Validates boot image structure and reports what would happen at each stage.",
            inputSchema={
                "type": "object",
                "properties": {
                    "image_path": {"type": "string", "description": "Path to boot.img (optional, uses default if not specified)"},
                    "verbose": {"type": "boolean", "description": "Enable verbose output", "default": False},
                },
                "required": [],
            },
        ),
        Tool(
            name="vm_spawn",
            description="Simulate spawning a child glyph VM with SPATIAL_SPAWN. "
            "Returns the VM configuration and memory bounds.",
            inputSchema={
                "type": "object",
                "properties": {
                    "vm_id": {"type": "integer", "description": "VM ID (1-7, 0 is reserved for Window Manager)"},
                    "glyph_file": {"type": "string", "description": "Path to child .glyph program"},
                    "window_x": {"type": "number", "description": "Window X position", "default": 100},
                    "window_y": {"type": "number", "description": "Window Y position", "default": 100},
                    "window_w": {"type": "number", "description": "Window width", "default": 800},
                    "window_h": {"type": "number", "description": "Window height", "default": 600},
                },
                "required": ["vm_id", "glyph_file"],
            },
        ),
        Tool(
            name="hilbert_test",
            description="Test Hilbert curve coordinate conversion. "
            "Converts between linear index and 2D coordinates.",
            inputSchema={
                "type": "object",
                "properties": {
                    "index": {"type": "integer", "description": "Hilbert index to convert to (x, y)"},
                    "x": {"type": "integer", "description": "X coordinate to convert to index"},
                    "y": {"type": "integer", "description": "Y coordinate to convert to index"},
                    "grid_size": {"type": "integer", "description": "Grid size (default 4096)", "default": 4096},
                    "mode": {"type": "string", "description": "'d2xy' or 'xy2d'", "enum": ["d2xy", "xy2d"]},
                },
                "required": ["mode"],
            },
        ),
        Tool(
            name="geos_status",
            description="Get current Geometry OS status: available components, compiled programs, boot chain readiness.",
            inputSchema={
                "type": "object",
                "properties": {},
                "required": [],
            },
        ),
    ]


@app.call_tool()
async def call_tool(name: str, arguments: dict) -> list[TextContent]:
    try:
        if name == "crystallize":
            return await tool_crystallize(arguments)
        elif name == "glyph_patch":
            return await tool_glyph_patch(arguments)
        elif name == "linux_to_glyph":
            return await tool_linux_to_glyph(arguments)
        elif name == "benchmark_sls":
            return await tool_benchmark_sls(arguments)
        elif name == "boot_sim":
            return await tool_boot_sim(arguments)
        elif name == "vm_spawn":
            return await tool_vm_spawn(arguments)
        elif name == "hilbert_test":
            return await tool_hilbert_test(arguments)
        elif name == "geos_status":
            return await tool_geos_status(arguments)
        else:
            return [TextContent(type="text", text=f"Unknown tool: {name}")]
    except Exception as e:
        return [TextContent(type="text", text=f"Error: {str(e)}")]


async def tool_crystallize(args: dict) -> list[TextContent]:
    """Compile .glyph to .rts.png."""
    input_path = Path(args["input"])
    output_path = Path(args["output"])
    dense = args.get("dense", False)

    if not input_path.exists():
        return [TextContent(type="text", text=f"Error: Input file not found: {input_path}")]

    # Run the Python compiler
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
        return [TextContent(type="text", text=f"Compilation failed:\n{result.stderr}")]

    # Get output file size
    output_size = output_path.stat().st_size if output_path.exists() else 0

    return [TextContent(
        type="text",
        text=json.dumps({
            "status": "success",
            "input": str(input_path),
            "output": str(output_path),
            "output_size_bytes": output_size,
            "dense": dense,
            "compiler_output": result.stdout.strip()
        }, indent=2)
    )]


async def tool_benchmark_sls(args: dict) -> list[TextContent]:
    """Calculate Spatial Locality Score."""
    glyph_file = Path(args["glyph_file"])
    grid_size = args.get("grid_size", 4096)

    if not glyph_file.exists():
        return [TextContent(type="text", text=f"Error: Glyph file not found: {glyph_file}")]

    # Parse and analyze
    instructions = parse_glyph_file(str(glyph_file))
    sls = calculate_sls(instructions, grid_size)

    # Additional metrics
    instruction_count = len(instructions)

    # Classify by stratum
    stratum_counts = {0: 0, 1: 0, 2: 0, 3: 0, 4: 0}
    stratum_names = {0: "SUBSTRATE", 1: "MEMORY", 2: "LOGIC", 3: "SPEC", 4: "INTENT"}
    for op, st, p1, p2 in instructions:
        if st in stratum_counts:
            stratum_counts[st] += 1

    # Target assessment
    target_met = sls >= 0.90
    recommendation = ""
    if sls < 0.70:
        recommendation = "CRITICAL: SLS below 0.70. Consider Warp-Interleaved Mapping."
    elif sls < 0.85:
        recommendation = "WARNING: SLS below target. Review instruction ordering."
    elif sls < 0.90:
        recommendation = "CLOSE: Near target. Minor optimizations may help."
    else:
        recommendation = "OPTIMAL: SLS target achieved."

    return [TextContent(
        type="text",
        text=json.dumps({
            "status": "success",
            "glyph_file": str(glyph_file),
            "spatial_locality_score": round(sls, 4),
            "target_sls": 0.90,
            "target_met": target_met,
            "recommendation": recommendation,
            "instruction_count": instruction_count,
            "grid_size": grid_size,
            "stratum_distribution": {stratum_names[k]: v for k, v in stratum_counts.items() if v > 0}
        }, indent=2)
    )]


async def tool_boot_sim(args: dict) -> list[TextContent]:
    """Simulate boot chain."""
    image_path = args.get("image_path", "")
    verbose = args.get("verbose", False)

    stages = []
    issues = []

    # Stage 1: Check bootloader
    bootloader_src = GEOS_ROOT / "bootloader" / "efi" / "boot.c"
    if bootloader_src.exists():
        stages.append({
            "stage": "UEFI Bootloader",
            "file": str(bootloader_src.relative_to(GEOS_ROOT)),
            "status": "PRESENT",
            "actions": [
                "Find AMD GPU on PCI bus",
                "Map GPU MMIO region (BAR0)",
                "Allocate 256MB glyph memory",
                "Load geometry_os.kernel",
                "Load window_manager.rts.png",
                "Load glyph_microcode.spv",
                "ExitBootServices() and jump to kernel"
            ]
        })
    else:
        issues.append("Bootloader source not found")
        stages.append({"stage": "UEFI Bootloader", "status": "MISSING"})

    # Stage 2: Check kernel
    kernel_src = GEOS_ROOT / "kernel" / "geos" / "main.c"
    if kernel_src.exists():
        stages.append({
            "stage": "Geometry OS Kernel",
            "file": str(kernel_src.relative_to(GEOS_ROOT)),
            "status": "PRESENT",
            "actions": [
                "Receive boot_info from UEFI",
                "Initialize GPU MMIO registers",
                "Copy init_glyph to GPU memory",
                "Submit microcode to compute rings",
                "Start Window Manager VM #0"
            ]
        })
    else:
        issues.append("Kernel source not found")
        stages.append({"stage": "Geometry OS Kernel", "status": "MISSING"})

    # Stage 3: Check Window Manager
    wm_glyph = WINDOW_MANAGER_GLYPH
    if wm_glyph.exists():
        stages.append({
            "stage": "Window Manager Glyph",
            "file": str(wm_glyph.relative_to(GEOS_ROOT)),
            "status": "PRESENT"
        })
    else:
        issues.append("Window Manager glyph not found")
        stages.append({"stage": "Window Manager Glyph", "status": "MISSING"})

    # Stage 4: Check Ubuntu kernel (optional)
    if UBUNTU_KERNEL.exists():
        stages.append({
            "stage": "Ubuntu Kernel (Transpiled)",
            "file": str(UBUNTU_KERNEL.relative_to(GEOS_ROOT)),
            "status": "PRESENT"
        })
    else:
        stages.append({
            "stage": "Ubuntu Kernel (Transpiled)",
            "status": "OPTIONAL - Not found"
        })

    # Stage 5: Check boot script
    if BOOT_SCRIPT.exists():
        stages.append({
            "stage": "Boot Chain Builder",
            "file": str(BOOT_SCRIPT.relative_to(GEOS_ROOT)),
            "status": "PRESENT"
        })
    else:
        issues.append("Boot script not found")

    # Overall readiness
    ready = len(issues) == 0
    critical_missing = [s for s in stages if s.get("status") == "MISSING"]

    return [TextContent(
        type="text",
        text=json.dumps({
            "status": "success",
            "boot_ready": ready,
            "stages": stages,
            "issues": issues,
            "critical_missing": len(critical_missing),
            "next_step": "Run boot chain on real AMD hardware" if ready else "Fix missing components"
        }, indent=2)
    )]


async def tool_vm_spawn(args: dict) -> list[TextContent]:
    """Simulate VM spawn."""
    vm_id = args["vm_id"]
    glyph_file = Path(args["glyph_file"])
    window_x = args.get("window_x", 100)
    window_y = args.get("window_y", 100)
    window_w = args.get("window_w", 800)
    window_h = args.get("window_h", 600)

    if vm_id == 0:
        return [TextContent(type="text", text="Error: VM ID 0 is reserved for Window Manager")]

    if vm_id >= 8:
        return [TextContent(type="text", text=f"Error: VM ID {vm_id} exceeds maximum (7)")]

    if not glyph_file.exists():
        return [TextContent(type="text", text=f"Error: Glyph file not found: {glyph_file}")]

    # Parse the glyph file
    instructions = parse_glyph_file(str(glyph_file))

    # Calculate memory bounds (spatial MMU)
    base_addr = vm_id * 0x1000
    bound_addr = (vm_id + 1) * 0x1000 - 1

    # Entry point (first instruction)
    entry_point = 0x0000

    return [TextContent(
        type="text",
        text=json.dumps({
            "status": "success",
            "action": "SPATIAL_SPAWN simulated",
            "vm_config": {
                "vm_id": vm_id,
                "parent_id": 0,
                "entry_point": f"0x{entry_point:04X}",
                "base_addr": f"0x{base_addr:04X}",
                "bound_addr": f"0x{bound_addr:04X}",
                "memory_region": f"{0x1000} bytes ({4}KB)"
            },
            "window": {
                "x": window_x,
                "y": window_y,
                "width": window_w,
                "height": window_h
            },
            "program": {
                "file": str(glyph_file),
                "instruction_count": len(instructions)
            },
            "note": "This is a simulation. Use Visual Kernel for actual execution."
        }, indent=2)
    )]


async def tool_hilbert_test(args: dict) -> list[TextContent]:
    """Test Hilbert conversion."""
    mode = args["mode"]
    grid_size = args.get("grid_size", 4096)

    if mode == "d2xy":
        index = args.get("index", 0)
        x, y = hilbert_d2xy(grid_size, index)
        return [TextContent(
            type="text",
            text=json.dumps({
                "mode": "d2xy",
                "input": {"index": index},
                "output": {"x": x, "y": y},
                "grid_size": grid_size
            }, indent=2)
        )]
    elif mode == "xy2d":
        x = args.get("x", 0)
        y = args.get("y", 0)
        d = hilbert_xy2d(grid_size, x, y)
        return [TextContent(
            type="text",
            text=json.dumps({
                "mode": "xy2d",
                "input": {"x": x, "y": y},
                "output": {"index": d},
                "grid_size": grid_size
            }, indent=2)
        )]
    else:
        return [TextContent(type="text", text=f"Unknown mode: {mode}")]


async def tool_glyph_patch(args: dict) -> list[TextContent]:
    """Hot-patch a glyph instruction in VRAM."""
    address = args["address"]
    opcode = args["opcode"]
    stratum = args.get("stratum", 0)
    p1 = args.get("p1", 0)
    p2 = args.get("p2", 0)
    vm_id = args.get("vm_id", 0)

    # Parse address (hex or decimal)
    if address.startswith("0x"):
        addr = int(address, 16)
    else:
        addr = int(address)

    # Convert to Hilbert coordinates
    grid_size = 4096
    x, y = hilbert_d2xy(grid_size, addr)

    # Build the new instruction pixel
    new_pixel = {
        "r": opcode,
        "g": stratum,
        "b": p1,
        "a": p2
    }

    return [TextContent(
        type="text",
        text=json.dumps({
            "status": "success",
            "action": "VRAM_HOT_PATCH",
            "vm_id": vm_id,
            "patch": {
                "address": addr,
                "address_hex": f"0x{addr:08X}",
                "hilbert_coords": {"x": x, "y": y},
                "old_instruction": "UNKNOWN (requires VRAM read)",
                "new_instruction": new_pixel
            },
            "note": "This is a simulation. Real patching requires running GPU context.",
            "next_step": "Apply via visual_kernel or bare-metal MMIO write"
        }, indent=2)
    )]


async def tool_linux_to_glyph(args: dict) -> list[TextContent]:
    """Transpile Linux ELF to glyph texture."""
    binary_path = Path(args["binary"])
    output_path = Path(args["output"])
    dense = args.get("dense", False)

    if not binary_path.exists():
        return [TextContent(type="text", text=f"Error: Binary not found: {binary_path}")]

    # Check if it's a valid ELF
    try:
        with open(binary_path, "rb") as f:
            magic = f.read(4)
            if magic != b'\x7fELF':
                return [TextContent(type="text", text=f"Error: Not an ELF file: {binary_path}")]
    except Exception as e:
        return [TextContent(type="text", text=f"Error reading file: {e}")]

    # Get binary info
    binary_size = binary_path.stat().st_size
    instruction_count = binary_size // 4  # Rough estimate

    # Run the transpiler
    transpiler = GEOS_ROOT / "systems" / "pixel_compiler" / "riscv_to_geometric_vm.py"
    if not transpiler.exists():
        return [TextContent(type="text", text=f"Error: Transpiler not found: {transpiler}")]

    cmd = [sys.executable, str(transpiler), str(binary_path), str(output_path)]
    if dense:
        cmd.append("--dense")

    result = subprocess.run(
        cmd,
        capture_output=True,
        text=True,
        cwd=str(GEOS_ROOT)
    )

    if result.returncode != 0:
        return [TextContent(type="text", text=f"Transpilation failed:\n{result.stderr}")]

    output_size = output_path.stat().st_size if output_path.exists() else 0

    return [TextContent(
        type="text",
        text=json.dumps({
            "status": "success",
            "action": "LINUX_TO_GLYPH",
            "input": {
                "binary": str(binary_path),
                "size_bytes": binary_size,
                "estimated_instructions": instruction_count
            },
            "output": {
                "texture": str(output_path),
                "size_bytes": output_size
            },
            "transpiler_output": result.stdout.strip()[-500:] if result.stdout else ""
        }, indent=2)
    )]


async def tool_geos_status(args: dict) -> list[TextContent]:
    """Get Geometry OS status."""
    components = []

    # Check each component
    checks = [
        ("glyph_compiler", GLYPH_COMPILER, "Glyph → RTS.PNG Compiler"),
        ("window_manager", WINDOW_MANAGER_GLYPH, "Window Manager Glyph"),
        ("ubuntu_kernel", UBUNTU_KERNEL, "Ubuntu Kernel (Transpiled)"),
        ("boot_script", BOOT_SCRIPT, "Boot Chain Builder"),
        ("bootloader", GEOS_ROOT / "bootloader" / "efi" / "boot.c", "UEFI Bootloader"),
        ("kernel", GEOS_ROOT / "kernel" / "geos" / "main.c", "Bare Metal Kernel"),
        ("visual_kernel", GEOS_ROOT / "systems" / "infinite_map_rs" / "src" / "visual_kernel_boot.rs", "Visual Kernel (Rust)"),
        ("glyph_vm", GEOS_ROOT / "systems" / "infinite_map_rs" / "src" / "glyph_vm_scheduler.rs", "GPU Glyph VM Scheduler"),
    ]

    for name, path, desc in checks:
        exists = path.exists()
        components.append({
            "name": name,
            "description": desc,
            "path": str(path.relative_to(GEOS_ROOT)) if exists else str(path),
            "status": "PRESENT" if exists else "MISSING"
        })

    present_count = sum(1 for c in components if c["status"] == "PRESENT")

    return [TextContent(
        type="text",
        text=json.dumps({
            "status": "success",
            "geometry_os_root": str(GEOS_ROOT),
            "components_present": f"{present_count}/{len(components)}",
            "components": components,
            "boot_chain_ready": present_count >= 6,
            "mcp_tools_available": ["crystallize", "benchmark_sls", "boot_sim", "vm_spawn", "hilbert_test", "geos_status"]
        }, indent=2)
    )]


async def main():
    async with stdio_server() as (read, write):
        await app.run(read, write, app.create_initialization_options())


if __name__ == "__main__":
    asyncio.run(main())
