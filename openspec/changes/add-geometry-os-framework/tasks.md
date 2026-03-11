# Implementation Tasks: Geometry OS Framework

## Phase 1: Core Primitives (Week 1)
- [x] **Scaffold Package Structure**
    - [x] Create `geometry_os/` directory with `__init__.py`
    - [x] Create submodules: `core/`, `daemons/`, `rendering/`, `bridges/`, `cli/`
    - [x] Set up `pyproject.toml` with dependencies
- [x] **Extract RTS Asset Handling**
    - [x] Create `geometry_os/core/rts_asset.py`
    - [x] Consolidate PNG loading logic from `pixel_encoder.py`, `pixelrts_v2_converter.py`
    - [x] Implement unified metadata extraction (iTXt chunks)
    - [x] Add validation and error handling
    - [x] Write unit tests (>80% coverage)
- [x] **Extract Hybrid DNA Execution**
    - [x] Create `geometry_os/core/hybrid_dna.py`
    - [x] Consolidate code extraction from `test_hybrid_dna.py`
    - [x] Implement sandboxed execution environment
    - [x] Add custom API injection mechanism
    - [x] Write unit tests for execution safety
- [x] **Create Manifest Management**
    - [x] Create `geometry_os/core/manifest.py`
    - [x] Implement JSON-based brick registry
    - [x] Add hot-reload watching capabilities
    - [x] Write unit tests

## Phase 2: Daemon Architecture (Week 2)
- [x] **Create Base Daemon**
    - [x] Create `geometry_os/daemons/base.py`
    - [x] Implement `BaseDaemon` with lifecycle hooks (`on_start`, `on_brick`, `on_error`, `on_stop`)
    - [x] Add built-in queue management (thread-safe)
    - [x] Implement graceful shutdown and error recovery
    - [x] Add logging and telemetry hooks
    - [x] Write unit tests
- [x] **Refactor Infinite Builder**
    - [x] Migrate `systems/builder/infinite_builder.py` to use `BaseDaemon`
    - [x] Verify existing functionality preserved
    - [x] Run integration tests
- [x] **Refactor Evolution Daemon** (if exists)
    - [x] Migrate to `BaseDaemon`
    - [x] Verify neural evolution pipeline intact
    - [x] Run integration tests

## Phase 3: Rendering Abstractions (Week 3)
- [x] **Create Neural Terrain Interface**
    - [x] Create `geometry_os/rendering/neural_terrain.py`
    - [x] Abstract Rust FFI calls for terrain updates
    - [x] Implement manifest-based terrain loading
    - [x] Add texture streaming helpers
    - [x] Write unit tests
- [x] **Create Pixel Window Abstraction**
    - [x] Create `geometry_os/rendering/pixel_window.py`
    - [x] Abstract window creation (terminal, VM, custom)
    - [x] Implement style presets (CRT, neon, glassmorphic)
    - [x] Add text rendering utilities
    - [x] Write unit tests
- [x] **Organize Shader Library**
    - [x] Create `geometry_os/rendering/shaders/` directory
    - [x] Move common WGSL shaders (surface.wgsl, terrain.wgsl)
    - [x] Add shader loading utilities
    - [x] Document shader interfaces

## Phase 4: Bridge Utilities (Week 4)
- [x] **Create Rust FFI Helpers**
    - [x] Create `geometry_os/bridges/rust_ffi.py`
    - [x] Implement shared memory abstractions
    - [x] Add ctypes/cffi wrapper utilities
    - [x] Implement safe data serialization
    - [x] Write unit tests
- [x] **Create Unreal Bridge** (if needed)
    - [x] Create `geometry_os/bridges/unreal.py`
    - [x] Implement UE5 shared memory protocol
    - [x] Add heartbeat and state sync
    - [x] Write integration tests

## Phase 5: CLI Tools (Week 5)
- [x] **Create Morph CLI**
    - [x] Create `geometry_os/cli/morph.py`
    - [x] Implement "visual commit" workflow
    - [x] Add RTS asset diffing
    - [x] Integrate with OpenSpec
    - [x] Write CLI tests
- [x] **Create Development Tools**
    - [x] Add `geos-dev` command for common tasks
    - [x] Implement brick inspection tools
    - [x] Add performance profiling utilities

## Phase 6: Documentation & Polish (Week 6)
- [x] **Write Documentation**
    - [x] Create `geometry_os/README.md` with architecture overview
    - [x] Document each module with examples
    - [x] Create migration guide for existing code
    - [x] Add API reference
- [x] **Performance Validation**
    - [x] Run benchmarks: RTS loading overhead < 5%
    - [x] Run benchmarks: Rendering call overhead < 2%
    - [x] Profile memory usage
    - [x] Optimize hot paths if needed
- [x] **Structural Health Check**
    - [x] Run `systems/health/software_shm.py --check`
    - [x] Verify PAS score > 0.95
    - [x] Address any degradation
- [x] **OpenSpec Validation**
    - [x] Run `openspec validate add-geometry-os-framework --strict`
    - [x] Address any spec violations
    - [x] Update specs based on implementation learnings

## Phase 7: Archive & Deploy
- [x] **Final Integration Tests**
    - [x] Run full system test suite
    - [x] Verify all existing functionality preserved
    - [x] Test new framework features
- [x] **Archive Proposal**
    - [x] Run `openspec archive add-geometry-os-framework --yes`
    - [x] Update GEOMETRIC_OS_MASTER_INDEX.md
    - [x] Celebrate framework completion 🎉
