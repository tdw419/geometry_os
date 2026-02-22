# Riscv Gpu Vm Testing Corrected

## Summary

Create a working test pipeline that can execute the `minimal_test.rts.png` RISC-V program on the GPU using the existing VM shader.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

The VM shader (`riscv_linux_vm.wgsl`) implements RV32IMA directly. We need to create a Rust wrapper that loads .rts.png files, initializes GPU buffers matching the shader's bind group layout, and executes the compute shader.

## Tech Stack

Rust (WGPU), WGSL shader, existing RISC-V toolchain, Python encoder

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-07-riscv-gpu-vm-testing-corrected.md`
