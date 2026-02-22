# Rts Extraction Vectorization

## Summary

Optimize RTS pixel extraction from 60 seconds to under 1 second by replacing Python loops with NumPy vectorized operations.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

The current `pixelrts_v2_extractor.py` uses a Python `for` loop to iterate through 268 million pixels one-by-one. We'll replace this with NumPy advanced indexing that extracts all pixels in a single array operation.

## Tech Stack

Python 3.12, NumPy (already used), PIL (already used), pytest

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-07-rts-extraction-vectorization.md`
