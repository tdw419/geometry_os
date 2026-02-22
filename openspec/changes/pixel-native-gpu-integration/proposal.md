# Pixel Native Gpu Integration

## Summary

Connect PixelNativeGUI to real WebGPU (wgpu-py) for actual GPU execution with zero-copy framebuffer access.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Create GPUContext wrapper for wgpu device, GPUFramebuffer for real VRAM textures, and GUIComputePipeline for WGSL shader execution. The runtime auto-detects GPU availability and falls back gracefully to mock mode.

## Tech Stack

wgpu-py, WGSL compute shaders, numpy, existing gpu_memory_interface.py

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-12-pixel-native-gpu-integration.md`
