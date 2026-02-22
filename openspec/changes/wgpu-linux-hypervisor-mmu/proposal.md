# Wgpu Linux Hypervisor Mmu

## Summary

Upgrade the WGPU RISC-V shader to support virtual memory (MMU), enabling full desktop Linux GUI programs to run in the browser.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Add Sv32 page table walking, CSR registers (satp, stvec, sscratch), and privilege mode switching to the existing `visual_cpu_riscv.wgsl` shader. The MMU translates virtual addresses to physical addresses on every LOAD/STORE when in supervisor mode, allowing standard Linux kernels to manage process memory isolation.

## Tech Stack

WebGPU WGSL compute shaders, JavaScript ES modules, RISC-V privilege architecture

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-13-wgpu-linux-hypervisor-mmu.md`
