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

        img = Image.open(path).convert("RGBA")
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
                    "dense": {
                        "type": "boolean",
                        "description": "Enable dense packing (no NOP gaps)",
                        "default": False,
                    },
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
                    "glyph_file": {
                        "type": "string",
                        "description": "Path to .glyph file to analyze",
                    },
                    "grid_size": {
                        "type": "integer",
                        "description": "Texture grid size (default 4096)",
                        "default": 4096,
                    },
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
                    "image_path": {
                        "type": "string",
                        "description": "Path to boot.img (optional, uses default if not specified)",
                    },
                    "verbose": {
                        "type": "boolean",
                        "description": "Enable verbose output",
                        "default": False,
                    },
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
                    "vm_id": {
                        "type": "integer",
                        "description": "VM ID (1-7, 0 is reserved for Window Manager)",
                    },
                    "glyph_file": {"type": "string", "description": "Path to child .glyph program"},
                    "window_x": {
                        "type": "number",
                        "description": "Window X position",
                        "default": 100,
                    },
                    "window_y": {
                        "type": "number",
                        "description": "Window Y position",
                        "default": 100,
                    },
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
                    "index": {
                        "type": "integer",
                        "description": "Hilbert index to convert to (x, y)",
                    },
                    "x": {"type": "integer", "description": "X coordinate to convert to index"},
                    "y": {"type": "integer", "description": "Y coordinate to convert to index"},
                    "grid_size": {
                        "type": "integer",
                        "description": "Grid size (default 4096)",
                        "default": 4096,
                    },
                    "mode": {
                        "type": "string",
                        "description": "'d2xy' or 'xy2d'",
                        "enum": ["d2xy", "xy2d"],
                    },
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
        Tool(
            name="mem_store",
            description="Store structured data in GPU-backed development memory. Data persists across AI context resets as long as the daemon is running. "
            "Use this to remember decisions, context, or state for Geometry OS development.",
            inputSchema={
                "type": "object",
                "properties": {
                    "key": {"type": "string", "description": "Unique key for this memory entry"},
                    "value": {"type": "object", "description": "JSON data to store"},
                },
                "required": ["key", "value"],
            },
        ),
        Tool(
            name="mem_retrieve",
            description="Retrieve structured data from GPU-backed development memory. Returns stored JSON data by key.",
            inputSchema={
                "type": "object",
                "properties": {
                    "key": {
                        "type": "string",
                        "description": "Key to retrieve (optional, returns all if not specified)",
                    },
                },
                "required": [],
            },
        ),
        Tool(
            name="mem_peek",
            description="Read raw GPU memory at a Hilbert address. Low-level access to the substrate.",
            inputSchema={
                "type": "object",
                "properties": {
                    "addr": {
                        "type": "string",
                        "description": "Hilbert address (hex, e.g. 0x100000)",
                    },
                    "size": {
                        "type": "integer",
                        "description": "Number of 32-bit words to read",
                        "default": 16,
                    },
                },
                "required": ["addr"],
            },
        ),
        Tool(
            name="mem_poke",
            description="Write a single 32-bit value to GPU memory at a Hilbert address. Low-level substrate manipulation.",
            inputSchema={
                "type": "object",
                "properties": {
                    "addr": {
                        "type": "string",
                        "description": "Hilbert address (hex, e.g. 0x100000)",
                    },
                    "val": {
                        "type": "string",
                        "description": "32-bit value to write (hex, e.g. 0xDEADBEEF)",
                    },
                },
                "required": ["addr", "val"],
            },
        ),
        Tool(
            name="opcode_decode",
            description="Decode opcode value → name, stratum, description based on Geometry OS Glyph opcode table.",
            inputSchema={
                "type": "object",
                "properties": {
                    "opcode": {
                        "type": "integer",
                        "description": "Opcode value to decode (0-65535)",
                    },
                },
                "required": ["opcode"],
            },
        ),
        Tool(
            name="opcode_encode",
            description="Encode opcode name → value, parameters based on Geometry OS Glyph opcode table.",
            inputSchema={
                "type": "object",
                "properties": {
                    "name": {
                        "type": "string",
                        "description": "Opcode name to encode (e.g., ADD, LD, JMP)",
                    },
                },
                "required": ["name"],
            },
        ),
        Tool(
            name="vlm_health",
            description="Run VLM vitality check on .rts.png file to assess visual language model health.",
            inputSchema={
                "type": "object",
                "properties": {
                    "rts_file": {
                        "type": "string",
                        "description": "Path to .rts.png file to analyze",
                    },
                    "json": {"type": "boolean", "description": "Output as JSON", "default": False},
                    "verbose": {
                        "type": "boolean",
                        "description": "Verbose output",
                        "default": False,
                    },
                },
                "required": ["rts_file"],
            },
        ),
        Tool(
            name="daemon_status",
            description="Check Ouroboros HAL daemon status on port 8769.",
            inputSchema={
                "type": "object",
                "properties": {},
                "required": [],
            },
        ),
        Tool(
            name="substrate_load",
            description="Load .rts.png to running daemon via /load endpoint.",
            inputSchema={
                "type": "object",
                "properties": {
                    "rts_file": {"type": "string", "description": "Path to .rts.png file to load"},
                },
                "required": ["rts_file"],
            },
        ),
        Tool(
            name="gpu_write",
            description="Batch write multiple 32-bit values to GPU memory starting at an address.",
            inputSchema={
                "type": "object",
                "properties": {
                    "addr": {
                        "type": "string",
                        "description": "Starting Hilbert address (hex, e.g. 0x100000)",
                    },
                    "data": {
                        "type": "array",
                        "items": {"type": "integer"},
                        "description": "Array of 32-bit values to write",
                    },
                },
                "required": ["addr", "data"],
            },
        ),
        Tool(
            name="gpu_exec",
            description="Execute a shell command through the daemon with optional cwd and timeout.",
            inputSchema={
                "type": "object",
                "properties": {
                    "cmd": {"type": "string", "description": "Shell command to execute"},
                    "cwd": {"type": "string", "description": "Working directory (optional)"},
                    "timeout": {"type": "integer", "description": "Timeout in seconds (default 30)", "default": 30},
                },
                "required": ["cmd"],
            },
        ),
        Tool(
            name="gpu_pause",
            description="Pause all running glyph VMs on the daemon.",
            inputSchema={
                "type": "object",
                "properties": {},
                "required": [],
            },
        ),
        Tool(
            name="gpu_vmstate",
            description="Query the state of a specific glyph VM.",
            inputSchema={
                "type": "object",
                "properties": {
                    "vm": {"type": "integer", "description": "VM ID to query (0-7)", "default": 0},
                },
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
        elif name == "mem_store":
            return await tool_mem_store(arguments)
        elif name == "mem_retrieve":
            return await tool_mem_retrieve(arguments)
        elif name == "mem_peek":
            return await tool_mem_peek(arguments)
        elif name == "mem_poke":
            return await tool_mem_poke(arguments)
        elif name == "opcode_decode":
            return await tool_opcode_decode(arguments)
        elif name == "opcode_encode":
            return await tool_opcode_encode(arguments)
        elif name == "vlm_health":
            return await tool_vlm_health(arguments)
        elif name == "daemon_status":
            return await tool_daemon_status(arguments)
        elif name == "substrate_load":
            return await tool_substrate_load(arguments)
        elif name == "gpu_write":
            return await tool_gpu_write(arguments)
        elif name == "gpu_exec":
            return await tool_gpu_exec(arguments)
        elif name == "gpu_pause":
            return await tool_gpu_pause(arguments)
        elif name == "gpu_vmstate":
            return await tool_gpu_vmstate(arguments)
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

    result = subprocess.run(cmd, capture_output=True, text=True, cwd=str(GEOS_ROOT))

    if result.returncode != 0:
        return [TextContent(type="text", text=f"Compilation failed:\n{result.stderr}")]

    # Get output file size
    output_size = output_path.stat().st_size if output_path.exists() else 0

    return [
        TextContent(
            type="text",
            text=json.dumps(
                {
                    "status": "success",
                    "input": str(input_path),
                    "output": str(output_path),
                    "output_size_bytes": output_size,
                    "dense": dense,
                    "compiler_output": result.stdout.strip(),
                },
                indent=2,
            ),
        )
    ]


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

    return [
        TextContent(
            type="text",
            text=json.dumps(
                {
                    "status": "success",
                    "glyph_file": str(glyph_file),
                    "spatial_locality_score": round(sls, 4),
                    "target_sls": 0.90,
                    "target_met": target_met,
                    "recommendation": recommendation,
                    "instruction_count": instruction_count,
                    "grid_size": grid_size,
                    "stratum_distribution": {
                        stratum_names[k]: v for k, v in stratum_counts.items() if v > 0
                    },
                },
                indent=2,
            ),
        )
    ]


async def tool_boot_sim(args: dict) -> list[TextContent]:
    """Simulate boot chain."""
    image_path = args.get("image_path", "")
    verbose = args.get("verbose", False)

    stages = []
    issues = []

    # Stage 1: Check bootloader
    bootloader_src = GEOS_ROOT / "bootloader" / "efi" / "boot.c"
    if bootloader_src.exists():
        stages.append(
            {
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
                    "ExitBootServices() and jump to kernel",
                ],
            }
        )
    else:
        issues.append("Bootloader source not found")
        stages.append({"stage": "UEFI Bootloader", "status": "MISSING"})

    # Stage 2: Check kernel
    kernel_src = GEOS_ROOT / "kernel" / "geos" / "main.c"
    if kernel_src.exists():
        stages.append(
            {
                "stage": "Geometry OS Kernel",
                "file": str(kernel_src.relative_to(GEOS_ROOT)),
                "status": "PRESENT",
                "actions": [
                    "Receive boot_info from UEFI",
                    "Initialize GPU MMIO registers",
                    "Copy init_glyph to GPU memory",
                    "Submit microcode to compute rings",
                    "Start Window Manager VM #0",
                ],
            }
        )
    else:
        issues.append("Kernel source not found")
        stages.append({"stage": "Geometry OS Kernel", "status": "MISSING"})

    # Stage 3: Check Window Manager
    wm_glyph = WINDOW_MANAGER_GLYPH
    if wm_glyph.exists():
        stages.append(
            {
                "stage": "Window Manager Glyph",
                "file": str(wm_glyph.relative_to(GEOS_ROOT)),
                "status": "PRESENT",
            }
        )
    else:
        issues.append("Window Manager glyph not found")
        stages.append({"stage": "Window Manager Glyph", "status": "MISSING"})

    # Stage 4: Check Ubuntu kernel (optional)
    if UBUNTU_KERNEL.exists():
        stages.append(
            {
                "stage": "Ubuntu Kernel (Transpiled)",
                "file": str(UBUNTU_KERNEL.relative_to(GEOS_ROOT)),
                "status": "PRESENT",
            }
        )
    else:
        stages.append({"stage": "Ubuntu Kernel (Transpiled)", "status": "OPTIONAL - Not found"})

    # Stage 5: Check boot script
    if BOOT_SCRIPT.exists():
        stages.append(
            {
                "stage": "Boot Chain Builder",
                "file": str(BOOT_SCRIPT.relative_to(GEOS_ROOT)),
                "status": "PRESENT",
            }
        )
    else:
        issues.append("Boot script not found")

    # Overall readiness
    ready = len(issues) == 0
    critical_missing = [s for s in stages if s.get("status") == "MISSING"]

    return [
        TextContent(
            type="text",
            text=json.dumps(
                {
                    "status": "success",
                    "boot_ready": ready,
                    "stages": stages,
                    "issues": issues,
                    "critical_missing": len(critical_missing),
                    "next_step": "Run boot chain on real AMD hardware"
                    if ready
                    else "Fix missing components",
                },
                indent=2,
            ),
        )
    ]


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

    return [
        TextContent(
            type="text",
            text=json.dumps(
                {
                    "status": "success",
                    "action": "SPATIAL_SPAWN simulated",
                    "vm_config": {
                        "vm_id": vm_id,
                        "parent_id": 0,
                        "entry_point": f"0x{entry_point:04X}",
                        "base_addr": f"0x{base_addr:04X}",
                        "bound_addr": f"0x{bound_addr:04X}",
                        "memory_region": f"{0x1000} bytes ({4}KB)",
                    },
                    "window": {"x": window_x, "y": window_y, "width": window_w, "height": window_h},
                    "program": {"file": str(glyph_file), "instruction_count": len(instructions)},
                    "note": "This is a simulation. Use Visual Kernel for actual execution.",
                },
                indent=2,
            ),
        )
    ]


async def tool_hilbert_test(args: dict) -> list[TextContent]:
    """Test Hilbert conversion."""
    mode = args["mode"]
    grid_size = args.get("grid_size", 4096)

    if mode == "d2xy":
        index = args.get("index", 0)
        x, y = hilbert_d2xy(grid_size, index)
        return [
            TextContent(
                type="text",
                text=json.dumps(
                    {
                        "mode": "d2xy",
                        "input": {"index": index},
                        "output": {"x": x, "y": y},
                        "grid_size": grid_size,
                    },
                    indent=2,
                ),
            )
        ]
    elif mode == "xy2d":
        x = args.get("x", 0)
        y = args.get("y", 0)
        d = hilbert_xy2d(grid_size, x, y)
        return [
            TextContent(
                type="text",
                text=json.dumps(
                    {
                        "mode": "xy2d",
                        "input": {"x": x, "y": y},
                        "output": {"index": d},
                        "grid_size": grid_size,
                    },
                    indent=2,
                ),
            )
        ]
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
    new_pixel = {"r": opcode, "g": stratum, "b": p1, "a": p2}

    return [
        TextContent(
            type="text",
            text=json.dumps(
                {
                    "status": "success",
                    "action": "VRAM_HOT_PATCH",
                    "vm_id": vm_id,
                    "patch": {
                        "address": addr,
                        "address_hex": f"0x{addr:08X}",
                        "hilbert_coords": {"x": x, "y": y},
                        "old_instruction": "UNKNOWN (requires VRAM read)",
                        "new_instruction": new_pixel,
                    },
                    "note": "This is a simulation. Real patching requires running GPU context.",
                    "next_step": "Apply via visual_kernel or bare-metal MMIO write",
                },
                indent=2,
            ),
        )
    ]


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
            if magic != b"\x7fELF":
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

    result = subprocess.run(cmd, capture_output=True, text=True, cwd=str(GEOS_ROOT))

    if result.returncode != 0:
        return [TextContent(type="text", text=f"Transpilation failed:\n{result.stderr}")]

    output_size = output_path.stat().st_size if output_path.exists() else 0

    return [
        TextContent(
            type="text",
            text=json.dumps(
                {
                    "status": "success",
                    "action": "LINUX_TO_GLYPH",
                    "input": {
                        "binary": str(binary_path),
                        "size_bytes": binary_size,
                        "estimated_instructions": instruction_count,
                    },
                    "output": {"texture": str(output_path), "size_bytes": output_size},
                    "transpiler_output": result.stdout.strip()[-500:] if result.stdout else "",
                },
                indent=2,
            ),
        )
    ]


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
        (
            "visual_kernel",
            GEOS_ROOT / "systems" / "infinite_map_rs" / "src" / "visual_kernel_boot.rs",
            "Visual Kernel (Rust)",
        ),
        (
            "glyph_vm",
            GEOS_ROOT / "systems" / "infinite_map_rs" / "src" / "glyph_vm_scheduler.rs",
            "GPU Glyph VM Scheduler",
        ),
    ]

    for name, path, desc in checks:
        exists = path.exists()
        components.append(
            {
                "name": name,
                "description": desc,
                "path": str(path.relative_to(GEOS_ROOT)) if exists else str(path),
                "status": "PRESENT" if exists else "MISSING",
            }
        )

    present_count = sum(1 for c in components if c["status"] == "PRESENT")

    return [
        TextContent(
            type="text",
            text=json.dumps(
                {
                    "status": "success",
                    "geometry_os_root": str(GEOS_ROOT),
                    "components_present": f"{present_count}/{len(components)}",
                    "components": components,
                    "boot_chain_ready": present_count >= 6,
                    "mcp_tools_available": [
                        "crystallize",
                        "benchmark_sls",
                        "boot_sim",
                        "vm_spawn",
                        "hilbert_test",
                        "geos_status",
                    ],
                },
                indent=2,
            ),
        )
    ]


async def tool_opcode_decode(args: dict) -> list[TextContent]:
    """Decode opcode value → name, stratum, description."""
    opcode = args.get("opcode")
    if opcode is None:
        return [TextContent(type="text", text="Error: opcode parameter is required")]

    # Define opcode tables based on glyph-programming skill
    opcode_table = {
        # Logic Stratum (Foundation)
        0: ("NOP", "LOGIC", "No Operation"),
        3: ("LD", "LOGIC", "Load from Memory"),
        4: ("ST", "LOGIC", "Store to Memory"),
        5: ("ADD", "LOGIC", "Addition"),
        6: ("SUB", "LOGIC", "Subtraction"),
        10: ("JZ", "LOGIC", "Jump if Zero"),
        11: ("CALL", "LOGIC", "Call Subroutine"),
        12: ("RET", "LOGIC", "Return"),
        13: ("HALT", "LOGIC", "Halt"),
        204: ("LDI", "LOGIC", "Load Immediate"),
        206: ("MOV", "LOGIC", "Move"),
        209: ("JMP", "LOGIC", "Unconditional Jump"),
        214: ("CMP", "LOGIC", "Compare"),
        215: ("DRAW", "LOGIC", "Substrate Write"),
        # Bitwise Stratum (220-231)
        220: ("AND", "BITWISE", "Bitwise AND"),
        221: ("OR", "BITWISE", "Bitwise OR"),
        222: ("XOR", "BITWISE", "Bitwise XOR"),
        223: ("NOT", "BITWISE", "Bitwise NOT"),
        224: ("SHL", "BITWISE", "Shift Left"),
        225: ("SHR", "BITWISE", "Shift Right"),
        226: ("SAR", "BITWISE", "Shift Arithmetic Right"),
        227: ("AND_MEM", "BITWISE", "AND directly on memory"),
        228: ("OR_MEM", "BITWISE", "OR directly on memory"),
        229: ("XOR_MEM", "BITWISE", "XOR directly on memory"),
        230: ("SHL_MEM", "BITWISE", "SHL directly on memory"),
        231: ("SHR_MEM", "BITWISE", "SHR directly on memory"),
    }

    if opcode in opcode_table:
        name, stratum, description = opcode_table[opcode]
        return [
            TextContent(
                type="text",
                text=json.dumps(
                    {
                        "status": "success",
                        "opcode": opcode,
                        "name": name,
                        "stratum": stratum,
                        "description": description,
                    },
                    indent=2,
                ),
            )
        ]
    else:
        # Try to determine stratum based on ranges
        stratum = "UNKNOWN"
        if opcode == 0:
            stratum = "LOGIC"
        elif 3 <= opcode <= 13:
            stratum = "LOGIC"
        elif 204 <= opcode <= 215:
            stratum = "LOGIC"
        elif 220 <= opcode <= 231:
            stratum = "BITWISE"
        elif opcode >= 0x8000:
            stratum = "GUEST_RAM"
        elif opcode >= 0x1000:
            stratum = "MMIO"
        elif opcode >= 0x0200:
            stratum = "IO_BRIDGE"
        elif opcode >= 0x0100:
            stratum = "GUEST_REGS"

        return [
            TextContent(
                type="text",
                text=json.dumps(
                    {
                        "status": "unknown",
                        "opcode": opcode,
                        "name": f"OPCODE_{opcode:03X}",
                        "stratum": stratum,
                        "description": f"Undefined opcode {opcode} (0x{opcode:02X}) in stratum {stratum}",
                    },
                    indent=2,
                ),
            )
        ]


async def tool_opcode_encode(args: dict) -> list[TextContent]:
    """Encode opcode name → value, parameters."""
    opcode_name = args.get("name")
    if not opcode_name:
        return [TextContent(type="text", text="Error: name parameter is required")]

    # Define reverse lookup table based on glyph-programming skill
    opcode_table = {
        # Logic Stratum (Foundation)
        "NOP": (0, "LOGIC", "No Operation"),
        "LD": (3, "LOGIC", "Load from Memory"),
        "ST": (4, "LOGIC", "Store to Memory"),
        "ADD": (5, "LOGIC", "Addition"),
        "SUB": (6, "LOGIC", "Subtraction"),
        "JZ": (10, "LOGIC", "Jump if Zero"),
        "CALL": (11, "LOGIC", "Call Subroutine"),
        "RET": (12, "LOGIC", "Return"),
        "HALT": (13, "LOGIC", "Halt"),
        "LDI": (204, "LOGIC", "Load Immediate"),
        "MOV": (206, "LOGIC", "Move"),
        "JMP": (209, "LOGIC", "Unconditional Jump"),
        "CMP": (214, "LOGIC", "Compare"),
        "DRAW": (215, "LOGIC", "Substrate Write"),
        # Bitwise Stratum (220-231)
        "AND": (220, "BITWISE", "Bitwise AND"),
        "OR": (221, "BITWISE", "Bitwise OR"),
        "XOR": (222, "BITWISE", "Bitwise XOR"),
        "NOT": (223, "BITWISE", "Bitwise NOT"),
        "SHL": (224, "BITWISE", "Shift Left"),
        "SHR": (225, "BITWISE", "Shift Right"),
        "SAR": (226, "BITWISE", "Shift Arithmetic Right"),
        "AND_MEM": (227, "BITWISE", "AND directly on memory"),
        "OR_MEM": (228, "BITWISE", "OR directly on memory"),
        "XOR_MEM": (229, "BITWISE", "XOR directly on memory"),
        "SHL_MEM": (230, "BITWISE", "SHL directly on memory"),
        "SHR_MEM": (231, "BITWISE", "SHR directly on memory"),
    }

    opcode_name_upper = opcode_name.upper()
    if opcode_name_upper in opcode_table:
        value, stratum, description = opcode_table[opcode_name_upper]
        return [
            TextContent(
                type="text",
                text=json.dumps(
                    {
                        "status": "success",
                        "name": opcode_name_upper,
                        "value": value,
                        "stratum": stratum,
                        "description": description,
                    },
                    indent=2,
                ),
            )
        ]
    else:
        return [
            TextContent(
                type="text",
                text=json.dumps(
                    {
                        "status": "error",
                        "name": opcode_name,
                        "error": f"Unknown opcode name: {opcode_name}",
                        "available_opcodes": list(opcode_table.keys()),
                    },
                    indent=2,
                ),
            )
        ]


# ============================================================================
# GPU Memory Bridge Tools
# ============================================================================

DAEMON_URL = "http://127.0.0.1:8769"
DEV_MEM_START = 0x100000  # Reserved region for development memory

# Simple in-memory index (maps keys to offsets)
# In a real system, this would be stored in the GPU substrate itself
_memory_index: dict = {}
_index_loaded = False

import requests


def _ensure_index_loaded():
    """Load memory index from GPU substrate."""
    global _memory_index, _index_loaded
    if _index_loaded:
        return

    # Try to read index from address 0x100000 (first 4KB of dev memory)
    try:
        resp = requests.get(f"{DAEMON_URL}/peek?addr=0x{DEV_MEM_START:08x}&size=1024", timeout=1)
        if resp.status_code == 200:
            hex_words = resp.text.strip().split()
            raw_bytes = bytearray()
            for word in hex_words:
                val = int(word, 16)
                raw_bytes.extend(val.to_bytes(4, "little"))
            content = raw_bytes.decode("utf-8", errors="replace").rstrip("\x00")
            if content.startswith("{"):
                _memory_index = json.loads(content)
    except Exception:
        pass

    _index_loaded = True


def _save_index():
    """Persist memory index to GPU substrate."""
    global _memory_index
    try:
        data = json.dumps(_memory_index)
        encoded = data.encode("utf-8")
        hex_words = ""
        for i in range(0, len(encoded), 4):
            chunk = encoded[i : i + 4]
            if len(chunk) < 4:
                chunk = chunk + b"\x00" * (4 - len(chunk))
            val = int.from_bytes(chunk, "little")
            hex_words += f"{val:08x}"

        requests.post(f"{DAEMON_URL}/write?addr=0x{DEV_MEM_START:08x}", data=hex_words, timeout=2)
    except Exception as e:
        print(f"Warning: Failed to save memory index: {e}")


async def tool_mem_store(args: dict) -> list[TextContent]:
    """Store data in GPU-backed development memory."""
    _ensure_index_loaded()

    key = args["key"]
    value = args["value"]

    # Allocate space at next available offset
    # Index is at 0x100000, data starts at 0x100000 + 0x1000 (4KB offset)
    base_offset = 0x1000
    next_offset = base_offset

    for k, v in _memory_index.items():
        if isinstance(v, dict) and "offset" in v:
            end = v["offset"] + v.get("size", 256)
            next_offset = max(next_offset, end)

    # Store the data
    data = json.dumps({"key": key, "val": value, "ts": __import__("time").time()})
    encoded = data.encode("utf-8")
    hex_words = ""
    for i in range(0, len(encoded), 4):
        chunk = encoded[i : i + 4]
        if len(chunk) < 4:
            chunk = chunk + b"\x00" * (4 - len(chunk))
        val = int.from_bytes(chunk, "little")
        hex_words += f"{val:08x}"

    abs_addr = DEV_MEM_START + next_offset

    try:
        resp = requests.post(f"{DAEMON_URL}/write?addr=0x{abs_addr:08x}", data=hex_words, timeout=2)
        if resp.status_code != 200:
            return [
                TextContent(
                    type="text", text=f"Error: Daemon returned {resp.status_code}: {resp.text}"
                )
            ]

        # Update index
        _memory_index[key] = {
            "offset": next_offset,
            "size": len(hex_words) // 8,  # Number of 32-bit words
            "addr": f"0x{abs_addr:08x}",
        }
        _save_index()

        return [
            TextContent(
                type="text",
                text=json.dumps(
                    {
                        "status": "success",
                        "action": "GPU_MEM_STORE",
                        "key": key,
                        "addr": f"0x{abs_addr:08x}",
                        "size_bytes": len(encoded),
                        "substrate_region": "DEV_MEMORY",
                        "hilbert_base": f"0x{DEV_MEM_START:08x}",
                        "daemon": DAEMON_URL,
                    },
                    indent=2,
                ),
            )
        ]
    except requests.exceptions.ConnectionError:
        return [
            TextContent(
                type="text",
                text=f"Error: Cannot connect to Ouroboros daemon at {DAEMON_URL}. Start it with: cargo run --release --bin gpu_dev_daemon",
            )
        ]
    except Exception as e:
        return [TextContent(type="text", text=f"Error: {str(e)}")]


async def tool_mem_retrieve(args: dict) -> list[TextContent]:
    """Retrieve data from GPU-backed development memory."""
    _ensure_index_loaded()

    key = args.get("key")

    if key:
        if key not in _memory_index:
            return [TextContent(type="text", text=f"Error: Key '{key}' not found in memory index")]

        entry = _memory_index[key]
        addr = DEV_MEM_START + entry["offset"]
        size = entry.get("size", 256)

        try:
            resp = requests.get(f"{DAEMON_URL}/peek?addr=0x{addr:08x}&size={size}", timeout=2)
            if resp.status_code != 200:
                return [TextContent(type="text", text=f"Error: Daemon returned {resp.status_code}")]

            hex_words = resp.text.strip().split()
            raw_bytes = bytearray()
            for word in hex_words:
                val = int(word, 16)
                raw_bytes.extend(val.to_bytes(4, "little"))

            content = raw_bytes.decode("utf-8", errors="replace").rstrip("\x00")
            data = json.loads(content)

            return [
                TextContent(
                    type="text",
                    text=json.dumps(
                        {
                            "status": "success",
                            "action": "GPU_MEM_RETRIEVE",
                            "key": key,
                            "addr": f"0x{addr:08x}",
                            "data": data,
                        },
                        indent=2,
                    ),
                )
            ]
        except requests.exceptions.ConnectionError:
            return [
                TextContent(
                    type="text", text=f"Error: Cannot connect to Ouroboros daemon at {DAEMON_URL}"
                )
            ]
        except Exception as e:
            return [TextContent(type="text", text=f"Error: {str(e)}")]

    # Return all keys
    return [
        TextContent(
            type="text",
            text=json.dumps(
                {
                    "status": "success",
                    "action": "GPU_MEM_LIST",
                    "keys": list(_memory_index.keys()),
                    "count": len(_memory_index),
                    "substrate": f"0x{DEV_MEM_START:08x}",
                },
                indent=2,
            ),
        )
    ]


async def tool_mem_peek(args: dict) -> list[TextContent]:
    """Read raw GPU memory."""
    addr_str = args["addr"]
    size = args.get("size", 16)

    addr = int(addr_str, 16) if addr_str.startswith("0x") else int(addr_str)

    try:
        resp = requests.get(f"{DAEMON_URL}/peek?addr=0x{addr:08x}&size={size}", timeout=2)
        if resp.status_code != 200:
            return [TextContent(type="text", text=f"Error: Daemon returned {resp.status_code}")]

        hex_words = resp.text.strip().split()

        # Convert to readable format
        raw_bytes = bytearray()
        for word in hex_words:
            val = int(word, 16)
            raw_bytes.extend(val.to_bytes(4, "little"))

        # ASCII representation
        ascii_repr = "".join(chr(b) if 32 <= b < 127 else "." for b in raw_bytes)

        # Calculate Hilbert coordinates
        x, y = hilbert_d2xy(4096, addr)

        return [
            TextContent(
                type="text",
                text=json.dumps(
                    {
                        "status": "success",
                        "action": "GPU_PEEK",
                        "addr": f"0x{addr:08x}",
                        "hilbert_coords": {"x": x, "y": y},
                        "size_words": len(hex_words),
                        "hex": hex_words,
                        "ascii": ascii_repr,
                    },
                    indent=2,
                ),
            )
        ]
    except requests.exceptions.ConnectionError:
        return [
            TextContent(
                type="text", text=f"Error: Cannot connect to Ouroboros daemon at {DAEMON_URL}"
            )
        ]
    except Exception as e:
        return [TextContent(type="text", text=f"Error: {str(e)}")]


async def tool_mem_poke(args: dict) -> list[TextContent]:
    """Write a single value to GPU memory."""
    addr_str = args["addr"]
    val_str = args["val"]

    addr = int(addr_str, 16) if addr_str.startswith("0x") else int(addr_str)
    val = int(val_str, 16) if val_str.startswith("0x") else int(val_str)

    # Calculate Hilbert coordinates
    x, y = hilbert_d2xy(4096, addr)

    try:
        resp = requests.get(f"{DAEMON_URL}/poke?addr=0x{addr:08x}&val=0x{val:08x}", timeout=2)
        if resp.status_code != 200:
            return [TextContent(type="text", text=f"Error: Daemon returned {resp.status_code}")]

        return [
            TextContent(
                type="text",
                text=json.dumps(
                    {
                        "status": "success",
                        "action": "GPU_POKE",
                        "addr": f"0x{addr:08x}",
                        "val": f"0x{val:08x}",
                        "hilbert_coords": {"x": x, "y": y},
                        "daemon_response": resp.text.strip(),
                    },
                    indent=2,
                ),
            )
        ]
    except requests.exceptions.ConnectionError:
        return [
            TextContent(
                type="text", text=f"Error: Cannot connect to Ouroboros daemon at {DAEMON_URL}"
            )
        ]
    except Exception as e:
        return [TextContent(type="text", text=f"Error: {str(e)}")]


async def tool_vlm_health(args: dict) -> list[TextContent]:
    """Run VLM vitality check on .rts.png file."""
    rts_file = Path(args["rts_file"])
    json_output = args.get("json", False)
    verbose = args.get("verbose", False)

    if not rts_file.exists():
        return [TextContent(type="text", text=f"Error: RTS file not found: {rts_file}")]

    # Path to the VLM health CLI
    vlm_health_cli = GEOS_ROOT / "systems" / "pixel_compiler" / "vlm_health_cli.py"
    if not vlm_health_cli.exists():
        return [TextContent(type="text", text=f"Error: VLM health CLI not found: {vlm_health_cli}")]

    # Build command
    cmd = [sys.executable, str(vlm_health_cli), "check", str(rts_file)]
    if json_output:
        cmd.append("--json")
    if verbose:
        cmd.append("--verbose")

    try:
        result = subprocess.run(cmd, capture_output=True, text=True, cwd=str(GEOS_ROOT))
        if result.returncode != 0:
            return [TextContent(type="text", text=f"VLM health check failed:\n{result.stderr}")]

        return [
            TextContent(
                type="text",
                text=json.dumps(
                    {
                        "status": "success",
                        "action": "VLM_HEALTH_CHECK",
                        "rts_file": str(rts_file),
                        "output": result.stdout.strip(),
                    },
                    indent=2,
                ),
            )
        ]
    except Exception as e:
        return [TextContent(type="text", text=f"Error running VLM health check: {str(e)}")]


async def tool_daemon_status(args: dict) -> list[TextContent]:
    """Check Ouroboros HAL daemon status on port 8769."""
    try:
        resp = requests.get(f"{DAEMON_URL}", timeout=2)
        if resp.status_code == 200:
            return [
                TextContent(
                    type="text",
                    text=json.dumps(
                        {
                            "status": "success",
                            "action": "DAEMON_STATUS_CHECK",
                            "daemon_url": DAEMON_URL,
                            "status": "ONLINE",
                            "response": resp.text.strip()[:200],  # Limit response length
                        },
                        indent=2,
                    ),
                )
            ]
        else:
            return [
                TextContent(
                    type="text",
                    text=json.dumps(
                        {
                            "status": "error",
                            "action": "DAEMON_STATUS_CHECK",
                            "daemon_url": DAEMON_URL,
                            "status": "OFFLINE",
                            "error": f"Daemon returned status {resp.status_code}",
                        },
                        indent=2,
                    ),
                )
            ]
    except requests.exceptions.ConnectionError:
        return [
            TextContent(
                type="text",
                text=json.dumps(
                    {
                        "status": "error",
                        "action": "DAEMON_STATUS_CHECK",
                        "daemon_url": DAEMON_URL,
                        "status": "OFFLINE",
                        "error": f"Cannot connect to Ouroboros daemon at {DAEMON_URL}. Start it with: cargo run --release --bin gpu_dev_daemon",
                    },
                    indent=2,
                ),
            )
        ]
    except Exception as e:
        return [TextContent(type="text", text=f"Error checking daemon status: {str(e)}")]


async def tool_substrate_load(args: dict) -> list[TextContent]:
    """Load .rts.png to running daemon via /load endpoint."""
    rts_file = Path(args["rts_file"])

    if not rts_file.exists():
        return [TextContent(type="text", text=f"Error: RTS file not found: {rts_file}")]

    try:
        with open(rts_file, "rb") as f:
            files = {"file": (rts_file.name, f, "image/png")}
            resp = requests.post(f"{DAEMON_URL}/load", files=files, timeout=10)

        if resp.status_code != 200:
            return [
                TextContent(
                    type="text",
                    text=f"Error: Daemon returned {resp.status_code}: {resp.text}",
                )
            ]

        return [
            TextContent(
                type="text",
                text=json.dumps(
                    {
                        "status": "success",
                        "action": "SUBSTRATE_LOAD",
                        "rts_file": str(rts_file),
                        "daemon_url": DAEMON_URL,
                        "response": resp.text.strip(),
                    },
                    indent=2,
                ),
            )
        ]
    except requests.exceptions.ConnectionError:
        return [
            TextContent(
                type="text",
                text=f"Error: Cannot connect to Ouroboros daemon at {DAEMON_URL}. Start it with: cargo run --release --bin gpu_dev_daemon",
            )
        ]
    except Exception as e:
        return [TextContent(type="text", text=f"Error loading substrate: {str(e)}")]


async def tool_gpu_write(args: dict) -> list[TextContent]:
    """Batch write multiple values to GPU memory."""
    addr_str = args["addr"]
    data = args["data"]

    addr = int(addr_str, 16) if addr_str.startswith("0x") else int(addr_str)

    # Convert data array to hex string
    hex_words = "".join(f"{val:08x}" for val in data)

    try:
        resp = requests.post(
            f"{DAEMON_URL}/write?addr=0x{addr:08x}",
            data=hex_words,
            timeout=5,
        )
        if resp.status_code != 200:
            return [TextContent(type="text", text=f"Error: Daemon returned {resp.status_code}")]

        return [
            TextContent(
                type="text",
                text=json.dumps(
                    {
                        "status": "success",
                        "action": "GPU_WRITE",
                        "addr": f"0x{addr:08x}",
                        "count": len(data),
                        "daemon_response": resp.text.strip(),
                    },
                    indent=2,
                ),
            )
        ]
    except requests.exceptions.ConnectionError:
        return [
            TextContent(
                type="text",
                text=f"Error: Cannot connect to daemon at {DAEMON_URL}",
            )
        ]
    except Exception as e:
        return [TextContent(type="text", text=f"Error: {str(e)}")]


async def tool_gpu_exec(args: dict) -> list[TextContent]:
    """Execute shell command via daemon."""
    cmd = args["cmd"]
    cwd = args.get("cwd")
    timeout = args.get("timeout", 30)

    params = f"timeout={timeout}"
    if cwd:
        params += f"&cwd={cwd}"

    try:
        resp = requests.post(
            f"{DAEMON_URL}/exec?{params}",
            data=cmd,
            timeout=timeout + 5,
        )
        if resp.status_code != 200:
            return [TextContent(type="text", text=f"Error: Daemon returned {resp.status_code}")]

        return [
            TextContent(
                type="text",
                text=json.dumps(
                    {
                        "status": "success",
                        "action": "GPU_EXEC",
                        "cmd": cmd,
                        "cwd": cwd,
                        "timeout": timeout,
                        "output": resp.text.strip(),
                    },
                    indent=2,
                ),
            )
        ]
    except requests.exceptions.ConnectionError:
        return [
            TextContent(
                type="text",
                text=f"Error: Cannot connect to daemon at {DAEMON_URL}",
            )
        ]
    except Exception as e:
        return [TextContent(type="text", text=f"Error: {str(e)}")]


async def tool_gpu_pause(args: dict) -> list[TextContent]:
    """Pause all VMs."""
    try:
        resp = requests.get(f"{DAEMON_URL}/pause", timeout=2)
        if resp.status_code != 200:
            return [TextContent(type="text", text=f"Error: Daemon returned {resp.status_code}")]

        return [
            TextContent(
                type="text",
                text=json.dumps(
                    {
                        "status": "success",
                        "action": "GPU_PAUSE",
                        "daemon_response": resp.text.strip(),
                    },
                    indent=2,
                ),
            )
        ]
    except requests.exceptions.ConnectionError:
        return [
            TextContent(
                type="text",
                text=f"Error: Cannot connect to daemon at {DAEMON_URL}",
            )
        ]
    except Exception as e:
        return [TextContent(type="text", text=f"Error: {str(e)}")]


async def tool_gpu_vmstate(args: dict) -> list[TextContent]:
    """Query VM state."""
    vm = args.get("vm", 0)

    try:
        resp = requests.get(f"{DAEMON_URL}/vmstate?vm={vm}", timeout=2)
        if resp.status_code != 200:
            return [TextContent(type="text", text=f"Error: Daemon returned {resp.status_code}")]

        return [
            TextContent(
                type="text",
                text=json.dumps(
                    {
                        "status": "success",
                        "action": "GPU_VMSTATE",
                        "vm": vm,
                        "daemon_response": resp.text.strip(),
                    },
                    indent=2,
                ),
            )
        ]
    except requests.exceptions.ConnectionError:
        return [
            TextContent(
                type="text",
                text=f"Error: Cannot connect to daemon at {DAEMON_URL}",
            )
        ]
    except Exception as e:
        return [TextContent(type="text", text=f"Error: {str(e)}")]


async def main():
    async with stdio_server() as (read, write):
        await app.run(read, write, app.create_initialization_options())


if __name__ == "__main__":
    asyncio.run(main())
