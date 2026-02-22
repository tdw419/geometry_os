# Riscv Interrupt Trap Handling

## Summary

Enable the RISC-V GPU shader to service pending timer interrupts, allowing the Linux kernel's scheduler to function.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Check SIP (Supervisor Interrupt Pending) before instruction fetch in the shader's main loop. When a timer interrupt is pending and interrupts are enabled (SIE), trigger a trap to STVEC with SCAUSE=0x80000005 (Supervisor Timer Interrupt). The hypervisor will use cycle count for monotonic timer comparison.

## Tech Stack

WGSL (WebGPU Shading Language), JavaScript ES Modules, Node.js for testing

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-18-riscv-interrupt-trap-handling.md`
