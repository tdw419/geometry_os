# WASM Integration Debug Summary

## Current Status (2026-03-19)

### What's Working
- ✅ `vm_resume` HTTP endpoint added and functioning
- ✅ `vm_state` HTTP endpoint added with PC/cycles tracking
- ✅ WASM binaries load correctly to 0x20000
- ✅ WASM interpreter (wasm_interpreter.glyph) loaded as VM 2
- ✅ VM 2 can be set to RUNNING state
- ✅ Enhanced logging shows all state transitions

### Current Issue
VM 2 is marked as RUNNING but shows no execution activity:

**VM 2 State:**
- State: RUNNING (1)
- PC: 4096 (0x1000) - WASM interpreter base address
- Cycles: 0 - No instructions executed
- WASM_IP (0x30004): 0x00000000 - WASM interpreter's internal IP
- WASM_STATUS (0x3000C): 0x00000000 - Should be RUNNING (1)

**After Resume:**
```
[VM_RESUME] Attempting to resume VM 2
[VM_RESUME] VM 2 resumed successfully
```
But no frames execute after resume. PC stays at 4096, cycles stay at 0.

### Root Cause Analysis

The issue is that VM 2's state is set to RUNNING, but the GPU scheduler isn't executing any frames for VM 2. Looking at the logs:

1. Frame 0 completes at startup
2. WASM binary loads via POST /load
3. VM 2 state changes from HALTED (2) to RUNNING (1) via vm_resume
4. Frame 60 completes (this is the only frame after resume)
5. **No further frames execute**

This suggests the GPU execution loop has stopped or VM 2 isn't being scheduled.

### Possible Issues

1. **GPU Execution Loop Stopped**: The main execution loop may have exited or paused
2. **VM 2 Not Scheduled**: The scheduler may only run VMs 0 and 1
3. **Frame Timing**: The 60-frame gap suggests the loop is running but not including VM 2
4. **Synchronization Issue**: GPU writes aren't being committed/flushed

### WASM Interpreter Internal State

The WASM interpreter uses internal state at 0x30000-0x30010:
- 0x30000: WASM_SP (stack pointer)
- 0x30004: WASM_IP (instruction pointer)
- 0x30008: WASM_BP (base pointer)
- 0x3000C: WASM_STATUS (running/halted/error)
- 0x30010: WASM_STACK_TOP (cached top value)

We set these via poke, but they're not being read/updated by VM 2, which means VM 2 isn't executing its fetch-decode-execute loop.

### Next Debugging Steps

1. **Check GPU Execution Loop**: Verify the main loop is still running after resume
2. **Check VM Scheduler**: Verify VM 2 is being included in execution cycles
3. **Add Frame Logging**: Log every frame execution to see if VM 2 runs
4. **Check GPU Submission**: Ensure buffer writes are being submitted to GPU queue
5. **Verify Synthetic VRAM**: Test WASM interpreter in CPU-only mode first

### Files to Investigate

- `systems/infinite_map_rs/src/glyph_vm_scheduler.rs` - VM execution loop
- `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs` - Main execution thread
- `systems/infinite_map_rs/src/gpu/shaders/glyph_microcode.wgsl` - GPU-side VM execution
