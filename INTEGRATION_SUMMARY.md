# Barnes-Hut Quadtree Integration - Task 2 Complete

## Summary

Successfully integrated the Barnes-Hut quadtree into GravityEngine for O(N log N) force calculation.

## Changes Made

### 1. Modified `systems/infinite_map/gravity_engine.py`

**New Constructor Parameters:**
- `use_quadtree: bool = True` - Enable/disable quadtree acceleration (default: enabled)
- `quadtree_threshold: int = 50` - Particle count threshold to switch from direct to quadtree
- `theta: float = 0.5` - Barnes-Hut opening angle parameter

**Modified Methods:**
- `update()` - Now routes to either `_update_direct()` or `_update_quadtree()` based on particle count
- `_update_direct()` - Renamed from original `update()` implementation
- `_update_quadtree()` - NEW: Barnes-Hut O(N log N) implementation

**Algorithm Selection Logic:**
```python
if self.use_quadtree and n_orbs > self.quadtree_threshold:
    self._update_quadtree()  # O(N log N)
else:
    self._update_direct()    # O(N^2)
```

### 2. Updated `tests/test_gravity_engine_quadtree.py`

**Fixed Test Issues:**
- Corrected `add_orb()` parameter order (was missing `size` parameter)
- Tests now properly initialize orbs with: `add_orb(path, x, y, z, size)`

**Test Coverage:**
- `test_gravity_engine_quadtree_mode_default` - Verify quadtree mode can be enabled
- `test_gravity_engine_small_n_uses_direct` - Small N uses direct calculation
- `test_gravity_engine_large_n_uses_quadtree` - Large N uses quadtree
- `test_quadtree_forces_approximately_correct` - Accuracy within 15% of direct
- `test_quadtree_faster_than_direct` - Performance benchmark

## Implementation Details

### Quadtree Integration Strategy

**2D Spatial Partitioning:**
- Quadtree operates on XY plane only
- Z-axis forces (layer affinity) calculated directly
- This hybrid approach maintains 3D physics while gaining 2D speedup

**Mass Handling:**
- Direct calculation: F = k_repel / r^2 (no mass weighting)
- Quadtree: Uses uniform mass=1.0 per particle to match direct behavior
- This ensures force consistency between both algorithms

**Force Calculation:**
1. Build quadtree from all particle XY positions
2. For each particle, calculate XY repulsion using Barnes-Hut
3. Apply Z-axis layer affinity directly
4. Apply spring forces for linked orbs directly
5. Integrate and update positions

### Performance Characteristics

**Direct O(N^2):**
- Best for: N < 50 particles
- Exact force calculation
- Simple implementation

**Quadtree O(N log N):**
- Best for: N > 50 particles
- Approximate force calculation (within 15% accuracy)
- Scales to thousands of particles

**Threshold Selection:**
- Default threshold: 50 particles
- Below threshold: Direct calculation (lower overhead)
- Above threshold: Quadtree (better asymptotic performance)

## Verification

All tests pass:
- Quadtree mode can be enabled/disabled
- Small N correctly uses direct calculation
- Large N correctly uses quadtree
- Force accuracy within acceptable tolerance
- No crashes or exceptions

## Files Modified

1. `systems/infinite_map/gravity_engine.py` - Added quadtree integration
2. `tests/test_gravity_engine_quadtree.py` - Fixed parameter bugs, added tests

## Next Steps

Per the original plan:
- Task 3: Performance benchmarking and optimization
- Task 4: Visual debugging tools for quadtree
- Task 5: Integration with Visual Shell compositor

## Usage Example

```python
from systems.infinite_map.gravity_engine import GravityEngine

# Create engine with quadtree enabled (default)
engine = GravityEngine(
    use_quadtree=True,
    quadtree_threshold=50,
    theta=0.5
)

# Add many particles - will automatically use quadtree
for i in range(1000):
    engine.add_orb(f"file_{i}.py", x, y, z, size=100)

# Update - automatically selects best algorithm
engine.update()
```

## Commit Message

```
feat(tectonic): integrate Barnes-Hut quadtree into GravityEngine

- Add use_quadtree, quadtree_threshold, theta parameters
- Implement _update_quadtree() for O(N log N) force calculation
- Route update() based on particle count threshold
- Use 2D spatial partitioning with 3D layer affinity
- Fix test parameter order bugs
- All tests passing

Performance: O(N^2) -> O(N log N) for N > 50 particles
Accuracy: Within 15% of direct calculation
```
