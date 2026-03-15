# MCP2CLI: AI-to-Geometry OS Bridge

## Overview

MCP2CLI is a bridge system that allows AI assistants (Claude, Gemini, etc.) to interact with Geometry OS through the **Model Context Protocol (MCP)**. It exposes GPU substrate operations as tools that AI agents can call during conversations.

```
┌─────────────────┐     MCP Protocol      ┌─────────────────┐     HTTP/API      ┌─────────────────┐
│   AI Assistant  │ ◄──────────────────► │  GEOS MCP Server │ ◄───────────────► │  Ouroboros HAL  │
│  (Claude/Gemini)│                       │  (geos_mcp_server)│                  │  (Port 8769)    │
└─────────────────┘                       └─────────────────┘                    └─────────────────┘
                                                  │
                                                  │ subprocess
                                                  ▼
                                          ┌─────────────────┐
                                          │  Glyph Compiler │
                                          │  VLM Health CLI │
                                          │  Transpilers    │
                                          └─────────────────┘
```

## Architecture

### Components

| Component | Location | Purpose |
|-----------|----------|---------|
| `geos_mcp_server.py` | `apps/mcp2cli/src/` | MCP server exposing Geometry OS tools |
| `geos_cli.py` | `apps/mcp2cli/src/` | Command-line interface for direct access |
| `mcp2cli` | `apps/mcp2cli/` | Generic MCP client (for connecting to any MCP server) |
| `gpu_dev_daemon` | `systems/infinite_map_rs/src/bin/` | Ouroboros HAL - GPU substrate HTTP API |

### Protocol Flow

1. **AI Assistant** connects to MCP server via stdio or HTTP
2. **MCP Server** receives tool calls in JSON-RPC format
3. **Tool Handler** executes the operation (compile, peek memory, etc.)
4. **Response** returns results to the AI as structured text

## Available MCP Tools

### Compilation & Transpilation

#### `crystallize`
Compile a `.glyph` assembly file to `.rts.png` GPU texture.

```json
{
  "input": "systems/glyph_stratum/programs/hello.glyph",
  "output": "kernel/firmware/hello.rts.png",
  "dense": false
}
```

**What it does:**
1. Parses `.glyph` assembly into RGBA instructions
2. Maps instructions to Hilbert curve coordinates
3. Outputs a 4096x4096 PNG texture

#### `linux_to_glyph`
Transpile a RISC-V ELF binary to glyph texture.

```json
{
  "binary": "path/to/vmlinux.riscv",
  "output": "systems/ubuntu_riscv/ubuntu_native.rts.png",
  "dense": true
}
```

**What it does:**
1. Reads ELF sections (text, data, rodata)
2. Converts RISC-V instructions to glyph opcodes
3. Maps to Hilbert space

### Analysis & Benchmarking

#### `benchmark_sls`
Calculate **Spatial Locality Score** - measures GPU cache efficiency.

```json
{
  "glyph_file": "systems/glyph_stratum/programs/window_manager.glyph",
  "grid_size": 4096
}
```

**Returns:**
- SLS score (target: 0.90+)
- Instruction count
- Stratum distribution
- Optimization recommendations

#### `vlm_health`
Run **Visual Locality Memory** health check on a substrate texture.

```json
{
  "rts_file": "alpine.rts.png"
}
```

**Returns:**
- Vitality score (0.0-1.0)
- Entropy statistics
- Dimensions and channel info

#### `opcode_decode` / `opcode_encode`
Convert between opcode values and human-readable names.

```json
// Decode
{"opcode": 220, "stratum": 2}

// Encode
{"name": "AND", "stratum": "BITWISE"}
```

### Memory Operations

#### `mem_peek` / `mem_poke`
Read and write raw GPU memory at Hilbert addresses.

```json
// Peek (read)
{"addr": "0x00001000", "size": 16}

// Poke (write)
{"addr": "0x00001000", "val": "0xDEADBEEF"}
```

**Address Regions:**
| Range | Purpose |
|-------|---------|
| `0x0000-0x00FF` | Emulator State (PC, IR) |
| `0x0100-0x013F` | Guest Registers (x0-x31) |
| `0x0200-0x02FF` | I/O Bridge (UART, Events) |
| `0x1000-0x10FF` | MMIO (Device Registers) |
| `0x8000-0xFFFF` | Guest RAM |

#### `mem_store` / `mem_retrieve`
GPU-backed key-value storage for development context.

```json
// Store
{"key": "current_phase", "value": {"phase": 72, "status": "active"}}

// Retrieve
{"key": "current_phase"}
```

### System Operations

#### `daemon_status`
Check if the Ouroboros HAL daemon is running.

```json
{}
```

**Returns:**
- Connection status
- Daemon URL (127.0.0.1:8769)
- VM state if available

#### `substrate_load`
Load a `.rts.png` file into the running GPU substrate.

```json
{
  "rts_file": "kernel/firmware/alpine.rts.png"
}
```

**What it does:**
1. Connects to Ouroboros daemon on port 8769
2. POSTs the texture to `/load` endpoint
3. Triggers VM reset and spawn

#### `gpu_write`
Batch write multiple 32-bit values to GPU memory.

```json
{
  "addr": "0x80000000",
  "data": [3735928559, 3405691582]
}
```

**What it does:**
1. Converts a list of integers to a hex string
2. Sends a POST request to the daemon's `/write` endpoint
3. Allows high-speed bulk memory initialization

#### `gpu_exec`
Execute a shell command within the Geometry OS environment (via daemon).

```json
{
  "cmd": "ls -la /home/jericho",
  "cwd": "/home/jericho",
  "timeout": 30
}
```

**What it does:**
1. Forwards the command to the Ouroboros HAL
2. Captures stdout/stderr from the remote execution environment
3. Returns the output as a structured response

#### `gpu_pause`
Pause all running VMs in the substrate.

```json
{}
```

**What it does:**
1. Sends a GET request to `/pause`
2. Freezes execution for debugging or state inspection

#### `gpu_vmstate`
Query the internal state of a specific VM.

```json
{
  "vm": 0
}
```

**What it does:**
1. Retrieves registers, PC, and status flags for the requested VM ID
2. Returns the raw state from the Ouroboros HAL

#### `boot_sim`
Simulate the boot chain without hardware.

```json
{
  "verbose": true
}
```

**Validates:**
- UEFI bootloader presence
- Kernel source
- Window Manager glyph
- Boot script

#### `geos_status`
Get overall system status.

```json
{}
```

**Returns:**
- Component presence check
- Boot chain readiness
- Available MCP tools

#### `gpu_exec`
Execute a shell command on the host via the Ouroboros daemon. This enables remote building, testing, and self-modification of the OS.

```json
{
  "cmd": "cargo build --release --bin gpu_dev_daemon",
  "cwd": "/home/jericho/zion/projects/geometry_os/systems/infinite_map_rs",
  "timeout": 60
}
```

**Parameters:**
- `cmd`: The shell command to execute.
- `cwd`: (Optional) Working directory for the command.
- `timeout`: (Optional) Max execution time in seconds (default: 30).

**Security Note:** This tool provides raw shell access to the host. It is intended for autonomous development and self-hosting of Geometry OS components.

### Development Helpers

#### `glyph_patch`
Hot-patch a single instruction in VRAM.

```json
{
  "address": "0x0100",
  "opcode": 220,
  "stratum": 2,
  "p1": 15,
  "p2": 0,
  "vm_id": 0
}
```

#### `vm_spawn`
Simulate spawning a child glyph VM.

```json
{
  "vm_id": 1,
  "glyph_file": "systems/glyph_stratum/programs/counter.glyph",
  "window_x": 100,
  "window_y": 100,
  "window_w": 400,
  "window_h": 300
}
```

#### `hilbert_test`
Test Hilbert curve coordinate conversion.

```json
// Index to coordinates
{"mode": "d2xy", "index": 12345, "grid_size": 4096}

// Coordinates to index
{"mode": "xy2d", "x": 100, "y": 200, "grid_size": 4096}
```


### Multi-Agent Coordination

These tools allow multiple AI agents to collaborate on the same GPU substrate safely.

#### `agent_register`
Register a new agent session.

```json
{
  "agent_type": "researcher",
  "capabilities": ["read", "write"]
}
```

#### `agent_alloc`
Allocate a private VRAM region for an agent.

```json
{
  "agent_id": "researcher_a1b2c3d4",
  "size": 1048576,
  "purpose": "work_buffer"
}
```

#### `agent_lock` / `agent_unlock`
Acquire or release a named resource lock to prevent conflicts.

```json
// Lock
{"agent_id": "agent_1", "resource": "glyph_compiler_v8"}

// Unlock
{"agent_id": "agent_1", "resource": "glyph_compiler_v8"}
```

#### `agent_event`
Send events (broadcast or targeted) to other agents.

```json
{
  "source_agent": "agent_1",
  "event_type": "build_ready",
  "payload": {"path": "kernel.rts.png"}
}
```

#### `agent_status` / `agent_list`
Monitor the multi-agent ecosystem.

## Multi-Agent Coordination

The MCP2CLI bridge supports **multiple AI agents** collaborating on the Geometry OS substrate simultaneously.

### Architecture

```
┌─────────────┐  ┌─────────────┐  ┌─────────────┐
│   Claude    │  │   Gemini    │  │   Other AI  │
└──────┬──────┘  └──────┬──────┘  └──────┬──────┘
       │                │                │
       ▼                ▼                ▼
┌─────────────────────────────────────────────────────┐
│           Multi-Agent Manager                         │
│  - Agent Registry (ID, capabilities, session)       │
│  - Memory Region Allocation (per-agent VRAM)        │
│  - Lock Manager (conflict prevention)               │
│  - Event Bus (inter-agent communication)            │
└─────────────────────────────────────────────────────┘
       │
       ▼
┌─────────────────────────────────────────────────────┐
│           Ouroboros HAL (Port 8769)                  │
│           GPU Substrate (VRAM)                       │
└─────────────────────────────────────────────────────┘
```

### Multi-Agent Tools

| Tool | Description |
|------|-------------|
| `agent_register` | Register a new AI agent session |
| `agent_unregister` | Remove agent and release resources |
| `agent_list` | List all active agents |
| `agent_status` | Get multi-agent system status |
| `agent_alloc` | Allocate private VRAM region |
| `agent_regions` | List agent's memory regions |
| `agent_free` | Release a memory region |
| `agent_lock/unlock` | Acquire/release resource locks |
| `agent_event` | Send events to other agents |

### Memory Layout for Multi-Agent

| Region | Address Range | Purpose |
|--------|---------------|---------|
| Kernel | `0x000000 - 0x1FFFFF` | Public (all agents can read) |
| Agent 1 | `0x200000 - 0x2FFFFF` | Agent-private allocation |
| Agent 2 | `0x300000 - 0x3FFFFF` | Agent-private allocation |
| ... | ... | ... |
| Agent 16 | `0x1100000+` | Max 16 concurrent agents |

### Standard Events

| Event | Description |
|-------|-------------|
| `geos:build_ready` | New .rts.png artifact available |
| `geos:vm_spawned` | Child glyph VM started |
| `geos:memory_low` | Approaching VRAM limits |
| `geos:lock_conflict` | Agent waiting for resource |
| `geos:vlm_vitality` | VLM health check results |

### Dashboard

Monitor all agents in real-time:

```bash
python3 apps/mcp2cli/src/agent_dashboard.py
```

Controls: `[o]verview [a]gents [m]emory [e]vents [r]efresh [q]uit`

### Example Session

```python
# Register Claude agent
agent_register({"agent_type": "claude", "capabilities": ["full_access"]})
# → {"agent_id": "claude_4c5ffb40", ...}

# Allocate memory
agent_alloc({"agent_id": "claude_4c5ffb40", "size": 65536, "purpose": "kernel_dev"})
# → {"start_addr": "0x00300000", "end_addr": "0x00310000"}

# Acquire lock
agent_lock({"agent_id": "claude_4c5ffb40", "resource": "vm:0"})
# → {"acquired": true}

# Notify other agents
agent_event({"source_agent": "claude_4c5ffb40", "event_type": "geos:build_ready",
             "payload": {"artifact": "kernel.rts.png"}})
```

## Usage

### As MCP Server (for AI Assistants)

```bash
# Start the MCP server
python3 apps/mcp2cli/src/geos_mcp_server.py

# Or via mcp2cli client
mcp2cli "python3 apps/mcp2cli/src/geos_mcp_server.py" geos
```

### As CLI (for direct access)

```bash
# Compile glyph
python3 apps/mcp2cli/src/geos_cli.py crystallize input.glyph output.rts.png

# Benchmark
python3 apps/mcp2cli/src/geos_cli.py benchmark input.glyph

# Check status
python3 apps/mcp2cli/src/geos_cli.py status

# Hilbert conversion
python3 apps/mcp2cli/src/geos_cli.py hilbert d2xy --index 12345
python3 apps/mcp2cli/src/geos_cli.py hilbert xy2d --x 100 --y 200

# Firmware operations
python3 apps/mcp2cli/src/geos_cli.py firmware crystallize -f firmware.bin -o output.rts.png -n "amdgpu"
```

### With Ouroboros Daemon

```bash
# Start the GPU daemon first
cargo run --release --bin gpu_dev_daemon

# Then MCP tools can interact with it
# daemon_status, substrate_load, mem_peek, mem_poke all require running daemon
```

## Tool Implementation Guide

To add a new MCP tool:

### 1. Define the Tool Schema

In `@app.list_tools()`:

```python
Tool(
    name="my_new_tool",
    description="What this tool does",
    inputSchema={
        "type": "object",
        "properties": {
            "param1": {"type": "string", "description": "First parameter"},
            "param2": {"type": "integer", "description": "Second parameter"},
        },
        "required": ["param1"],
    },
),
```

### 2. Add Routing

In `@app.call_tool()`:

```python
elif name == "my_new_tool":
    return await tool_my_new_tool(arguments)
```

### 3. Implement the Handler

```python
async def tool_my_new_tool(args: dict) -> list[TextContent]:
    """Tool implementation."""
    param1 = args["param1"]
    param2 = args.get("param2", 0)

    # Do work...

    return [TextContent(
        type="text",
        text=json.dumps({
            "status": "success",
            "result": result
        }, indent=2)
    )]
```

## Ouroboros HAL API Reference

### Transports

The GPU daemon accepts connections via two transports:

| Transport | Address | Use Case |
|-----------|---------|----------|
| **TCP** | `127.0.0.1:8769` | Remote access, HTTP clients, curl |
| **Unix Socket** | `/tmp/gpu_daemon.sock` | Local IPC, lower latency, no TCP overhead |

```bash
# TCP example
curl http://127.0.0.1:8769/peek?addr=0x0000&size=4

# Unix socket example (requires nc with -U or socat)
nc -U /tmp/gpu_daemon.sock <<EOF
GET /peek?addr=0x0000&size=4 HTTP/1.0

EOF
```

### Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/peek?addr=0x...&size=N` | GET | Read N words from Hilbert address |
| `/poke?addr=0x...&val=0x...` | GET | Write single value to address |
| `/write?addr=0x...` | POST | Bulk write hex data |
| `/exec?timeout=N&cwd=/path` | POST | **(Remote Exec)** Run shell command with timeout/cwd |
| `/load` | POST | Load .rts.png texture (full reset) |
| `/pause` | GET | Halt all VMs |
| `/vmstate?vm=N` | GET | Query VM state |

### `/exec` Response Format

```
[exit:CODE][STATUS]
stdout...
stderr...
```

| Field | Values |
|-------|--------|
| `CODE` | Process exit code (0-255), or -1 on error |
| `STATUS` | `OK` for normal exit, `TIMEOUT` if killed by timeout (exit 124) |

### The Self-Hosting Loop

The combination of `gpu_exec` and the Ouroboros daemon creates a closed-loop system for Geometry OS evolution:

1. **AI Logic**: Analyze substrate health or performance via `benchmark_sls` or `vlm_health`.
2. **AI Action**: Update source code (Rust/Python/Glyph) using `gpu_exec` (e.g., `sed` or `echo`).
3. **AI Build**: Trigger rebuild via `gpu_exec` (e.g., `cargo build`).
4. **AI Deploy**: Restart the daemon or reload the substrate via `substrate_load`.

This allows the OS to evolve its own drivers, compilers, and shaders without human intervention.

**Example: Self-Updating Daemon**
```bash
# Compile latest daemon
curl -X POST "http://127.0.0.1:8769/exec?timeout=300" -d "cargo build --release --bin gpu_dev_daemon"

# Restart into new version
curl -X POST "http://127.0.0.1:8769/exec" -d "pkill gpu_dev_daemon && ./target/release/gpu_dev_daemon &"
```

**Example:**

```bash
# Read 4 words from address 0
curl "http://127.0.0.1:8769/peek?addr=0x00000000&size=4"

# Write value
curl "http://127.0.0.1:8769/poke?addr=0x00000100&val=0x000000DC"

# Bulk write data
curl -X POST -d "DEADBEEFCAFEBABE" "http://127.0.0.1:8769/write?addr=0x80000000"

# Execute command
curl -X POST -d "ls -la" "http://127.0.0.1:8769/exec?cwd=/tmp"

# Load substrate
curl -X POST -d "/path/to/alpine.rts.png" http://127.0.0.1:8769/load
```

### Visual Consistency Contract (VCC)

The VCC ensures the visual state of Geometry OS matches the intended architectural state. This is critical for:

- **Debugging**: Detecting when GPU memory has diverged from expected values
- **Testing**: Verifying that glyph programs produce correct visual output
- **Evolution**: Ensuring self-modifications don't corrupt the visual substrate

**Planned MCP Tool: `vcc_validate`**

```json
{
  "region": "0x0000-0x1000",
  "expected_hash": "sha256:abc123...",
  "description": "Boot sector integrity"
}
```

**VCC Principles:**

1. **State as Text**: All GPU state is human-readable and hashable
2. **Transition as Edit**: State changes are atomic, auditable edits
3. **Dual-Audience**: Comprehensible to humans AND parseable by AI

## Integration with AI Workflows

### Claude Code

Add to Claude's MCP configuration:

```json
{
  "mcpServers": {
    "geometry-os": {
      "command": "python3",
      "args": ["/path/to/geometry_os/apps/mcp2cli/src/geos_mcp_server.py"]
    }
  }
}
```

### Gemini

Use with the mcp2cli client or integrate directly.

### Example AI Session

```
AI: I'll compile your glyph program and check its spatial locality.

→ calls crystallize({"input": "driver.glyph", "output": "driver.rts.png"})
→ calls benchmark_sls({"glyph_file": "driver.glyph"})

AI: Your program compiled successfully with SLS 0.94 - excellent cache efficiency!
    The BITWISE stratum is 60% of instructions, suggesting heavy protocol decoding.
```

## Troubleshooting

### "Cannot connect to Ouroboros daemon"

```bash
# Start the daemon
cargo run --release --bin gpu_dev_daemon

# Verify it's running
curl http://127.0.0.1:8769/peek?addr=0x00000000&size=1
```

### "Glyph compiler not found"

```bash
# Verify compiler exists
ls systems/glyph_stratum/programs/compile_glyph.py

# Check PYTHONPATH
export PYTHONPATH="${PYTHONPATH}:$(pwd)/systems/glyph_stratum/programs"
```

### "VLM health check fails"

The `vlm_health_cli.py` requires PIL/numpy:

```bash
pip install pillow numpy
```

## Related Documentation

- **Glyph Programming Guide:** `docs/GLYPH_PROGRAMMING_GUIDE.md`
- **Glyph Philosophy:** `docs/GLYPH_STRATUM_PHILOSOPHY.md`
- **GPU Dev Daemon:** `memory/gpu-dev-daemon.md`
- **Bare Metal Boot:** `memory/bare-metal.md`
