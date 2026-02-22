# Pixelrts Platform Vasm Icr

## Summary

Transform PixelRTS from visual container into executable platform by creating a visual assembler (vasm) that compiles assembly syntax to semantic .rts.png bytecode, and an enhanced Infinite Canvas Runtime (ICR) that executes programs directly from GPU VRAM with visual debugging.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

- **vasm** (Visual Assembler): Text assembly → PNIR instructions → Hilbert-mapped RGBA pixels → .rts.png

## Tech Stack

Python 3.12, Pillow (PNG), NumPy (vectorized ops), WGPU (GPU compute), WGSL (shaders), pytest (testing)

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-08-pixelrts-platform-vasm-icr.md`
