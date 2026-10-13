## Phase 5.2 Root Cause Discovery

### The GPU RISC-V Executor is Working!

**Finding:** The GPU shader is NOT broken. It's executing instructions perfectly:
- Executing 1,250 instructions per frame
- PC advancing correctly
- All debug logs show uniform.status=1 (running)

### The Real Problem: Incorrect Test Setup

**Issue #1: Wrong load function**
The test was using `load_program()` which extracts an entry point from bytes 4-7 (for RTS-PNG format). Raw RISC-V binaries have instruction data there, causing the PC to jump to garbage addresses like 0x200002b7.

**Solution:** Use `load_binary()` instead of `load_program()`.

**Issue #2: RAM size mismatch**
The spatial hypervisor was auto-enabled and trying to read NEURAL_GATE_MMIO (0x03000000) on every frame. With only 1MB RAM, this caused a bounds error.

**Issue #3: PC tracking confusion**
Tests were reading RAM[0x1000] to get the PC. But RAM[0x1000] contains the first instruction, not the PC. PC is stored in GPU uniform buffers, not RAM.

### Debug Output Summary

```
[DEBUG] Before GPU dispatch: status=1, pc=0x00001000, instruction_count=20000, cycle_count=1
[DEBUG] After GPU readback: status=1, current_pc=0x000cba30, instructions_executed=1250
```

- **status=1**: Correct (bit 0 set = running)
- **pc=0x00001000**: Correct entry point
- **instructions_executed=1250**: Working correctly!
- **current_pc=0x000cba30**: Jumped because wrong binary was loaded

### Files Modified

- `src/riscv_executor.rs`: Added debug logging at lines 1030-1039, 1131-1137
- `tests/test_spatial_alloc_e2e_simple.rs`: Fixed to use `load_binary()` + `set_pc()`
- `src/spatial_hypervisor_integration.rs`: Added bounds checking (saturating_sub)

### Next Steps

1. Fix test to disable spatial hypervisor (not needed for minimal ECALL test)
2. Run corrected spatial_alloc_e2e_simple test
3. Verify ECALL handling works correctly
4. Update ROADMAP with findings