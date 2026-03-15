# Geometry OS MCP Memory Bridge

GPU-backed development memory for persistent context storage across AI sessions.

## Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                    GPU SUBSTRATE (4096×4096)                     │
│                      16,777,216 addresses                        │
├───────────────────┬───────────────────┬─────────────────────────┤
│ 0x000000-0x0FFFFF │ 0x100000-0x1FFFFF │ 0x200000-0xFFFFFF       │
│ SYSTEM RESERVED   │ DEV MEMORY (4MB)  │ GLYPH PROGRAMS          │
│ VM state, regs    │ AI Context Store  │ Runtime code            │
│ PC, UART, etc.    │ Key-value pairs   │ Compiled glyphs         │
└───────────────────┴───────────────────┴─────────────────────────┘
```

## Memory Map

### System Region (0x000000 - 0x0FFFFF)

| Address | Size | Purpose |
|---------|------|---------|
| 0x000000 | 1KB | Boot vector |
| 0x000200 | 256B | UART buffer |
| 0x001400 | 64B | VM 0 state |
| 0x014000 | 64B | Guest PC |
| 0x014100 | 256B | Guest registers |

### Development Memory (0x100000 - 0x1FFFFF)

| Offset | Purpose |
|--------|---------|
| 0x0000-0x0FFF | Index (key → address mapping) |
| 0x1000-0xFFFFF | Data storage |

## MCP Tools

### mem_store
Store structured data in GPU memory.

```python
await tool_mem_store({
    'key': 'session_context',
    'value': {
        'goal': 'Native Windowing System',
        'phase': 43,
        'status': 'in_progress'
    }
})
```

Returns:
```json
{
  "status": "success",
  "action": "GPU_MEM_STORE",
  "key": "session_context",
  "addr": "0x00101000",
  "size_bytes": 98
}
```

### mem_retrieve
Retrieve stored data by key.

```python
await tool_mem_retrieve({'key': 'session_context'})
```

Returns:
```json
{
  "status": "success",
  "action": "GPU_MEM_RETRIEVE",
  "key": "session_context",
  "data": {"key": "session_context", "val": {...}, "ts": 1710523200.0}
}
```

### mem_peek
Read raw GPU memory at Hilbert address.

```python
await tool_mem_peek({'addr': '0x101000', 'size': 16})
```

Returns:
```json
{
  "status": "success",
  "addr": "0x00101000",
  "hilbert_coords": {"x": 1024, "y": 64},
  "hex": ["deadbeef", ...],
  "ascii": "...."
}
```

### mem_poke
Write single 32-bit value to GPU memory.

```python
await tool_mem_poke({'addr': '0x101000', 'val': '0xDEADBEEF'})
```

## Daemon Endpoints

The Ouroboros daemon (`gpu_dev_daemon`) exposes these HTTP endpoints:

| Endpoint | Method | Purpose |
|----------|--------|---------|
| `/status` | GET | Daemon health check |
| `/poke?addr=X&val=Y` | GET | Write 32-bit value |
| `/peek?addr=X&size=N` | GET | Read N words |
| `/write?addr=X` | POST | Bulk hex write |
| `/load` | POST | Load substrate image |
| `/pause` | GET | Pause all VMs |
| `/vmstate?vm=N` | GET | Query VM state |

## Usage

### Start the Daemon

```bash
cargo run --release --bin gpu_dev_daemon
```

### Verify Connection

```bash
curl http://127.0.0.1:8769/status
```

### Store Context

```python
from geos import store_context, retrieve_context

# Store session context
store_context("current_task", {
    "goal": "Native Windowing System",
    "phase": 43,
    "file": "kernel/geos/main.c"
})

# Retrieve later (even after context reset)
task = retrieve_context("current_task")
print(task['val']['goal'])
```

## Data Format

Data is encoded as JSON and stored as 32-bit little-endian words:

```
JSON: {"key":"test","val":"hello"}
HEX:  7b226b65 79223a22 74657374 222c2276 616c223a ...
```

## Persistence

- Memory persists in GPU VRAM while daemon runs
- Survives AI context window resets
- Lost when daemon terminates (VRAM freed)
- For long-term persistence, export to file

## Hilbert Curve Addressing

All addresses use Hilbert curve mapping for GPU cache efficiency:

```python
from geos import hilbert_d2xy, hilbert_xy2d

# Convert address to 2D coordinates
x, y = hilbert_d2xy(4096, 0x101000)  # → (1024, 64)

# Convert back
addr = hilbert_xy2d(4096, 1024, 64)  # → 0x101000
```

## Transports

The daemon supports two transports:

1. **TCP**: `http://127.0.0.1:8769`
2. **Unix Socket**: `/tmp/gpu_daemon.sock`

Unix socket is preferred for lower latency.

---

*Last updated: 2026-03-15*
*Phase: 43 - Ouroboros Daemon*
