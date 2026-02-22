# Orbit Rts Conversion

## Summary

Convert the Orbit desktop environment (ELF binaries, Qt6 libraries, configs) into Geometry OS spatial RTS format, enabling the desktop to boot from a single PNG file as a navigable Infinite Map region.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Orbit binaries are scanned, categorized by type (binary/library/data), assigned spatial coordinates on a Hilbert curve grid, encoded as RGBA pixels via High-Density Pixel Folding (HDPF), wrapped in a PNG container with tEXt metadata chunks, and made executable by the Geometry OS runtime.

## Tech Stack

Python 3, NumPy (Hilbert encoding), Pillow (PNG generation), existing RTS infrastructure (universal_rts_converter.py, binary_detector.py, build_rts_v3.py)

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2025-02-07-orbit-rts-conversion.md`
