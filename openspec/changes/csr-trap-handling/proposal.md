# Csr Trap Handling

## Summary

Implement complete S-mode trap handling for the RISC-V GPU shader, replacing halt-on-fault with proper exception traps to enable Linux kernel support.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Add 6 new CSRs (SEPC, SCAUSE, STVAL, SSTATUS, SIE, SIP), implement trap flow that saves state and jumps to STVEC instead of halting, add SRET instruction for trap return, and support all exception types (page faults, ecall, illegal instruction, breakpoint, interrupts).

## Tech Stack

WGSL (WebGPU Shaders), JavaScript, RISC-V ISA

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-14-csr-trap-handling.md`
