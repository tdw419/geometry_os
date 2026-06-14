# GPU Dev Daemon MCP API Design

**Date:** 2026-03-15
**Status:** ✅ Implemented

## Problem

AI assistants (Claude Code, Gemini, Kilocode) need direct access to gpu_dev_daemon operations without manually crafting HTTP requests.

## Solution

Add MCP tools to `geos_mcp_server.py` that wrap the gpu_dev_daemon HTTP API. This leverages existing infrastructure:
- Claude Code: calls MCP tools directly
- Other AIs: use `geos` CLI wrapper via bash

## Implemented Tools

| MCP Tool | CLI Command | HTTP Endpoint | Purpose |
|----------|-------------|---------------|---------|
| `mem_peek` | `peek` | GET /peek | Read GPU memory |
| `mem_poke` | `poke` | GET /poke | Write single value |
| `gpu_write` | `gpu-write` | POST /write | Batch write values |
| `substrate_load` | `substrate-load` | POST /load | Load substrate image |
| `gpu_exec` | `gpu-exec` | POST /exec | Run shell command |
| `gpu_pause` | `gpu-pause` | GET /pause | Pause all VMs |
| `gpu_vmstate` | `gpu-vmstate` | GET /vmstate | Query VM state |
| `daemon_status` | `daemon-status` | GET / | Check daemon status |

## Usage

### Claude Code (MCP)
```
Use tool: mem_peek(addr="0x100000", size=16)
Use tool: gpu_exec(cmd="ls -la", cwd="/tmp")
```

### Other AIs (CLI)
```bash
python3 geos_cli.py peek 0x100000 --size 16
python3 geos_cli.py gpu-exec "ls -la" --cwd /tmp
python3 geos_cli.py daemon-status
```

## Files Modified

- `apps/mcp2cli/src/geos_mcp_server.py` - Added 4 new tools + handlers
- `apps/mcp2cli/src/geos_cli.py` - Added 8 new CLI commands
