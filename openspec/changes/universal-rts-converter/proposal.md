# Universal Rts Converter

## Summary

Build a unified converter that creates .rts files from any binary (kernels, LLMs, WASM, etc.) using qwen_coder.rts.png as the reference template for PixelRTS-2.0-Neural format.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Create `universal_rts_converter.py` that auto-detects binary type and selects appropriate encoding strategy (Hilbert RGBA for LLMs, HDPF for kernels, etc.). Unify the existing `llm_to_pixelrts_converter.py` and `systems/pixel_compiler/pixelrts_converter_v2.py` into a single tool with format detection.

## Tech Stack

Python 3, NumPy, PIL/Pillow, GGUF (optional), hashlib, pathlib

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-07-universal-rts-converter.md`
