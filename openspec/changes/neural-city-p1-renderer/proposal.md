# Neural City P1: PIXI.js Renderer

## Summary

Implement `NeuralCityRenderer.js` and `NeuralCityFilter.js` to display the Neural City weight atlas as an interactive PIXI.js layer with foveated LOD (Level of Detail) support.

## Status

- **Created**: 2026-02-19
- **Plan**: `docs/plans/2026-02-19-neural-city-p1-renderer.md`
- **Prerequisites**: P0 Complete (atlas_generator.py, neural_city_facade.wgsl, low_res_overview.rts.png)

## Scope

### In Scope
- NeuralCityRenderer.js core class with district math
- Atlas loading and PIXI container setup
- NeuralCityFilter.js with GLSL material palette shader
- Filter integration (tick, focus, resize)
- On-demand hi-res tile loading with LRU cache
- Visual Debug HUD integration
- GeometryOSApplication integration
- HTML script tags

### Out of Scope
- WGSL WebGPU shader (P0 complete)
- Atlas generation (P0 complete)
- District metadata extraction (P0 complete)
- Pulse animation effects (P2 future)

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    NEURAL CITY RENDERER                      │
├─────────────────────────────────────────────────────────────┤
│  INPUT: low_res_overview.rts.png (4096×4096 RGBA)           │
│         district_metadata.json (174KB stats)                │
│                                                             │
│  ┌─────────────────┐     ┌─────────────────────────────┐   │
│  │ NeuralCity      │────▶│ NeuralCityFilter            │   │
│  │ Renderer.js     │     │ (GLSL material palette)     │   │
│  │                 │     │ - Gold: F32 (Full)          │   │
│  │ - loadMetadata()│     │ - Steel: Q8 (8-bit)         │   │
│  │ - createContainer()  │ - Rust: Q4 (4-bit)          │   │
│  │ - loadDistrict()│     │ - Dust: Sparse/Zero         │   │
│  │ - tick()        │     └─────────────────────────────┘   │
│  │ - setFocus()    │                                       │
│  └─────────────────┘                                       │
│                                                             │
│  OUTPUT: PIXI.Container with foveated LOD rendering        │
└─────────────────────────────────────────────────────────────┘
```

## Key Files

| File | Lines | Purpose |
|------|-------|---------|
| `NeuralCityRenderer.js` | ~250 | Core renderer class |
| `NeuralCityFilter.js` | ~120 | GLSL filter wrapper |
| `test_neural_city_renderer.js` | ~150 | Unit tests |
| `test_neural_city_filter.js` | ~50 | Filter tests |
| `visual_debug_overlay.js` | +40 | HUD section |
| `application.js` | +30 | Integration |
| `index.html` | +2 | Script tags |

## Test Plan

| Test Suite | Tests | Coverage |
|------------|-------|----------|
| Core Renderer | 8 | Constructor, district math, stats |
| Filter | 4 | Uniforms, time, focus, hi-res |
| Tile Loading | 3 | Load, LRU eviction, VRAM |
| **Total** | **15** | |

## Acceptance Criteria

- [ ] All 15 unit tests pass
- [ ] Low-res atlas loads and displays
- [ ] Material colors (Gold/Steel/Rust/Dust) render correctly
- [ ] Foveated focus updates HUD material display
- [ ] Hi-res tiles load on demand with LRU eviction
- [ ] VRAM stays under 64MB with 64-tile cache
- [ ] No console errors in browser
