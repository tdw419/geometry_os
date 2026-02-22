# Input Driver Implementation

## Summary

Enable AI to inject keyboard and mouse input into both the in-browser RISC-V CPU and QEMU-based Linux VMs via a unified MMIO interface.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

The GPU Execution System already writes input events to MMIO region 0x02000000. We need to: (1) extend the RISC-V WGSL shader to poll this MMIO region and process input events, and (2) create a Python daemon that bridges MMIO to Linux uinput for QEMU VMs. Both paths share the same MMIO layout.

## Tech Stack

WGSL (WebGPU Shaders), Python 3, python-evdev/uinput, QEMU Monitor Protocol

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-14-input-driver-implementation.md`
