# Geometry OS & Pixel RTS - Unified Development Roadmap 2026

> **Last Updated:** 2026-02-13
> **Branch:** `master`
> **Vision:** "The Screen is the Hard Drive — and the AI is the Operator."

---

## Executive Summary

The project has evolved beyond a file format (PixelRTS) into a **visually programmable operating system**. The primary development interface is now **WebMCP**, allowing AI agents to interact with the OS through the visual shell, effectively "using the OS to build the OS".

### Current State Overview (February 2026)

| Component | Status | Completion | Priority | Next Milestone |
|-----------|--------|------------|----------|----------------|
| **WebMCP Bridge** | Production | 100% | P0 | Linux Hypervisor |
| **Visual Builder (Phase F)** | Production | 100% | P0 | Hypervisor Cartridges |
| **A2A Protocol** | Production | 100% | P0 | Multi-Agent Coordination |
| **PixelRTS v2 Format** | Production | 100% | P1 | Adoption & Tooling |
| **WASM Execution Bridge** | Active Dev | 70% | P1 | GPU completion |
| **Unified OS Artifact** | Complete | 100% | P1 | Maintain & Evolve |

### Key Achievements (Latest)

- ✅ **WebMCP Integration**: Full bridge enabling AI control of the Visual Shell (Phase A & B).
- ✅ **AI Visual Builder**: A UI panel and toolset for AI to visually construct the OS (Phase F).
- ✅ **A2A Protocol**: Area Agents can now discover and message each other via WebSocket.
- ✅ **Unified Single-File OS**: Kernel, initrd, and neural substrates in one `geometry_os_unified_neural.rts.png`.

---

## The New Paradigm: WebMCP

We have shifted from "CLI tooling" to **Visual AI Control**. The AI no longer just writes code; it **operates the GUI** to build the system.

### Phase F: AI-Driven Visual Builder (Completed)
**Goal:** Enable AI agents to visually construct Geometry OS by placing tiles.
- [x] **BuilderPanel**: Floating UI with Tile Palette, Shader Editor, Cartridge Rack.
- **Tools**: `builder_place_tile`, `builder_load_shader`, `builder_assemble_cartridge`.
- **Outcome:** The AI can now "draw" the computer it wants to run.

### Phase E: WebMCP Reliability & Error Handling (Priority: HIGH)
**Goal:** Improve error handling, graceful degradation, and recovery for autonomous execution.
- **Critical for Phase H**: Autonomous executor relies on WebMCP bridge; reliability features prevent failures during complex 50-step hypervisor builds.

#### E.1 Circuit Breaker Pattern
**Description:** Add circuit breaker for WebSocket and HTTP backends.
- [x] **Task E.1.1**: Implement circuit breaker state machine
- [x] **Task E.1.2**: Add half-open state for recovery testing
- [x] **Task E.1.3**: Add configurable thresholds
- [x] **Task E.1.4**: Add circuit breaker metrics

**Success Criteria:**
- Circuit breaker trips after 5 consecutive failures
- Half-open state allows recovery testing
- Metrics track open/half-open/closed duration

**File:** `systems/visual_shell/web/webmcp_bridge.js` (+100 lines)

#### E.2 Retry with Exponential Backoff
**Description:** Implement retry logic with exponential backoff for transient failures.
- [x] **Task E.2.1**: Add retry wrapper function
- [x] **Task E.2.2**: Implement exponential backoff calculation
- [x] **Task E.2.3**: Add jitter to prevent thundering herd
- [x] **Task E.2.4**: Configure per-tool retry settings

**Success Criteria:**
- Transient failures automatically retried
- Backoff prevents backend overload
- Configurable max retries and delays

**File:** `systems/visual_shell/web/webmcp_bridge.js` (+80 lines)

#### E.3 Health Monitoring
**Description:** Add health monitoring for backend connections.
- [x] **Task E.3.1**: Add health check endpoint polling
- [x] **Task E.3.2**: Add connection status tracking
- [x] **Task E.3.3**: Add health status to `get_os_state`
- [x] **Task E.3.4**: Add health event notifications

**Success Criteria:**
- Health status tracked for all backends
- `get_os_state` includes health information
- Unhealthy backends trigger events

**File:** `systems/visual_shell/web/webmcp_bridge.js` (+100 lines)

**Dependencies:** Phase D (A2A Protocol) - Complete

---

### Phase H: PixelRTS Linux Hypervisor (Q1 2026)
**Goal:** Run a full Linux VM on the Infinite Map using the Visual Builder.
- **Concept:** Assemble a "Computer Cartridge" using:
    - **Processor Tile**: WASM-based RISC-V/x86 emulator core.
    - **Memory Tile**: Linux disk image converted to PixelRTS.
    - **Display Tile**: Framebuffer rendering target.
- **AI Control**: WebMCP tools (`linux_send_input`, `linux_read_screen`) allow the AI to operate the Linux GUI as if sitting at the console.

---

## Q1 2026: Execution & Integration

### Milestone 1: Linux Hypervisor (Week 3-4)

**Goal:** Boot Alpine Linux on the Infinite Map via WebMCP.

| Task | Description | Status |
|------|-------------|--------|
| 1.1 Hypervisor Core | WASM emulator compilation (v86/RISC-V) | [x] Complete |
| 1.2 Disk Conversion | Convert Alpine ISO to `.rts.png` | [x] Complete |
| 1.3 Builder Recipe | AI instructions to assemble the cartridge | [x] Complete |
| 1.4 WebMCP Tools | Input injection & screen reading | [x] Complete |

### Milestone 2: WASM GPU Execution Complete (Week 5)

**Goal:** Complete the WASM GPU execution bridge for running code on GPU.
**Plan:** `ai_project_management/MILESTONE_2_EXECUTION_PLAN.md` - **COMPLETE**

| Task | Owner | Status |
|------|-------|--------|
| 2.1 GPU Memory Management | AI Executor | [x] Complete |
| 2.2 Function Call Convention | AI Executor | [x] Complete |
| 2.3 GPU Dispatch & Execution | AI Executor | [x] Complete |

---

## Q2 2026: GPU Acceleration & Scale

### Milestone 3: GPU Pattern Detection (Week 6-8)

**Goal:** Accelerate pattern detection using GPU compute.
**Plan:** `ai_project_management/MILESTONE_3_EXECUTION_PLAN.md` - **COMPLETE**

| Task | Owner | Status |
|------|-------|--------|
| 3.1 GPU Tensor Infrastructure | AI Executor | [x] Complete |
| 3.2 Compute Kernels (Sobel) | AI Executor | [x] Complete |
| 3.3 Batch Pattern Detector | AI Executor | [x] Complete |
| 3.4 Feature Extraction | AI Executor | [x] Complete |

---

### Milestone 4: Safety & Evolution (Week 8-10)

**Goal:** Implement self-modifying code safety protocols.
**Plan:** `ai_project_management/MILESTONE_4_EXECUTION_PLAN.md` - **COMPLETE**

| Task | Owner | Status |
|------|-------|--------|
| 4.1 Evolution Sandbox | AI Executor | [x] Complete |
| 4.2 Mutation Guards | AI Executor | [x] Complete |
| 4.3 Rollback Manager | AI Executor | [x] Complete |
| 4.4 Fitness Validator | AI Executor | [x] Complete |

---

### Phase I: Production Hardening (Week 11-12)

**Goal:** Implement comprehensive security, validation, and performance limits.
**Plan:** `ai_project_management/MILESTONE_PHASE_I_EXECUTION_PLAN.md` - **COMPLETE**

| Task | Owner | Status |
|------|-------|--------|
| I.1 Input Validation Framework | AI Executor | [x] Complete |
| I.2 Rate Limiting | AI Executor | [x] Complete |
| I.3 Production Metrics | AI Executor | [x] Complete |

---

### Experiment: AI Evolution (Week 13)

**Goal:** Demonstrate autonomous code optimization with safety rails.
**Plan:** `ai_project_management/AI_EVOLUTION_EXPERIMENT_PLAN.md`

| Task | Owner | Status |
|------|-------|--------|
| Exp.1 Target Function Setup | AI Executor | [x] Complete |
| Exp.2 Evolution Loop Agent | AI Executor | [x] Complete |
| Exp.3 Evolution Visualization | AI Executor | [x] Complete |

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                    Geometry OS (WebMCP Era)                      │
│      "The Screen is the Hard Drive — and the API Surface"        │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌───────────────┐       ┌───────────────────────────────┐      │
│  │   AI Agent    │◀─────▶│        WebMCP Bridge          │      │
│  │  (Operator)   │ JSON  │   (systems/visual_shell/web)  │      │
│  └───────────────┘       └───────────────┬───────────────┘      │
│          ▲                               │                      │
│          │ Tool Calls                    │ UI Events            │
│          │                               ▼                      │
│  ┌───────┴───────┐       ┌───────────────────────────────┐      │
│  │  Builder UI   │◀─────▶│         Visual Shell          │      │
│  │   (Phase F)   │       │       (PixiJS + WebGPU)       │      │
│  └───────┬───────┘       └───────────────┬───────────────┘      │
│          │                               │                      │
│          ▼                               ▼                      │
│  ┌───────────────────────────────────────────────────────────┐  │
│  │                  Infinite Map (The World)                 │  │
│  │  ┌─────────┐   ┌─────────┐   ┌─────────┐   ┌─────────┐    │  │
│  │  │ Processor│   │  Memory │   │ Display │   │ Network │    │  │
│  │  │ (WGPU/WASM) |   │ (Pixels)│   │ (Canvas)│   │  (A2A)  │    │  │
│  │  └─────────┘   └─────────┘   └─────────┘   └─────────┘    │  │
│  └───────────────────────────────────────────────────────────┘  │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## WebMCP Toolset (Operational)

The AI now has direct control over the OS through these licensed tools:

1.  **Navigation**: `navigate_map`, `get_os_state`
2.  **Execution**: `execute_pixel_program`, `trigger_evolution`
3.  **Creation**: `builder_place_tile`, `builder_assemble_cartridge`
4.  **Integration**: `spawn_area_agent`, `send_llm_prompt`
5.  **Hypervisor**: `hypervisor_boot`, `hypervisor_input`, `hypervisor_frame`

---

## Risk Management

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Browser Constraints | High | Medium | WASM/WebGPU optimizations |
| Security | Medium | Critical | WebMCP permission model |
| Performance | Medium | High | GPU acceleration (Phase 2) |

---

**Next Steps (Phase J: Scale & Optimization):**
1.  🧪 **Scale Testing**: Spin up multiple A2A agents to stress-test protocol.
2.  🧠 **Complex Application**: Build "Neural IDE" using Visual Builder. ✅ **COMPLETE**
3.  ⚡ **GPU Optimization**: Push WASM-to-WebGPU bridge to 10x performance.

---

### Phase J.2: Neural IDE ✅ COMPLETE

**Completed:** 2026-02-14

**Deliverables:**
- `ide_tile_types.js` - 6 IDE tile types with semantic tags
- `tile_connections.js` - TileConnectionManager with 4 connection types
- `builder_connect_tiles` WebMCP tool for AI-driven connections
- `builder_remove_connection` WebMCP tool
- `ide_get_state` WebMCP tool for full IDE state
- `test_neural_ide_builder.html` - Full AI assembly demo

**Demonstrated:** AI agent can assemble a functional IDE on the Infinite Map using WebMCP tools without writing code. The demo shows 10 steps: placing 4 tiles, connecting 3 wires, and verifying assembly in <1 second.

