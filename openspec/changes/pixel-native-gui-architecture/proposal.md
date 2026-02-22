# Pixel Native Gui Architecture

## Summary

Build a GPU-native GUI system where AIs perceive and interact with graphical interfaces through direct pixel access, eliminating the screenshot bottleneck.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Hybrid runtime combining CPU orchestration with GPU-accelerated rendering and vision. Programs run as WGSL compute shaders with state stored in GPU textures. AI perception reads framebuffer directly via zero-copy DMA-BUF. Input injection writes to GPU input buffers without OS involvement.

## Tech Stack

WebGPU (wgpu-py), WGSL compute shaders, DMA-BUF, PixelRTS format, VLM grounding (local LLaVA/Qwen)

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-12-pixel-native-gui-architecture.md`
