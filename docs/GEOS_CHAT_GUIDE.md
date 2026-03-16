# GEOS Chat - AI-Assisted GPU Substrate Control

> Natural language interface for controlling the Geometry OS GPU substrate through AI assistants.

## Overview

`geos chat` enables natural language control of the GPU substrate by bridging user prompts to AI models (Z.ai or Anthropic Claude) that can execute tool calls against the Ouroboros HAL daemon.

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                          GEOS CHAT ARCHITECTURE                              │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   User Prompt: "peek memory at 0x1000 and check daemon status"              │
│        │                                                                    │
│        ▼                                                                    │
│   ┌─────────────────┐                                                      │
│   │   geos chat     │  CLI interface (geos_cli.py)                         │
│   │   -i or "text"  │                                                      │
│   └────────┬────────┘                                                      │
│            │                                                                │
│            ▼                                                                │
│   ┌─────────────────┐                                                      │
│   │   Z.ai API      │  glm-4.6 model with tool calling                    │
│   │   (or Claude)   │  Processes natural language → tool calls            │
│   └────────┬────────┘                                                      │
│            │                                                                │
│            ▼                                                                │
│   ┌─────────────────┐                                                      │
│   │  MCP Tools      │  15 substrate operations                            │
│   │  (geos_mcp_     │  - daemon_status, mem_peek, mem_poke                │
│   │   server.py)    │  - substrate_load, boot_sim, etc.                   │
│   └────────┬────────┘                                                      │
│            │                                                                │
│            ▼                                                                │
│   ┌─────────────────┐      ┌─────────────────┐                            │
│   │  Unix Socket    │ or   │   HTTP API      │                            │
│   │  /tmp/gpu_      │      │   127.0.0.1:8769│                            │
│   │  daemon.sock    │      │                 │                            │
│   └────────┬────────┘      └────────┬────────┘                            │
│            │                        │                                      │
│            └────────────┬───────────┘                                      │
│                         ▼                                                  │
│   ┌─────────────────────────────────────────────────────────────────────┐ │
│   │                    gpu_dev_daemon (Ouroboros HAL)                    │ │
│   │                                                                      │ │
│   │   Endpoints:                                                         │ │
│   │   - GET /status      → {"status":"running","vms":N}                 │ │
│   │   - GET /peek        → Read words via scheduler                      │ │
│   │   - GET /poke        → Write value to address                        │ │
│   │   - POST /load       → Load binary/RTS to substrate                  │ │
│   │   - POST /chat       → Natural language → GPU commands               │ │
│   └─────────────────────────────────────────────────────────────────────┘ │
│                         │                                                  │
│                         ▼                                                  │
│   ┌─────────────────────────────────────────────────────────────────────┐ │
│   │                        GPU SUBSTRATE                                  │ │
│   │                     (4096 x 4096 texture)                            │ │
│   │                                                                       │ │
│   │   Memory Map:                                                         │ │
│   │   0x00000000 - 0x0FFFFFFF  Glyph VM memory                           │ │
│   │   0x10000000 - 0x1FFFFFFF  Dev memory (MCP indices)                  │ │
│   │   0xF0000000 - 0xF000FFFF  Chat history (persistent)                 │ │
│   │                                                                       │ │
│   │   Hilbert Curve Addressing: addr → (x, y) pixel coordinates          │ │
│   └─────────────────────────────────────────────────────────────────────┘ │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

## Quick Start

### Prerequisites

1. **GPU Daemon running:**
   ```bash
   cargo run --release --bin gpu_dev_daemon
   ```

2. **API credentials** (choose one):
   ```bash
   # Z.ai (recommended - included in implementation)
   export ZAI_API_KEY="your_key_here"
   export ZAI_BASE_URL="https://api.z.ai/api/coding/paas/v4"

   # Or Anthropic Claude
   export ANTHROPIC_API_KEY="your_key_here"
   ```

### Usage

**Single-shot mode:**
```bash
python3 apps/mcp2cli/src/geos_cli.py chat "check daemon status and peek at 0x0 for 4 words"
```

**Interactive REPL mode:**
```bash
python3 apps/mcp2cli/src/geos_cli.py chat -i

GEOS Chat> what's running on the GPU?
[AI queries daemon, interprets results]

GEOS Chat> load this program: programs/test.rts.png
[AI calls substrate_load tool]

GEOS Chat> exit
```

## Available Tools

The AI has access to 15 MCP tools for substrate control:

### System Operations
| Tool | Description | Parameters |
|------|-------------|------------|
| `daemon_status` | Check if Ouroboros HAL is running | none |
| `geos_status` | Component availability, boot readiness | none |
| `boot_sim` | Simulate boot chain (UEFI → Kernel → GPU) | none |

### Memory Operations
| Tool | Description | Parameters |
|------|-------------|------------|
| `mem_peek` | Read GPU memory at address | `addr`, `size` (words) |
| `mem_poke` | Write value to address | `addr`, `val` |
| `mem_store` | Store JSON data in GPU memory | `key`, `value` |
| `mem_retrieve` | Retrieve JSON from GPU memory | `key` |

### Compilation & Loading
| Tool | Description | Parameters |
|------|-------------|------------|
| `crystallize` | Compile .glyph → .rts.png | `input`, `output` |
| `substrate_load` | Load .rts.png to daemon | `rts_file` |
| `linux_to_glyph` | Transpile RISC-V ELF → glyph | `input`, `output` |

### Development Helpers
| Tool | Description | Parameters |
|------|-------------|------------|
| `glyph_patch` | Hot-patch instruction in VRAM | `addr`, `opcode` |
| `vm_spawn` | Simulate spawning child VM | `parent`, `child` |
| `hilbert_test` | Test Hilbert coordinate conversion | `addr` |
| `opcode_decode` | Decode opcode value | `opcode` |
| `opcode_encode` | Encode opcode name | `name` |
| `benchmark_sls` | Calculate Spatial Locality Score | `glyph_file` |
| `vlm_health` | Run VLM vitality check | `rts_file` |

## How Tool Calling Works

The AI uses a request-response loop with tool execution:

```
1. User: "peek memory at 0x1000"

2. AI decides: I should use mem_peek tool
   → Returns: tool_call("mem_peek", {"addr": "0x1000", "size": 4})

3. CLI executes tool:
   → Calls _daemon_request("/peek", params={"addr": "0x1000", "size": 4})
   → Unix socket → daemon → scheduler.peek_substrate_single()
   → Returns: {"hex": ["0x00000000", ...], "ascii": "...."}

4. Tool result sent back to AI

5. AI interprets: "Memory at 0x1000 contains all zeros"

6. Response shown to user
```

## Persistent Chat History

Chat history is stored in daemon memory (64KB max) and persists for the daemon's lifetime:

```
┌────────────────────────────────────────────────────────────┐
│                   Daemon Memory                             │
│              CHAT_HISTORY (OnceLock<Mutex<String>>)         │
├────────────────────────────────────────────────────────────┤
│                                                            │
│   Format: [ROLE] content\n                                 │
│                                                            │
│   [SYSTEM] PERSISTENT MEMORY TEST: Claude was here...      │
│   [USER] Hello from a future session!                      │
│   [ASSISTANT] I confirm: this memory persists...           │
│   [SYSTEM] Timestamp: 2026-03-15 21:58 UTC                 │
│                                                            │
│   Max size: 64KB (auto-truncates when full)                │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

### API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/chat_history` | GET | Read full history as JSON |
| `/chat_history` | POST | Append message (JSON body: `{role, content}`) |

### Example Usage

```bash
# Write a message
curl --unix-socket /tmp/gpu_daemon.sock \
    -X POST \
    -H "Content-Type: application/json" \
    -d '{"role":"system","content":"Test message"}' \
    http://daemon/chat_history

# Read history
curl --unix-socket /tmp/gpu_daemon.sock \
    http://daemon/chat_history
```

### Benefits

- **Session continuity**: Resume conversations across CLI restarts
- **AI memory**: Future AI sessions can read past context
- **Cross-AI collaboration**: Different AI models share same memory
- **Simple format**: Human-readable text with role prefixes

## Daemon Communication

The MCP server uses a unified request function that tries Unix socket first, then HTTP:

```python
def _daemon_request(endpoint, params=None, timeout=2.0):
    # Try Unix socket (faster, more reliable)
    try:
        return _daemon_request_unix(endpoint, params, timeout)
    except (ConnectionError, FileNotFoundError):
        pass

    # Fall back to HTTP
    url = f"{DAEMON_URL}{endpoint}"
    return requests.get(url, timeout=timeout).text
```

### Unix Socket Protocol

The daemon implements a minimal HTTP-like protocol:

```
Request:
GET /peek?addr=0x0&size=4 HTTP/1.1
Host: daemon
Connection: close

Response:
HTTP/1.1 200 OK
Content-Type: text/plain

0x00000000 0x00000000 0x00000000 0x00000000
```

**Important:** The `Connection: close` header is required - without it, the daemon keeps the connection open until timeout.

## Daemon Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/status` | GET | Health check: `{"status":"running","vms":N}` |
| `/peek?addr=X&size=N` | GET | Read N words at address X |
| `/poke?addr=X&value=Y` | GET | Write value Y to address X |
| `/read?addr=X&len=N` | GET | Read N bytes (async GPU op) |
| `/substrate?x=Y&w=W&h=H` | GET | Return texture region as PNG |
| `/load?binary=0xADDR` | POST | Load binary data to address |
| `/chat` | POST | Natural language → GPU commands |

## Example Session

```bash
$ python3 apps/mcp2cli/src/geos_cli.py chat -i

GEOS Chat> what's the current state of the GPU?

AI: Let me check the daemon status and examine some key memory regions.
[Tool daemon_status: ONLINE, running, 2 VMs]
[Tool mem_peek: addr=0x0, 4 words, all zeros]

The GPU daemon is running with 2 active virtual machines.
Memory at address 0x0 is currently cleared (all zeros).

GEOS Chat> load the counter demo and run it

AI: I'll load the counter demo program.
[Tool substrate_load: programs/counter.rts.png → loaded]

Program loaded. The counter will increment at address 0x100.

GEOS Chat> show me the counter value

AI: Reading the counter memory location...
[Tool mem_peek: addr=0x100, 1 word]

Counter value: 42 (0x2a)

GEOS Chat> exit
```

## Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `ZAI_API_KEY` | (required) | Z.ai API key |
| `ZAI_BASE_URL` | `https://api.z.ai/api/coding/paas/v4` | Z.ai API endpoint |
| `ANTHROPIC_API_KEY` | (optional) | Anthropic API key (fallback) |
| `DAEMON_URL` | `http://127.0.0.1:8769` | HTTP daemon URL |
| `DAEMON_SOCKET_PATH` | `/tmp/gpu_daemon.sock` | Unix socket path |

## Troubleshooting

### "daemon OFFLINE" error

```bash
# Check if daemon is running
ls -la /tmp/gpu_daemon.sock

# Start daemon if needed
cargo run --release --bin gpu_dev_daemon
```

### "Unknown Model" error

Ensure you're using the correct model name:
- Z.ai: `glm-4.6` (auto-detected)
- Anthropic: `claude-sonnet-4-20250514`

### Tool call timeout

The Unix socket needs `Connection: close` header. This is handled in `_daemon_request_unix()` at line 913 of `geos_mcp_server.py`.

## Architecture Files

| File | Purpose |
|------|---------|
| `apps/mcp2cli/src/geos_cli.py` | CLI implementation with `cmd_chat()` |
| `apps/mcp2cli/src/geos_mcp_server.py` | MCP tools and daemon communication |
| `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs` | Ouroboros HAL daemon |
| `docs/MCP2CLI_GUIDE.md` | MCP tools documentation |

## WASM Execution Tools

The MCP server includes tools for loading and executing WASM binaries on the GPU substrate:

### wasm_load

Load a WASM binary to GPU substrate at the WASM linear memory base:

```
GEOS Chat> load and run counter.wasm

AI: I'll load the WASM binary and trigger execution.
[Tool wasm_load: wasm_file=counter.wasm → loaded 667 bytes to 0x20000]
```

### wasm_run

Start WASM interpreter execution:

```
[Tool wasm_run: entry_point=0x0 → interpreter started]
```

### wasm_status

Check interpreter state:

```
GEOS Chat> check WASM interpreter status

AI: [Tool wasm_status]
{
  "ip": "0x42",
  "sp": "0x2fff8",
  "status": "HALTED",
  "linear_memory": "0x20000"
}
```

### Example: Running WASM with Host Functions

```
GEOS Chat> load test.wasm and run it, then check memory at 0x1000

AI: Let me do this step by step.
[Tool wasm_load: test.wasm → loaded]
[Tool wasm_run: entry_point=0x0 → running]
[Tool mem_peek: addr=0x1000, size=4 → value=0x2a (42)]

The WASM program executed successfully and wrote 42 to address 0x1000!
```

## Future Enhancements

- [ ] Voice input via microphone
- [ ] Multi-turn conversation context
- [ ] AI can spawn background tasks
- [ ] Cross-session memory indexing
- [ ] Support for more AI providers (Gemini, local LLMs)

---

*"Speak naturally, compute on GPU."*
