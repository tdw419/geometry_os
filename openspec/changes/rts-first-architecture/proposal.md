# Rts First Architecture

## Summary

Complete the RTS-First workflow where .rts.png becomes the primary source of truth for Geometry OS - the AI builds, edits, and debugs everything directly in the visual texture format.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

- **Bundler** (files → .rts.png): ✅ Complete (`systems/packaging/rts_bundler.py`)

## Tech Stack

Python 3.12+, NumPy, PIL/Pillow, existing `pixelrts_v2_converter.py`

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-07-rts-first-architecture.md`
