# Phase1.1 Pretrained Vision Encoders

## Summary

Integrate pre-trained Vision Transformer encoders (CLIP, DINOv2, EVA) into Pixel LLM to replace the current randomly initialized vision encoder, improving caption quality by ≥10%.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Create an abstraction layer for vision encoders that supports multiple backends. The current `VisionEncoder` class uses random initialization. We'll add `PretrainedVisionEncoder` that can load pre-trained weights from CLIP (OpenAI), DINOv2 (Meta), or EVA02 (Tencent). These encoders have been trained on billions of images and provide much better visual representations. The integration maintains backward compatibility - existing code using `VisionEncoder` continues to work, while new code can opt into pre-trained encoders.

## Tech Stack

- PyTorch 2.9+ for model loading

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-08-phase1.1-pretrained-vision-encoders.md`
