# Proposal: Connect SDK to Glass RAM (The Synaptic Bridge)

## Context
Geometry OS consists of two powerful but disconnected systems:
1.  **The "Brain"**: `geometry_sdk` (Python), handling AI logic, planning, and shell interactions.
2.  **The "Body"**: `infinite_map_rs` (Rust), handling high-performance Hilbert Curve visualization and Glass RAM.

Currently, the AI cannot "see" or "touch" the visual memory it inhabits. It can only emit text logs. This disconnect limits the "UI is the Computer" paradigm.

## Change Description
This proposal establishes a high-performance **Inter-Process Communication (IPC) Bridge** between the two systems. It introduces a `visual` module to the SDK, enabling Python scripts (and Agent Zero) to programmatically allocate, color, and animate 3D memory structures in the Glass RAM compositor.

## Impact
- **Agent Agency**: Agent Zero can visualize its thought process in real-time.
- **Developer Experience**: Users can script 3D visualizations using familiar Python.
- **Performance**: Uses Shared Memory (SHM) ring buffers for near-zero latency (<1ms).

## Risk Assessment
- **Concurrency**: Writing to shared ring buffers requires careful synchronization (using atomics/mutexes) to avoid tearing.
- **PAS Score**: Adding an IPC thread might impact frame timing if not handled asynchronously.

## Visual Metaphor
"Synapses connecting the Neural Net to the Geometric Cortex."
