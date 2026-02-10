# PixelRTS Execution System Improvement Roadmap

**Version:** 1.0
**Date:** 2026-02-10
**Status:** Active
**Focus:** Improving wasmrun.py, GPU execution bridge, and PixelRTS v2 cartridge handling

---

## Executive Summary

This roadmap addresses critical improvements to the PixelRTS execution system, building on the recent fixes to wasmrun.py, GPU shader errors, and cartridge metadata handling. The goal is to create a production-ready WASM execution environment on GPU with support for both standard and code-mode PixelRTS v2 cartridges.

### Current Status (2026-02-10)
- ✅ Phase 1: Core Execution Engine COMPLETED
- ✅ GPU shader atomic operation errors fixed
- ✅ Sidecar metadata loading fixed
- ✅ WASM export parsing working
- ✅ Basic function execution working
- ✅ Code-mode cartridge decoding complete (semantic decode_rgba)
- ✅ Memory management complete (bounds checking, snapshot/restore)
- ⚠️ Mock mode fallback when GPU unavailable
- ❌ No parallel execution support (Phase 2)
- ❌ Limited host function implementations (Phase 2)

---

## Vision

Create a high-performance, GPU-accelerated WASM execution engine for PixelRTS cartridges that supports:
- Full WASM MVP specification on GPU
- Both standard and semantic code-mode cartridges
- Parallel execution across multiple cartridges
- Rich host functions for spatial operations
- Hot-reloading and debugging support

---

## Success Metrics

1. **Performance:** Execute simple WASM functions in <1ms on GPU
2. **Compatibility:** Support 100% of WASM MVP opcodes
3. **Cartridge Support:** Handle both standard and code-mode PixelRTS v2
4. **Developer Experience:** Single-command cartridge execution
5. **Reliability:** <5% GPU fallback rate on supported hardware

---

## Phase 1: Core Execution Engine (Week 1)
**Status:** ✅ COMPLETED (2026-02-10)

### 1.1 Complete WASM MVP Implementation
**Priority:** HIGH | **Status:** ✅ COMPLETED

**Tasks:**
- [x] Implement remaining missing opcodes (i64, f32, f64)
- [x] Fix floating-point operations (OP_F32_* , OP_F64_*)
- [x] Add proper trapping for unreachable/div-by-zero
- [x] Implement br_table instruction
- [x] Add call_indirect with type checking

**Acceptance Criteria:**
- [x] All WASM MVP opcodes implemented
- [x] Spec test suite passes >90%
- [x] No shader validation errors

**Dependencies:** None

---

### 1.2 Code-Mode Cartridge Support
**Priority:** HIGH | **Status:** ✅ COMPLETED

**Tasks:**
- [x] Implement semantic decoding from RGBA to raw WASM
- [x] Create WASMCodeVisualizer with encode/decode symmetry
- [x] Add automatic mode detection (standard vs code)
- [x] Validate code-mode cartridges with test suite

**Acceptance Criteria:**
- [x] Code-mode cartridges decode correctly
- [x] Original WASM recovered from semantic encoding
- [x] Mode detection works automatically

**Dependencies:** PixelRTS v2 encoder updates

---

### 1.3 Memory Management
**Priority:** MEDIUM | **Status:** ✅ COMPLETED

**Tasks:**
- [x] Implement memory.grow with proper limits
- [x] Add memory bounds checking on all loads/stores
- [x] Support multiple memory pages (up to 4GB)
- [x] Add memory snapshot/restore for debugging

**Acceptance Criteria:**
- [x] memory.grow works correctly
- [x] Out-of-bounds access traps properly
- [x] Memory usage tracked and reported

**Dependencies:** None

---

## Phase 2: Host Functions & FFI (Week 2)

### 2.1 Spatial Operations
**Priority:** HIGH | **Status:** PENDING

**Tasks:**
- [ ] Complete read_region implementation
- [ ] Complete write_region implementation
- [ ] Add get_dimensions host function
- [ ] Implement texture sampling operations
- [ ] Add coordinate transformation functions

**Acceptance Criteria:**
- All declared host functions work
- Texture data correctly read/written
- Coordinate transformations accurate

**Dependencies:** Phase 1 complete

---

### 2.2 Math & Utility Functions
**Priority:** MEDIUM | **Status:** PENDING

**Tasks:**
- [ ] Implement sqrt, sin, cos, tan
- [ ] Add exp, log, pow functions
- [ ] Implement random number generation
- [ ] Add min/max/clamp functions
- [ ] Implement vector operations (vec2, vec3, vec4)

**Acceptance Criteria:**
- All math functions match WASM spec
- Accuracy within 1 ULP for most operations
- Random produces quality distribution

**Dependencies:** Phase 1 complete

---

### 2.3 File & Console I/O
**Priority:** LOW | **Status:** PENDING

**Tasks:**
- [ ] Add print/host.log function
- [ ] Implement file read/write operations
- [ ] Add environment variable access
- [ ] Create console I/O bridge

**Acceptance Criteria:**
- Console output captured and displayed
- File operations work within sandbox
- Environment access controlled

**Dependencies:** Phase 1 complete

---

## Phase 3: Developer Experience (Week 3)

### 3.1 Command-Line Interface
**Priority:** HIGH | **Status:** PENDING

**Tasks:**
- [ ] Add --verbose flag for detailed output
- [ ] Implement --disassemble for WASM inspection
- [ ] Add --debug flag for execution tracing
- [ ] Create --benchmark mode for performance testing
- [ ] Add --watch for hot-reload development

**Acceptance Criteria:**
- All flags work as documented
- Output is clear and actionable
- Hot-reload works in <100ms

**Dependencies:** Phase 2 complete

---

### 3.2 Testing Framework
**Priority:** MEDIUM | **Status:** PENDING

**Tasks:**
- [ ] Create WASM test suite generator
- [ ] Add property-based testing
- [ ] Implement fuzzing for opcode edge cases
- [ ] Create integration test suite
- [ ] Add performance regression tests

**Acceptance Criteria:**
- Test suite covers all opcodes
- Fuzzing finds no crashes
- Performance tests detect regressions

**Dependencies:** Phase 2 complete

---

### 3.3 Documentation
**Priority:** MEDIUM | **Status:** PENDING

**Tasks:**
- [ ] Write API reference for host functions
- [ ] Create cartridge creation tutorial
- [ ] Document troubleshooting steps
- [ ] Add video demonstrations
- [ ] Create example cartridges

**Acceptance Criteria:**
- All APIs documented
- Tutorial produces working cartridge
- Common issues have solutions

**Dependencies:** Phase 1 complete

---

## Phase 4: Performance & Optimization (Week 4)

### 4.1 Parallel Execution
**Priority:** HIGH | **Status:** PENDING

**Tasks:**
- [ ] Implement multi-workgroup execution
- [ ] Add workgroup synchronization primitives
- [ ] Create thread-safe memory access patterns
- [ ] Implement parallel function calls
- [ ] Add workload balancing

**Acceptance Criteria:**
- Multiple cartridges execute in parallel
- No race conditions in tests
- Performance scales with GPU cores

**Dependencies:** Phase 1 complete

---

### 4.2 Caching & Optimization
**Priority:** MEDIUM | **Status:** PENDING

**Tasks:**
- [ ] Add bytecode compilation cache
- [ ] Implement GPU pipeline caching
- [ ] Create function call inlining
- [ ] Add constant folding optimizations
- [ ] Implement dead code elimination

**Acceptance Criteria:**
- Cold start <100ms
- Warm start <10ms
- Cached execution <1ms

**Dependencies:** Phase 3 complete

---

### 4.3 Resource Management
**Priority:** MEDIUM | **Status:** PENDING

**Tasks:**
- [ ] Implement automatic resource cleanup
- [ ] Add memory pool management
- [ ] Create texture streaming for large cartridges
- [ ] Implement GPU memory limits
- [ ] Add usage monitoring

**Acceptance Criteria:**
- No memory leaks in long-running sessions
- GPU memory usage stays within limits
- Large cartridges stream efficiently

**Dependencies:** Phase 1 complete

---

## Phase 5: Advanced Features (Future)

### 5.1 Debugging Support
- [ ] Interactive debugger with breakpoints
- [ ] Memory inspection and modification
- [ ] Call stack visualization
- [ ] Variable watch window
- [ ] Step-through execution

### 5.2 Security & Sandboxing
- [ ] Capability-based security model
- [ ] Resource quotas per cartridge
- [ ] Cryptographic signing
- [ ] Secure host function APIs
- [ ] Audit logging

### 5.3 Ecosystem Integration
- [ ] VS Code extension
- [ ] Language bindings (Python, Rust)
- [ ] Package manager
- [ ] CI/CD integration
- [ ] Cloud deployment support

---

## Risk Mitigation

| Risk | Impact | Mitigation |
|------|--------|------------|
| GPU driver bugs | HIGH | Comprehensive mock mode fallback |
| WGSL spec changes | MEDIUM | Version-specific shader variants |
| Performance regression | MEDIUM | Continuous benchmarking |
| Cartridge format drift | LOW | Strict validation and versioning |

---

## Dependencies

**Internal:**
- PixelRTS v2 encoder/decoder
- WGSL shader compiler
- WGPU-Py bindings

**External:**
- Stable GPU drivers (Intel/AMD/NVIDIA)
- WGSL language spec stability
- WASM test suite availability

---

## Timeline

```
Week 1: Phase 1 - Core Execution Engine
Week 2: Phase 2 - Host Functions & FFI
Week 3: Phase 3 - Developer Experience
Week 4: Phase 4 - Performance & Optimization
Future: Phase 5 - Advanced Features
```

---

## Open Questions

1. Should we support WASM proposals beyond MVP (e.g., SIMD, threads)?
2. How do we handle GPU memory fragmentation?
3. What's the strategy for mobile GPU support?
4. Should we create a custom cartridge format for optimization?

---

## Next Steps

1. Review and prioritize tasks with team
2. Set up CI/CD for automated testing
3. Create initial set of example cartridges
4. Begin implementation of Phase 1.1 (Complete WASM MVP)

---

**Last Updated:** 2026-02-10
**Status:** Ready for Implementation
**Owner:** PixelRTS Team
