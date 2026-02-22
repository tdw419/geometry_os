# Neural City P1: Tasks

## Task Overview

| Task | Agent | Depends On | Files |
|------|-------|------------|-------|
| Task 1: Core Class | js-specialist | - | `NeuralCityRenderer.js`, `test_neural_city_renderer.js` |
| Task 2: Atlas Loading | js-specialist | Task 1 | `NeuralCityRenderer.js`, `test_neural_city_renderer.js` |
| Task 3: Filter Wrapper | shader-specialist | - | `NeuralCityFilter.js`, `test_neural_city_filter.js` |
| Task 4: Filter Integration | js-specialist | Task 2, Task 3 | `NeuralCityRenderer.js` |
| Task 5: Hi-Res Tiles | js-specialist | Task 2 | `NeuralCityRenderer.js` |
| Task 6: HUD Integration | ui-specialist | Task 4 | `visual_debug_overlay.js` |
| Task 7: App Integration | integrator | Task 5 | `application.js` |
| Task 8: HTML Entry | integrator | Task 7 | `index.html` |

## Parallelization

```
Task 1 ──┬──► Task 2 ──┬──► Task 4 ──► Task 6
         │             │
         │             └──► Task 5 ──► Task 7 ──► Task 8
         │
Task 3 ──┴─────────────────► Task 4

Max parallel: 2 agents (Task 1-2 chain || Task 3)
```

---

## Task 1: NeuralCityRenderer Core Class

**Agent**: js-specialist
**Files**: `systems/visual_shell/web/NeuralCityRenderer.js`, `systems/visual_shell/web/tests/test_neural_city_renderer.js`

### Step 1: Write failing test
```javascript
it('should initialize with default config', () => {
    renderer = new NeuralCityRenderer({ app: mockApp });
    assert.strictEqual(renderer.config.districtSize, 512);
    assert.strictEqual(renderer.config.maxCacheSize, 64);
});
```

### Step 2: Run test (expect fail)
```bash
node --test systems/visual_shell/web/tests/test_neural_city_renderer.js
```

### Step 3: Implement
Create NeuralCityRenderer class with:
- Constructor with config
- `pixelToDistrict(px, py)` - convert pixel to district coords
- `districtToPixel(dx, dy)` - convert district to pixel coords
- `getDistrictId(dx, dy)` - generate district ID string
- `getStats()` - return renderer statistics

### Step 4: Run test (expect pass)

### Step 5: Commit
```bash
git commit -m "feat(neural-city): add NeuralCityRenderer core class with district math"
```

---

## Task 2: Atlas Loading and PIXI Container

**Agent**: js-specialist
**Depends On**: Task 1
**Files**: Same as Task 1

### Implementation
- `loadMetadata()` - fetch district_metadata.json
- `createContainer()` - create PIXI.Container with low-res sprite
- `initialize()` - async initialization sequence
- `destroy()` - cleanup resources

### Tests
- `it('should load district metadata')`
- `it('should create PIXI container')`

---

## Task 3: NeuralCityFilter Wrapper

**Agent**: shader-specialist
**Files**: `systems/visual_shell/web/NeuralCityFilter.js`, `systems/visual_shell/web/tests/test_neural_city_filter.js`

### Implementation
GLSL fragment shader with:
- Material palette (Gold/Steel/Rust/Dust)
- `getMaterial(quantTier, magnitude)` function
- Uniforms: time, focus_district, hi_res_valid, resolution
- Methods: `updateTime()`, `setFocusDistrict()`, `setHiResValid()`

### Tests
- `it('should create filter with default uniforms')`
- `it('should update time uniform')`
- `it('should update focus district')`
- `it('should set hi-res valid flag')`

---

## Task 4: Filter Integration

**Agent**: js-specialist
**Depends On**: Task 2, Task 3
**Files**: `NeuralCityRenderer.js`

### Implementation
- `applyFilter()` - create and apply NeuralCityFilter to sprite
- `tick(deltaTime)` - update filter time each frame
- `setFocus(x, y)` - update focus for foveated rendering
- `resize(width, height)` - handle viewport resize

---

## Task 5: Hi-Res Tile Loading with LRU Cache

**Agent**: js-specialist
**Depends On**: Task 2
**Files**: `NeuralCityRenderer.js`

### Implementation
- `loadDistrict(dx, dy)` - load 512×512 tile on demand
- `extractTile(dx, dy)` - placeholder for source RTS extraction
- `_evictIfNeeded()` - LRU eviction when cache > maxCacheSize
- `getHiResTexture()` - get current focus district texture
- `calculateVRAM()` - estimate VRAM usage

### Tests
- `it('should load district on demand')`
- `it('should evict oldest tile when cache full (LRU)')`
- `it('should track VRAM usage')`

---

## Task 6: Visual Debug HUD Integration

**Agent**: ui-specialist
**Depends On**: Task 4
**Files**: `systems/visual_shell/web/visual_debug_overlay.js`

### Implementation
Add `renderNeuralCityHUD(ctx, startY, neuralCity)` function:
- District coordinates display
- Material at focus point
- Cache status (loaded/total %)
- VRAM usage
- Material legend (Gold/Steel/Rust/Dust)

### Verification
1. Open browser
2. Press Ctrl+Shift+V
3. Verify Neural City HUD section appears

---

## Task 7: GeometryOSApplication Integration

**Agent**: integrator
**Depends On**: Task 5
**Files**: `systems/visual_shell/web/application.js`

### Implementation
- Initialize NeuralCityRenderer after InfiniteMap
- Add to worldContainer as overlay layer
- Apply filter
- Hook ticker for updates
- Add focus sync in viewport handlers
- Add resize handler

---

## Task 8: HTML Entry Point

**Agent**: integrator
**Depends On**: Task 7
**Files**: `systems/visual_shell/web/index.html`

### Implementation
Add script tags:
```html
<script src="NeuralCityRenderer.js"></script>
<script src="NeuralCityFilter.js"></script>
```

### Verification
Check browser Network tab and Console for successful loads.

---

## Verification Commands

```bash
# Run all tests
node --test systems/visual_shell/web/tests/test_neural_city_renderer.js
node --test systems/visual_shell/web/tests/test_neural_city_filter.js

# Expected: 15 tests passing

# Browser verification
# 1. Open Geometry OS
# 2. Navigate to Neural City region
# 3. Press Ctrl+Shift+V for HUD
# 4. Verify materials display correctly
```
