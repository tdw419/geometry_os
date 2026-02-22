# Rts Mixed Precision Training

## Summary

Add native PyTorch AMP (Automatic Mixed Precision) training to the RTS neural pipeline, enabling faster training, reduced memory usage, and support for larger models on consumer GPUs.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Wrap the existing RTSTrainer with torch.cuda.amp.GradScaler and autocast context. Master weights remain FP32 in .rts.png storage, while training computations use FP16 for speed and memory efficiency. Loss scaling prevents gradient underflow.

## Tech Stack

Python 3.12, PyTorch 2.0+, torch.cuda.amp (AMP), existing RTS training infrastructure

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-07-rts-mixed-precision-training.md`
