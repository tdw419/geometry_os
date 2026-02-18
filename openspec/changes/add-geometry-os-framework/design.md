# Design: Geometry OS Framework

## Principles
1. **Intentional Minimalism**: Only abstract proven patterns - avoid speculative generalization
2. **Zero Visual Overhead**: Framework must not add latency to rendering critical paths
3. **PixelRTS Native**: All components must be compatible with `.rts.png` asset format
4. **Daemon Composability**: Daemons should be able to chain and communicate seamlessly
5. **OpenSpec Integrated**: Framework changes follow spec-first development workflow
6. **Structural Health**: Design decisions must maintain Phase Alignment Stability (PAS > 0.95)

## Visual Language
- **Aesthetics**: Framework is invisible to end users - focus on developer ergonomics
- **Code Style**: Clean, typed Python with comprehensive docstrings
- **Error Messages**: Clear, actionable, with suggested fixes
- **Logging**: Structured JSON logs for machine parsing, human-readable console output

## Technical Architecture

### Package Structure
```
geometry_os/
├── __init__.py              # Package exports
├── core/
│   ├── __init__.py
│   ├── rts_asset.py         # Unified .rts.png handling
│   ├── hybrid_dna.py        # Code extraction/execution
│   ├── manifest.py          # Map/brick registry
│   └── substrate.py         # Visual computation primitives
├── daemons/
│   ├── __init__.py
│   ├── base.py              # BaseDaemon with queue/lifecycle
│   ├── builder.py           # Infinite Builder (refactored)
│   └── evolution.py         # Neural evolution daemon
├── rendering/
│   ├── __init__.py
│   ├── neural_terrain.py    # Rust bridge for terrain
│   ├── pixel_window.py      # Window/console abstraction
│   └── shaders/             # WGSL shader library
│       ├── surface.wgsl
│       ├── terrain.wgsl
│       └── compute.wgsl
├── bridges/
│   ├── __init__.py
│   ├── rust_ffi.py          # Shared memory/FFI helpers
│   └── unreal.py            # UE5 integration
└── cli/
    ├── __init__.py
    └── morph.py             # Visual commit CLI
```

### Core API Design

#### RtsAsset (Unified Asset Handling)
```python
from geometry_os.core import RtsAsset

# Load with automatic metadata extraction
asset = RtsAsset.load("map.rts.png")

# Access properties
width, height = asset.dimensions
texture_data = asset.texture  # numpy array
metadata = asset.metadata     # dict from iTXt chunks

# Extract Hybrid DNA
code = asset.extract_dna()
if code:
    result = code.execute(
        sandbox=True,
        api={"spawn_brick": custom_spawn, "deploy_to_map": custom_deploy}
    )
```

#### BaseDaemon (Standardized Daemon Architecture)
```python
from geometry_os.daemons import BaseDaemon, BrickQueue

class MyDaemon(BaseDaemon):
    def on_start(self):
        """Called once when daemon starts"""
        self.log.info("Daemon initialized")
    
    def on_brick(self, brick: RtsAsset):
        """Called for each brick in queue"""
        code = brick.extract_dna()
        result = code.execute(sandbox=True)
        return result
    
    def on_error(self, error: Exception, brick: RtsAsset):
        """Called when brick processing fails"""
        self.log.error(f"Failed to process {brick.path}: {error}")
        # Return True to continue, False to stop daemon
        return True
    
    def on_stop(self):
        """Called once when daemon stops"""
        self.cleanup()

# Usage
daemon = MyDaemon(queue_path="bricks/queue")
daemon.start()  # Runs in background
```

#### NeuralTerrain (Rendering Abstraction)
```python
from geometry_os.rendering import NeuralTerrain

# Load from manifest
terrain = NeuralTerrain.from_manifest("manifest.json")

# Update terrain with new brick
terrain.add_brick(position=(0, 0), asset=brick)

# Stream to Rust compositor
terrain.sync()  # Updates shared memory
```

#### PixelWindow (Window/Console Abstraction)
```python
from geometry_os.rendering import PixelWindow

# Create terminal window with CRT style
console = PixelWindow.create_terminal(
    title="Neural Console",
    style="crt_cyan",
    dimensions=(800, 600)
)

# Write text
console.write(">>> System initialized\n")

# Render to texture
texture = console.render()  # Returns numpy array for compositor
```

## Impact Analysis

### Geometric Integrity
- **PAS Score**: Target > 0.95 (framework should improve consistency)
- **Symmetry**: High (unified patterns across all subsystems)
- **Complexity**: Medium (abstractions hide complexity without adding bloat)

### Performance Characteristics
- **RTS Loading**: Framework overhead < 5% vs. direct implementation
- **Rendering Calls**: Overhead < 2% (direct pass-through for hot paths)
- **Memory**: Shared memory for large textures (zero-copy where possible)
- **Daemon Startup**: < 100ms initialization time

### Developer Experience
- **Learning Curve**: 30 minutes to understand core APIs
- **New Daemon Creation**: 20 minutes (down from 2 hours)
- **Code Reduction**: ~40% less boilerplate for common tasks
- **Error Debugging**: Structured logs with context

## Migration Strategy

### Phase 1: Core Extraction (Non-Breaking)
- Extract `RtsAsset`, `HybridDNA`, `Manifest` into framework
- Keep existing code functional
- Add framework as alternative import path

### Phase 2: Daemon Refactoring (Breaking for Daemons)
- Migrate `infinite_builder.py` to use `BaseDaemon`
- Migrate other daemons incrementally
- Deprecate old daemon implementations

### Phase 3: Rendering Unification (Breaking for Renderers)
- Abstract Rust FFI calls into `NeuralTerrain`
- Migrate window management to `PixelWindow`
- Update compositor integration

### Phase 4: Bridge Consolidation (Non-Breaking)
- Extract shared memory helpers
- Consolidate FFI patterns
- Add Unreal bridge if needed

### Phase 5: CLI Tools (Additive)
- Add `morph` CLI for visual commits
- Add development utilities
- No breaking changes

## Validation Criteria

### Functional Requirements
- [ ] All existing integration tests pass
- [ ] New framework tests achieve >80% coverage
- [ ] Example daemons run successfully

### Performance Requirements
- [ ] RTS loading benchmark: < 5% overhead
- [ ] Rendering call benchmark: < 2% overhead
- [ ] Memory usage: No significant increase

### Structural Health Requirements
- [ ] PAS score > 0.95
- [ ] No architectural regressions
- [ ] Clean dependency graph (no circular imports)

### Developer Experience Requirements
- [ ] Complete API documentation
- [ ] Migration guide with examples
- [ ] Clear error messages with actionable fixes

## Mockup Description
The framework itself has no visual representation - it's pure infrastructure. However, the developer experience should feel like:
- **Clean imports**: `from geometry_os.core import RtsAsset`
- **Intuitive APIs**: Method names match domain language
- **Helpful errors**: "RtsAsset.load() failed: PNG missing RTS_Logic chunk. Did you mean to use RtsAsset.create()?"
- **Fast feedback**: Framework operations complete in milliseconds
