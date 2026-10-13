Phase 5.2 Status Update - BLOCKED on WGSL VM Execution
=========================================================

Root Cause: WGSL RV32 Emulator Not Executing Instructions Correctly
----------------------------------------------------------------------

Even with RV32 binaries compiled correctly, the WGSL VM does not execute RISC-V
instructions properly. No ECALLs are triggered and the VM never progresses.

Evidence:
---------
1. Direct hypervisor test PASSES (test_spatial_alloc_direct)
   - handle_spatial_alloc() works correctly
   - Response and ready_flag written correctly
   - 30 wall cells allocated successfully

2. RV32 binaries compiled successfully
   - Using riscv64-unknown-elf-as -march=rv32i
   - Generates valid RV32 instructions (confirmed with objdump)
   - test_spatial_alloc_poll_rv32.bin: ELF 32-bit LSB relocatable

3. E2E test FAILS (test_spatial_alloc_with_polling)
   - VM executes 100 frames without halting
   - No "Processing spatial hypercall" log messages
   - No "Syscall" or "pending" log messages from riscv_executor
   - ready_flag remains 0 throughout

4. Simple halt test FAILS (test_vm_halts)
   - VM executes 20 frames without halting
   - success_flag at 0x3000 never written
   - No ECALL detection at all

Conclusion:
-----------
The WGSL shader (src/shaders/glyph_vm_riscv.wgsl) has one or more bugs in:
- Instruction decoding
- Instruction execution
- PC progression
- Memory access

The hypervisor integration is completely correct - the issue is purely in the
WGSL VM's ability to run RISC-V code.

Recommended Next Step:
---------------------
Debug WGSL shader execution. Options:
1. Add extensive logging to WGSL (console_buffer writes on every instruction)
2. Use Ollama/autonomous agent to systematically debug shader
3. Compare WGSL decoder output against QEMU/Spike reference
4. Instrument shader with per-instruction traces

Phase 5.2 is BLOCKED until WGSL VM execution is debugged.

Related Files:
-------------
- src/shaders/glyph_vm_riscv.wgsl - WGSL RV32 emulator (NEEDS DEBUGGING)
- src/spatial/hypervisor_bridge.rs - Hypervisor integration (✓ WORKING)
- src/spatial_hypervisor_integration.rs - Spatial allocator (✓ WORKING)
- src/riscv_executor.rs - CPU-side orchestration (✓ WORKING)
- tests/test_spatial_alloc_direct.rs - Direct test (✓ PASSES)
- tests/test_spatial_alloc_poll.rs - E2E test (❌ FAILS)
- PHASE_5_2_RV64_ISSUE.md - Previous incorrect diagnosis (RV32 vs RV64)