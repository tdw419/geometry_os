# SPATIAL_SPAWN Architecture

## GPU-Native Multi-Tasking for Geometry OS

This document describes the refined SPATIAL_SPAWN logic for multi-tasking glyph programs directly on the GPU.

## Overview

SPATIAL_SPAWN (Opcode 225) enables a running Glyph VM to create new child VMs without CPU round-trips. This is the foundation for self-hosting multi-tasking in Geometry OS.

```
┌─────────────────────────────────────────────────────────────────────┐
│                         GPU Memory                                  │
├─────────────────────────────────────────────────────────────────────┤
│  ┌──────────┐  ┌──────────┐  ┌──────────┐       ┌──────────┐       │
│  │  VM #0   │  │  VM #1   │  │  VM #2   │  ...  │  VM #7   │       │
│  │ (Root)   │  │ (Child)  │  │ (Child)  │       │ (Free)   │       │
│  │ RUNNING  │  │ RUNNING  │  │ HALTED   │       │ INACTIVE │       │
│  └──────────┘  └──────────┘  └──────────┘       └──────────┘       │
│       │              ▲                                             │
│       │              │                                             │
│       └──── SPATIAL_SPAWN ───► Allocate free slot                 │
│            (regs[p1]=entry, regs[p2]=flags)                        │
│                                                                     │
│  ┌─────────────────────────────────────────────────────────────┐   │
│  │                    Scheduler State                           │   │
│  │  active_count: 2  │  frame: 1234  │  spawn_count: 15        │   │
│  └─────────────────────────────────────────────────────────────┘   │
│                                                                     │
│  ┌─────────────────────────────────────────────────────────────┐   │
│  │                    RAM Texture (4096x4096)                   │   │
│  │         .rts.png - Hilbert-encoded program memory           │   │
│  └─────────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────────┘
```

## Key Components

### 1. VmState Structure (GPU)

Each VM slot contains:

```wgsl
struct VmState {
    regs: array<u32, 32>,    // General purpose registers
    pc: u32,                  // Program counter (Hilbert index)
    halted: u32,              // Halt flag
    stratum: u32,             // Current stratum
    cycles: u32,              // Total cycles executed
    stack_ptr: u32,           // Stack pointer
    vm_id: u32,               // Slot ID (0-7)
    state: u32,               // INACTIVE/RUNNING/HALTED/WAITING
    parent_id: u32,           // Parent VM (0xFF = none)
    entry_point: u32,         // Initial PC for restart
    stack: array<u32, 64>,    // Call stack
}
```

### 2. SPATIAL_SPAWN Opcode (225)

**Operation:**
```
SPATIAL_SPAWN r1, r2
  r1 = Entry point for new VM (input/child_id output)
  r2 = Spawn flags (0 = copy state, 1 = fresh state)
```

**Shader Implementation:**
```wgsl
case OP_SPATIAL_SPAWN: {
    let entry_point = vm.regs[p1];
    let spawn_flags = vm.regs[p2];

    // Find free slot
    for (var i = 0u; i < MAX_VMS; i++) {
        if (vms[i].state == VM_STATE_INACTIVE) {
            // Initialize new VM
            vms[i].vm_id = i;
            vms[i].parent_id = vm.vm_id;
            vms[i].entry_point = entry_point;
            vms[i].pc = entry_point;
            vms[i].state = VM_STATE_RUNNING;

            if (spawn_flags == 0u) {
                // Copy parent's registers
                for (var r = 0u; r < 32u; r++) {
                    vms[i].regs[r] = vm.regs[r];
                }
            }

            scheduler.active_count += 1u;
            vm.regs[p1] = i;  // Return child ID
            break;
        }
    }
}
```

### 3. Round-Robin Scheduler

The scheduler runs each active VM for `MAX_CYCLES_PER_VM` (64) instructions per frame:

```wgsl
fn run_scheduler() {
    for (var vm_idx = 0u; vm_idx < MAX_VMS; vm_idx++) {
        if (vms[vm_idx].state == VM_STATE_RUNNING) {
            for (var c = 0u; c < MAX_CYCLES_PER_VM; c++) {
                if (vms[vm_idx].state != VM_STATE_RUNNING) break;
                execute_instruction(vm_idx);
            }
        }
    }
    scheduler.frame += 1u;
}
```

## Integration with Visual Interaction Bus

The SPATIAL_SPAWN system integrates with the Visual Interaction Bus for event-driven multi-tasking:

```
┌──────────────────────────────────────────────────────────────────────────┐
│                        Visual Interaction Bus                            │
├──────────────────────────────────────────────────────────────────────────┤
│                                                                          │
│  Physical Mouse                                                          │
│       │                                                                   │
│       ▼                                                                   │
│  ┌─────────────────┐                                                     │
│  │ geometry_input  │  (Kernel Module - DMA-BUF)                         │
│  │  evdev capture  │                                                     │
│  └────────┬────────┘                                                     │
│           │                                                               │
│           ▼                                                               │
│  ┌─────────────────┐     ┌─────────────────┐                            │
│  │  VRAM Queue     │────►│  Event Shader   │                            │
│  │  (Ring Buffer)  │     │  (Hit Testing)  │                            │
│  └─────────────────┘     └────────┬────────┘                            │
│                                   │                                       │
│                                   ▼                                       │
│  ┌─────────────────────────────────────────────────────────────────────┐│
│  │                      Window Table (GPU)                             ││
│  │  ┌─────┐  ┌─────┐  ┌─────┐  ┌─────┐                                ││
│  │  │W#0 │  │W#1 │  │W#2 │  │W#3 │                                ││
│  │  │focused  │       │       │                                ││
│  │  └──┬──┘  └─────┘  └─────┘  └─────┘                                ││
│  └─────│───────────────────────────────────────────────────────────────┘│
│        │                                                                 │
│        ▼                                                                 │
│  ┌─────────────────────────────────────────────────────────────────────┐│
│  │                   Glyph VM Scheduler                                ││
│  │                                                                     ││
│  │  Event-driven VM activation:                                        ││
│  │  - Window focused → Wake VM if WAITING                             ││
│  │  - Mouse click in region → Inject interrupt to VM                   ││
│  │  - SPATIAL_SPAWN → Create new window region                         ││
│  │                                                                     ││
│  └─────────────────────────────────────────────────────────────────────┘│
└──────────────────────────────────────────────────────────────────────────┘
```

### Event-to-VM Mapping

When a window receives focus:

1. **Event Shader** writes to Window Table: `window_id.focused = 1`
2. **Scheduler** reads Window Table each frame
3. If `vm_id` for focused window is `WAITING`, transition to `RUNNING`
4. Inject mouse/keyboard events into VM's input registers

### VM-to-Window Mapping

When a VM calls SPATIAL_SPAWN:

1. New VM created with `parent_id` set
2. Parent VM can write to Window Table to create a new window region
3. Child VM's `vm_id` becomes the new window's `window_id`
4. Child VM renders to its window region via DRAW opcode

## Usage Example

### Creating a Child Process (Glyph Assembly)

```asm
; SPATIAL_SPAWN Example
; Spawn a child VM at entry point 0x2000 with fresh state

    MOV r1, 0x2000      ; Entry point for child
    MOV r2, 1           ; Fresh state (don't copy registers)
    SPATIAL_SPAWN r1, r2

    ; r1 now contains child VM ID (0-7) or 0xFFFFFFFF on error
    CMP r1, 0xFFFFFFFF
    JE spawn_failed

    ; Store child ID for later communication
    STORE child_id_ptr, r1
    JMP continue

spawn_failed:
    ; Handle no free slots
    HALT

continue:
    ; Parent continues execution
    ; ...
```

### Child VM Code (at 0x2000)

```asm
; Child VM Entry Point
    ; Receive messages from parent
    MOV r1, parent_msg_ptr
    LOAD r2, r1

    ; Do work...
    ADD r2, r2, 1

    ; Store result
    STORE result_ptr, r2

    ; Yield to scheduler
    YIELD

    ; Loop
    JMP 0x2000
```

## Performance Characteristics

| Metric | Value |
|--------|-------|
| Max concurrent VMs | 8 |
| Cycles per VM per frame | 64 |
| Frame overhead | ~512 instructions max |
| Spawn latency | 1 frame (no CPU round-trip) |
| Memory per VM | 432 bytes (regs + stack + state) |

## Comparison with CPU-side MultiVmManager

| Aspect | CPU MultiVmManager | GPU GlyphVmScheduler |
|--------|-------------------|---------------------|
| VM Creation | CPU syscall | GPU shader |
| Context Switch | CPU interrupt | GPU round-robin |
| Event Handling | CPU → GPU copy | GPU direct |
| Spawn Latency | ~1ms | ~16µs (1 frame) |
| Scaling | Limited by CPU | Limited by GPU slots |

## Future Extensions

1. **Dynamic Slot Allocation**: Expand beyond 8 slots via buffer resizing
2. **Priority Scheduling**: Higher-priority VMs get more cycles
3. **Inter-VM Messaging**: Mailbox queue for parent-child communication
4. **GPU Indirect Dispatch**: True thread spawning via VK_NV_device_generated_commands
5. **Wait for Event**: VMs can sleep until window focus/mouse click

## Files

| File | Purpose |
|------|---------|
| `shaders/glyph_vm_scheduler.wgsl` | GPU scheduler and SPATIAL_SPAWN implementation |
| `src/glyph_vm_scheduler.rs` | Rust driver for GPU scheduler |
| `interaction_bus/geometry_input.c` | Kernel module for HID → VRAM path |
| `interaction_bus/event_queue.wgsl` | GPU event consumer shader |
| `interaction_bus/window_table.rs` | GPU-resident window state |

---

*Last updated: 2026-03-13*
*Phase: Visual Interaction Bus + SPATIAL_SPAWN Integration*
