# Sbi Support

## Summary

Implement the RISC-V Supervisor Binary Interface (SBI) to enable proper kernel-to-hypervisor communication for timer interrupts, console I/O, and system control.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

SBI is the standard interface between supervisor-mode software (Linux kernel) and the hypervisor/machine-mode layer. When the kernel needs hardware services, it executes `ecall` with specific register conventions. The GPU shader traps these ECALLs, and JavaScript handlers implement the actual functionality.

## Tech Stack

WebGPU (WGSL compute shader), JavaScript ES modules, RISC-V privileged spec v1.12, SBI specification v2.0

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-18-sbi-support.md`
