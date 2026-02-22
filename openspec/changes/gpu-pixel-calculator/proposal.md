# Gpu Pixel Calculator

## Summary

Build a calculator where arithmetic operations execute on the PixelCPU WGSL shader instead of JavaScript, with all state and logic encoded as pixel data.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

- JavaScript launcher loads .rts.png calculator cartridges and renders via PixiJS

## Tech Stack

- WebGPU for shader execution (wgpu-browser or native WebGPU API)

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-05-gpu-pixel-calculator.md`
