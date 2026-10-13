# Phase 5.2: RISC-V Hypervisor Bridge - Status 2026-07-01

## What Works

1. ✅ **Spatial Allocator Core Logic** - Direct unit test passes:
   - `handle_spatial_alloc(0x2000, 0x2010)` returns result=0
   - Allocates 10x20 region
   - Generates 30 wall cells around the region

2. ✅ **SpatialHypervisorIntegration RAM Access** - Can read/write guest RAM via staging buffers

3. ✅ **RiscvExecutor::read_ram()** - New helper method added for testing RAM content

## What's Broken

### E2E Test Fails
The RISC-V assembly test (`test_spatial_alloc_simple.S`) doesn't trigger the hypercall handler. Symptoms:
- Result flag at 0x3000 is 0 (fail)
- Response buffer at 0x2010 contains zeros (uninitialized)
- No log messages from "Processing spatial alloc hypercall"

### Root Cause (Hypothesis)
The RISC-V ecall instruction (`ecall` with a7=0x123) isn't being captured by the syscall queue mechanism. Possible issues:
1. The ecall isn't generating a syscall queue entry at all
2. The syscall queue entry has wrong arguments (a0/a1 not being passed)
3. The hypercall check happens in wrong branch (doesn't match syscall number)

## Next Steps

Using Ollama to:
1. Debug why ecall doesn't reach the syscall queue
2. Add logging to trace ecall execution path through RiscvExecutor
3. Verify syscall queue entry structure matches RISC-V register values
4. Fix the ecall → syscall queue → hypercall handler path

## Files Modified

- `/systems/infinite_map_rs/src/riscv_executor.rs` - Added `read_ram()` method for debugging
- `/systems/infinite_map_rs/tests/test_spatial_alloc_simple.S` - Simplified RISC-V test (writes result flag to RAM)
- `/systems/infinite_map_rs/tests/test_spatial_alloc_e2e_simple.rs` - E2E test wrapper
- `/systems/infinite_map_rs/tests/test_spatial_alloc_direct.rs` - Direct unit test (PASSES)

## Test Results

```
test_spatial_alloc_direct: PASSED ✓
  - Allocates 10x20 region
  - Returns 30 wall cells
  - result=0 (success)

test_spatial_alloc_e2e_simple: FAILED ✗
  - Result flag = 0 (fail)
  - Response buffer = zeros
  - No hypercall logged
```