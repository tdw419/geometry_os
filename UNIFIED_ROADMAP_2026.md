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
- **BuilderPanel**: Floating UI with Tile Palette, Shader Editor, Cartridge Rack.
- **Tools**: `builder_place_tile`, `builder_load_shader`, `builder_assemble_cartridge`.
- **Outcome:** The AI can now "draw" the computer it wants to run.

### Phase E: WebMCP Reliability & Error Handling (Priority: HIGH)
**Goal:** Improve error handling, graceful degradation, and recovery for autonomous execution.
- **Critical for Phase H**: Autonomous executor relies on WebMCP bridge; reliability features prevent failures during complex 50-step hypervisor builds.

#### E.1 Circuit Breaker Pattern
**Description:** Add circuit breaker for WebSocket and HTTP backends.
- **Task E.1.1**: Implement circuit breaker state machine
- **Task E.1.2**: Add half-open state for recovery testing
- **Task E.1.3**: Add configurable thresholds
- **Task E.1.4**: Add circuit breaker metrics

**Success Criteria:**
- Circuit breaker trips after 5 consecutive failures
- Half-open state allows recovery testing
- Metrics track open/half-open/closed duration

**File:** `systems/visual_shell/web/webmcp_bridge.js` (+100 lines)

#### E.2 Retry with Exponential Backoff
**Description:** Implement retry logic with exponential backoff for transient failures.
- **Task E.2.1**: Add retry wrapper function
- **Task E.2.2**: Implement exponential backoff calculation
- **Task E.2.3**: Add jitter to prevent thundering herd
- **Task E.2.4**: Configure per-tool retry settings

**Success Criteria:**
- Transient failures automatically retried
- Backoff prevents backend overload
- Configurable max retries and delays

**File:** `systems/visual_shell/web/webmcp_bridge.js` (+80 lines)

#### E.3 Health Monitoring
**Description:** Add health monitoring for backend connections.
- **Task E.3.1**: Add health check endpoint polling
- **Task E.3.2**: Add connection status tracking
- **Task E.3.3**: Add health status to `get_os_state`
- **Task E.3.4**: Add health event notifications

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
| 1.1 Hypervisor Core | WASM emulator compilation (v86/RISC-V) | Pending |
| 1.2 Disk Conversion | Convert Alpine ISO to `.rts.png` | Pending |
| 1.3 Builder Recipe | AI instructions to assemble the cartridge | Pending |
| 1.4 WebMCP Tools | Input injection & screen reading | Pending |

### Milestone 2: WASM GPU Execution Complete (Week 5)

**Goal:** Complete the WASM GPU execution bridge for running code on GPU.

| Task | Owner | Status |
|------|-------|--------|
| 2.1 GPU Memory Management | Unassigned | Pending |
| 2.2 Function Call Convention | Unassigned | Pending |
| 2.3 GPU Dispatch & Execution | Unassigned | Pending |

---

## Q2 2026: GPU Acceleration & Scale

### Milestone 3: GPU Pattern Detection (Week 6-8)

**Goal:** Accelerate pattern detection using GPU compute.

- **PyTorch Integration**: GPU tensor infrastructure.
- **Sobel/Fourier Kernels**: 10× speedup for image analysis.
- **Batch Processing**: Parallel analysis of 100+ images.

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
│  │  │ (WASM)   │   │ (Pixels)│   │ (Canvas)│   │  (A2A)  │    │  │
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
5.  **Inspection**: `query_hilbert_address`, `linux_read_screen` (Planned)

---

## Risk Management

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Browser Constraints | High | Medium | WASM/WebGPU optimizations |
| Security | Medium | Critical | WebMCP permission model |
| Performance | Medium | High | GPU acceleration (Phase 2) |

---

**Next Steps:**
1.  ✅ **Phase F (Visual Builder)** - Completed.
2.  🛡️ **Phase E (Reliability)** - Implement circuit breaker, retry logic, and health monitoring (CRITICAL for Phase H).
3.  � **Phase H (Linux Hypervisor)** - Begin implementation of WASM core (requires Phase E).
4.  🔄 **GPU Bridge** - Resume concurrent development.
