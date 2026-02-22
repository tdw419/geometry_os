# Riscv Gpu Vm Testing

## Summary

Enable testing of the RISC-V RV32IMA GPU virtual machine by creating a complete execution pipeline that loads and runs .rts.png encoded RISC-V programs.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

The VM shader (`riscv_linux_vm.wgsl`) executes RISC-V instructions on GPU. We need to build the integration layer that loads encoded .rts.png files into GPU memory, initializes the VM state, runs the compute shader, and captures output.

## Tech Stack

Rust (WGPU), WGSL shaders, Python encoder, existing RISC-V toolchain

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-07-riscv-gpu-vm-testing.md`
