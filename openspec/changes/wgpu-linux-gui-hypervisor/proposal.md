# Wgpu Linux Gui Hypervisor

## Summary

Build a pure browser Linux hypervisor that boots GUI programs using WebGPU, with progressive milestones from shell to interactive GUI apps.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Kernel loader fetches .rts.png textures, GPUExecutionSystem runs RISC-V code with MMU, DisplayManager renders framebuffer in 3 modes, InputHandler captures keyboard/mouse events to MMIO region.

## Tech Stack

WebGPU, WGSL compute shaders, JavaScript ES modules, PixiJS v8, RISC-V Linux (Alpine)

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-14-wgpu-linux-gui-hypervisor.md`
