# Pixelrts V2 Implementation

## Summary

Implement PixelRTS v2 format - a visual bootable container that encodes binary data into PNG images using RGBA dense packing with Hilbert space-filling curve mapping, supporting both Standard (OS images) and Code (WASM semantic visualization) modes, fully integrated into Geometry OS pixel_compiler.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

The implementation consists of:

## Tech Stack

Python 3.12+, Pillow (PNG), PyYAML (metadata), pytest (testing), numpy (Hilbert LUT acceleration)

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-08-pixelrts-v2-implementation.md`
