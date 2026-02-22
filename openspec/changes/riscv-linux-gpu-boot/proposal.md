# Riscv Linux Gpu Boot

## Summary

Enable true GPU-native OS booting by loading and running RISC-V Linux distributions directly on the GPU through the Pixel QEMU architecture.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

1. Download and extract RISC-V Linux kernel + initrd from official Alpine/RISC-V ISO

## Tech Stack

- RISC-V toolchain: `riscv64-linux-gnu-as`, `riscv64-linux-gnu-objcopy`

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-07-riscv-linux-gpu-boot.md`
