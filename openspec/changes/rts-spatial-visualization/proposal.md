# Rts Spatial Visualization

## Summary

Add real-time RTS spatial visualization to the AI PM dashboard, showing entropy hotspots, Hilbert coordinates, and code structure analysis overlaid on the project map.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

The dashboard already has PixiJS-based map rendering (`AIPMMap`) and RTS import/export (`AIPMRTS`). We'll add a new `AIPMSpatialView` class that loads `.rts.png` files as textures, analyzes their spatial structure using the existing `RTSAnalyzer`, and overlays visualizations (entropy heatmaps, coordinate grids, hotspots) on the map canvas.

## Tech Stack

Python 3.12 (FastAPI backend), JavaScript (PixiJS v8 frontend), NumPy (image analysis), PIL (image loading), WebSocket (real-time updates)

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-07-rts-spatial-visualization.md`
