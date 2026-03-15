# Meta-Circular Glyph Scheduler Design

**Date:** 2026-03-15
**Status:** Approved

## Problem

The `gpu_dev_daemon` is a 1372-line Rust binary that runs on Linux. It IS Geometry OS in memory, but it's foreign code - a compiled binary that cannot self-modify. To achieve true self-hosting, the daemon must become a native glyph program running on its own substrate.

## Solution

Migrate the VM scheduler from Rust to a `.glyph` file that runs as VM 0 on the substrate. The Rust code shrinks to a minimal "shim" that handles GPU initialization and trap callbacks for operations the glyph cannot perform directly.

## Architecture

```
┌─────────────────────────────────────────────┐
│           Rust Shim (Minimal)               │
│  ┌─────────────────────────────────────┐    │
│  │ GPU Init (wgpu)                     │    │
│  │ Trap Handler (polls 0xFF00_0000)    │    │
│  │ HTTP/Unix API (temporary)           │    │
│  └─────────────────────────────────────┘    │
└─────────────────┬───────────────────────────┘
                  │ trap callbacks
┌─────────────────▼───────────────────────────┐
│         Glyph Substrate (4096x4096)         │
│  ┌─────────────────────────────────────┐    │
│  │ VM 0: scheduler.glyph               │    │
│  │   - Schedules VMs 1-255             │    │
│  │   - Traps to Rust for GPU ops       │    │
│  │   - Self-modifying possible         │    │
│  └─────────────────────────────────────┘    │
│  ┌─────────────────────────────────────┐    │
│  │ VMs 1-255: User glyph programs      │    │
│  └─────────────────────────────────────┘    │
└─────────────────────────────────────────────┘
```

## Trap Interface

Reserved memory range: `0xFF00_0000 - 0xFFFF_FFFF`

| Offset | Field | Purpose |
|--------|-------|---------|
| 0xFF00_0000 | OP_TYPE | 1=read_buffer, 2=write_buffer, 3=spawn_vm, 4=kill_vm |
| 0xFF00_0004 | ARG0 | Address / VM ID / value |
| 0xFF00_0008 | ARG1 | Size / value2 |
| 0xFF00_000C | ARG2 | Additional argument |
| 0xFF00_0010 | RESULT | Return value (shim writes here) |
| 0xFF00_0014 | STATUS | 0=idle, 1=pending, 2=complete |

**Protocol:**
1. Glyph writes OP_TYPE, ARG0-2
2. Glyph sets STATUS=1
3. Shim polls STATUS, executes op
4. Shim writes RESULT, sets STATUS=2
5. Glyph reads RESULT, continues

## Components

### 1. Rust Shim (gpu_dev_daemon.rs → reduced)

**Responsibilities:**
- GPU initialization (wgpu Instance, Adapter, Device, Queue)
- Create 4096x4096 RAM texture
- Load scheduler.glyph into VM 0
- Trap handler loop
- HTTP/Unix API (temporary, migrate later)

**Removed:**
- GlyphVmScheduler compute pipeline (replaced by glyph scheduler)
- Direct VM management (moved to scheduler.glyph)

### 2. scheduler.glyph

**Responsibilities:**
- Round-robin scheduling of VMs 1-255
- 64 cycles per VM per frame
- VM state management via trap calls
- Frame pacing (~60fps target)

**Structure:**
```
ENTRY 0x0000
  init: load VM table from substrate
  loop:
    for vm_id in 1..255:
      if vm[vm_id].active:
        run vm_id for 64 cycles
        if vm halted:
          mark inactive
    sync frame
    jump loop
```

### 3. Trap Operations

| OP | Name | Args | Description |
|----|------|------|-------------|
| 1 | READ_BUFFER | addr, size | Read from VM state buffer |
| 2 | WRITE_BUFFER | addr, size | Write to VM state buffer |
| 3 | SPAWN_VM | entry, config | Spawn new VM at entry point |
| 4 | KILL_VM | vm_id | Terminate VM |
| 5 | PEEK_SUBSTRATE | x, y | Read substrate pixel |
| 6 | POKE_SUBSTRATE | x, y, val | Write substrate pixel |

## Migration Phases

### Phase 1: Trap Interface (Shim)
- Define trap memory layout
- Implement trap handler in Rust shim
- Add polling loop for STATUS register
- Test with simple glyph that writes and reads trap

### Phase 2: Minimal Scheduler
- Create scheduler.glyph with round-robin loop
- Use traps for VM state buffer access
- Keep scheduling logic identical to current GlyphVmScheduler
- Verify with single test VM

### Phase 3: Multi-VM Verification
- Spawn multiple test VMs
- Verify fair scheduling
- Test SPATIAL_SPAWN opcode from glyph
- Benchmark against Rust scheduler

### Phase 4: API Migration
- Move HTTP parser into daemon.glyph
- Handle peek/poke/exec from glyph
- Keep only socket I/O in shim

### Phase 5: BrainBridge Migration
- Move LM Studio communication to glyph
- Implement intent injection from glyph
- Full self-hosting achieved

## Success Criteria

1. scheduler.glyph runs as VM 0
2. Can schedule 10+ concurrent VMs fairly
3. Frame time < 17ms (60fps)
4. Existing MCP tools still work
5. Self-modification possible (scheduler can rewrite itself)

## Risks

| Risk | Mitigation |
|------|------------|
| Trap overhead too high | Batch operations, use shared memory |
| GPU ops need wgpu context | Keep essential ops in shim, evolve to GPU native |
| Debugging harder | Add trace buffer in substrate, keep shim logs |
| Race conditions | Single-threaded shim, clear status protocol |

## Files to Modify

| File | Change |
|------|--------|
| `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs` | Reduce to shim + trap handler |
| `systems/glyph_stratum/programs/scheduler.glyph` | New file - meta-circular scheduler |
| `systems/infinite_map_rs/src/glyph_vm_scheduler.rs` | Refactor for trap-based access |
| `systems/infinite_map_rs/src/lib.rs` | Export trap interface types |

## References

- `docs/plans/2026-03-15-gpu-daemon-mcp-api-design.md` - Existing MCP tools
- `memory/MEMORY.md` - System overview
- `docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md` - Philosophy
