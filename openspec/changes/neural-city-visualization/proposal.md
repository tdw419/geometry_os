# Neural City Visualization

## Summary

Create an interactive "Neural City" visualization of Qwen2.5 Coder 0.5B encoded as `qwen_coder.rts.png`, enabling users to explore neural network architecture as a spatial city with distinct neighborhoods for different layer types.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

The AI PM Dashboard already has PixiJS-based map rendering. We'll extend the spatial analyzer to parse PixelRTS-2.0-Neural format (layer metadata), create a neural-specific overlay system that color-codes layers by quantization type (F32, Q4_K, Q5_0, Q6_K, Q8_0), and add interactive features for inspecting layer metadata, navigating neural neighborhoods, and understanding the spatial organization of the LLM.

## Tech Stack

Python 3.12 (FastAPI backend), JavaScript (PixiJS v8 frontend), NumPy (image analysis), existing `qwen_coder.rts.png` (394 MB, 16384×16384, 290 layers)

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-07-neural-city-visualization.md`
