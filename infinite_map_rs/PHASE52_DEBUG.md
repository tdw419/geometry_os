## Phase 5.2 Debugging Summary

### Issues Found

1. **vm_status_buffer initialization** - Fixed: Buffer was created but never initialized to zeros. Added initialization at riscv_executor.rs:560-561.

2. **vm_status signal in WGSL** - Fixed: Added `vm_status[vm_id] = 1u` to signal CPU when syscalls are pending (riscv_executor.wgsl:736).

3. **Test binary missing a2 argument** - Fixed: Added `li a2, 0x2020` to pass ready_flag_ptr to hypercall handler.

4. **Ecall detection path** - The shader correctly dispatches ECALL to `handle_syscall()` at line 1001, which queues syscalls and sets vm_status.

### Remaining Issue

**Test runs for 200 frames (max limit) without processing syscalls**

- Binary contains correct ECALL instruction at offset 0x40 (0x00000073 = ECALL)
- Syscall ID 291 (0x123) is loaded into a7 before ECALL
- Shader sets vm_status[0] = 1 when queuing syscalls
- CPU checks if `status[0] == 1` at riscv_executor.rs:1219
- But test output shows no "VM 0 triggered N syscall(s)" log messages

### Hypothesis

The `vm_status` buffer is not being properly synced from GPU to CPU, or the frame isn't completing execution before CPU checks status.

### Next Steps

1. Add explicit buffer barrier between GPU execution and CPU readback
2. Verify execute_frame() submits GPU commands and waits for completion
3. Check if vm_status buffer bind group is correctly configured