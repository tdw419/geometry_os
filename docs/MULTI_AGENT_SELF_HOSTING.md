# Multi-Agent Self-Hosting Architecture

## Overview

This document describes how the **Multi-Agent Coordination System** enables the **Self-Hosting Loop** described in `docs/SELF_HOSTING.md`.

## Architecture

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                        SELF-HOSTING LOOP                                        │
│                                                                                 │
│   1. ANALYZE      2. PLAN          3. EXECUTE       4. DEPLOY      5. VERIFY    │
│   ┌─────────┐    ┌─────────┐      ┌─────────┐       ┌─────────┐    ┌─────────┐  │
│   │vcc_     │    │ Source   │      │ gpu_    │       │substrate│    │ vcc_     │  │
│   │validate │    │ Edit     │      │ exec    │       │ _load   │    │ validate │  │
│   └────┬────┘    └────┬────┘      └────┬────┘       └────┬────┘    └────┬────┘  │
│        │              │                │                  │               │        │
│        └──────────────┴────────────────┴──────────────────┴───────────────┘        │
│                                   │                                              │
└───────────────────────────────────┼──────────────────────────────────────────────┘
                                    │
                                    ▼
┌───────────────────────────────────────────────────────────────────────────────────┐
│                      MULTI-AGENT COORDINATION LAYER                               │
│                                                                                   │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐                    │
│  │  Agent Manager  │  │   VCC Manager   │  │  Event Bus      │                    │
│  │  • Registration │  │  • Sign/Verify  │  │  • Broadcast    │                    │
│  │  • Memory Alloc │  │  • Audit Trail  │  │  • Targeted     │                    │
│  │  • Locks        │  │  • Guardrails   │  │  • Subscribe    │                    │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘                    │
│                                                                                   │
│  Files: geos_agent_manager.py, geos_vcc.py                                        │
└───────────────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌───────────────────────────────────────────────────────────────────────────────────┐
│                      OUROBOROS HAL DAEMON (Port 8769)                             │
│                                                                                   │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐                    │
│  │  GPU Substrate  │  │  VM Scheduler   │  │  Memory I/O     │                    │
│  │  4096×4096 RGBA │  │  8 VM slots     │  │  /peek /poke    │                    │
│  │  Hilbert-mapped │  │  Glyph VMs      │  │  /load /exec    │                    │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘                    │
│                                                                                   │
│  File: systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs                          │
└───────────────────────────────────────────────────────────────────────────────────┘
```

## MCP Tool Integration

### Self-Hosting Tools

| Tool | Stage | Description |
|------|-------|-------------|
| `self_host_loop` | All | Execute one step of the loop |
| `vcc_validate` | ANALYZE, VERIFY | Check region hash matches expected |
| `vcc_sign` | VERIFY | Sign a new VCC entry after successful deploy |
| `vcc_status` | ANALYZE | Get VCC system health |
| `vcc_audit` | ANALYZE | Get modification history for a region |
| `vcc_guard` | CONFIG | Enable/disable protection |
| `vcc_list` | ANALYZE | List all protected regions |

### Multi-Agent Coordination Tools

| Tool | Purpose |
|------|---------|
| `agent_register` | Register AI session |
| `agent_alloc` | Reserve VRAM workspace |
| `agent_lock/unlock` | Coordinate resource access |
| `agent_event` | Notify other agents of state changes |

## Standard Event Types

The multi-agent system uses standardized events to keep all agents synchronized:

| Event | Emitted When | Payload |
|-------|--------------|---------|
| `geos:build_ready` | Compilation succeeds | `{"artifact": "kernel.rts.png", "size": 65536}` |
| `geos:build_failed` | Compilation fails | `{"error": "...", "exit_code": 1}` |
| `geos:vm_spawned` | New VM started | `{"vm_id": 2, "entry_point": "0x18000"}` |
| `geos:deploy_complete` | Substrate loaded | `{"rts_file": "alpine.rts.png"}` |
| `geos:vcc_verified` | VCC validation passes | `{"region": "0x0000-0x1000"}` |
| `geos:vcc_violation` | VCC validation fails | `{"region": "...", "expected": "...", "actual": "..."}` |
| `geos:lock_conflict` | Lock denied | `{"resource": "vm:0", "holder": "claude_xxx"}` |
| `geos:vlm_vitality` | VLM health result | `{"score": 0.85, "status": "degraded"}` |

## Memory Layout

### Hilbert-Addressed VRAM (4096×4096)

| Region | Hilbert Range | Type | Access |
|--------|---------------|------|--------|
| Boot Sector | `0x0000-0x00FF` | SYSTEM | READ_ONLY (all) |
| Emulator State | `0x0100-0x013F` | SYSTEM | READ_ONLY (all) |
| I/O Bridge | `0x0200-0x02FF` | SYSTEM | READ_WRITE (all) |
| MMIO | `0x1000-0x10FF` | SYSTEM | READ_WRITE (all) |
| Guest RAM | `0x8000-0xFFFF` | SYSTEM | READ_WRITE (all) |
| Agent Pool | `0x00200000+` | AGENT | OWNER_ONLY |

### Agent Memory Allocation

Each agent can request private VRAM regions:

```python
# Agent requests workspace
agent_alloc({
    "agent_id": "claude_abc123",
    "size": 65536,  # 64KB
    "purpose": "kernel_development"
})

# Returns:
{
    "start_addr": "0x00300000",
    "end_addr": "0x00310000",
    "owner_id": "claude_abc123"
}
```

## Self-Hosting Workflow Example

### Scenario: Patching the UART Driver

```
┌─────────────────────────────────────────────────────────────────────────┐
│ AGENT: claude_kernel_hacker                                             │
└─────────────────────────────────────────────────────────────────────────┘

# Step 1: Register
agent_register({"agent_type": "claude", "capabilities": ["full_access"]})
# → {"agent_id": "claude_7a3b2c1f"}

# Step 2: Acquire lock
agent_lock({"agent_id": "claude_7a3b2c1f", "resource": "driver:uart"})
# → {"acquired": true}

# Step 3: Analyze current state
self_host_loop({
    "step": "analyze",
    "agent_id": "claude_7a3b2c1f",
    "target": "uart_driver"
})
# → {"vcc_status": {...}, "daemon": "online"}

# Step 4: Plan changes
self_host_loop({
    "step": "plan",
    "agent_id": "claude_7a3b2c1f",
    "target": "uart_driver",
    "payload": {
        "plan": "Increase buffer from 64 to 256 bytes",
        "workspace_size": 4096
    }
})
# → {"workspace": "0x00400000-0x00401000"}

# Step 5: Execute build
self_host_loop({
    "step": "execute",
    "agent_id": "claude_7a3b2c1f",
    "payload": {
        "cmd": "python3 systems/glyph_stratum/programs/compile_glyph.py uart_v2.glyph uart_v2.rts.png",
        "cwd": "/path/to/geometry_os"
    }
})
# → {"success": true, "output": "Compiled 128 instructions..."}

# Step 6: Deploy
self_host_loop({
    "step": "deploy",
    "agent_id": "claude_7a3b2c1f",
    "payload": {"rts_file": "kernel/firmware/uart_v2.rts.png"}
})
# → {"success": true}

# Step 7: Verify
self_host_loop({
    "step": "verify",
    "agent_id": "claude_7a3b2c1f",
    "payload": {"region": "0x0200-0x02FF"}
})
# → {"validation": {"status": "match", ...}}

# Step 8: Sign VCC
vcc_sign({
    "agent_id": "claude_7a3b2c1f",
    "region_start": "0x0200",
    "region_end": "0x02FF",
    "region_type": "driver",
    "description": "UART driver v2 - increased buffer"
})
# → {"hash": "sha256:606823c8..."}

# Step 9: Notify other agents
agent_event({
    "source_agent": "claude_7a3b2c1f",
    "event_type": "geos:deploy_complete",
    "payload": {"component": "uart_driver", "version": 2}
})

# Step 10: Release lock
agent_unlock({"agent_id": "claude_7a3b2c1f", "resource": "driver:uart"})
```

## VCC Manifest Format

The VCC manifest is stored in `/tmp/geos_vcc_manifest.json`:

```json
{
  "entries": [
    {
      "region_start": 2097152,
      "region_end": 2162688,
      "region_type": "agent_workspace",
      "expected_hash": "606823c81607159c...",
      "signing_agent": "claude_7a3b2c1f",
      "signed_at": 1710123456.789,
      "description": "UART driver v2",
      "parent_hash": "a1b2c3d4e5f6...",
      "metadata": {
        "size_words": 16384
      }
    }
  ],
  "violations": [],
  "guard_enabled": true
}
```

## Dashboard

Monitor all activity in real-time:

```bash
python3 apps/mcp2cli/src/agent_dashboard.py
```

Output:
```
┌──────────────────────────────────────────────────────────┐
│           GEOMETRY OS - MULTI-AGENT DASHBOARD            │
├──────────────────────────────────────────────────────────┤
│ Daemon: http://127.0.0.1:8769                            │
│ Status: 🟢 ONLINE                                         │
├──────────────────────────────────────────────────────────┤
│ Active Agents: 3                                         │
├──────────────────────────────────────────────────────────┤
│  [08:45:12] claude: full_access                          │
│  [08:45:08] gemini: read, write, execute                 │
│  [08:44:55] researcher: read                             │
├──────────────────────────────────────────────────────────┤
│ Memory Regions: 2                                        │
│ Active Locks: 1                                          │
│ Recent Events: 5                                         │
└──────────────────────────────────────────────────────────┘
```

## Files Reference

| File | Purpose |
|------|---------|
| `apps/mcp2cli/src/geos_agent_manager.py` | Multi-agent coordination |
| `apps/mcp2cli/src/geos_vcc.py` | Visual Consistency Contracts |
| `apps/mcp2cli/src/agent_dashboard.py` | Real-time monitoring |
| `apps/mcp2cli/src/geos_mcp_server.py` | MCP tool definitions |
| `docs/SELF_HOSTING.md` | Self-hosting philosophy |
| `docs/MCP2CLI_GUIDE.md` | MCP tool reference |
