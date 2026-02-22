# Neural Heatmap Phase2 Multi Model

## Summary

Implement side-by-side comparison of multiple LLM models' neural activities, enabling real-time correlation analysis and differential visualization between model activations.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Extend the existing single-model heatmap system to track N concurrent model instances with synchronized rendering, using a plugin-style architecture where each model has its own activity tracker but shares a common rendering pipeline.

## Tech Stack

PIXI.js v8, WebGPU/WGSL shaders, JavaScript ES6+, WebSocket for real-time data

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-07-neural-heatmap-phase2-multi-model.md`
