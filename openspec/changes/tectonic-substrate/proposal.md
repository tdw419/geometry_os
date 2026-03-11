# Proposal: Tectonic Substrate (The Pixel-First Kernel)

## ID: `tectonic-substrate`
**Type**: ARCHITECTURE CHANGE
**Status**: PROPOSED
**Driver**: Antigravity (AI)

## Context
Currently, Geometry OS visualizes the system by querying daemons, which query the kernel, which serializes data to JSON/Strings. This introduces latency ("The Observer Effect") and separation between the "Real State" and the "Visual State".

The user asks: "Is Antigravity RTS (PixelRTS) a good foundation?"
The answer is: It is the *only* foundation that allows the "UI to be the Computer".

## The Shift
We propose **inverting the kernel model**:
1.  **Current**: Kernel State -> Logs -> API -> Visualization
2.  **Proposed**: Kernel State -> **Shared Memory Texture** -> Visualization AND Execution

The `antigravity.pixelrts.png` (or `.dds` for larger systems) becomes the **primary executable state**.

## Core Concepts

### 1. The "State Texture" (The Map)
A 4096² RGBAf32 texture represents the entire machine state.
- **R (Red)**: Entity Health / Process Integrity
- **G (Green)**: Resource Allocation / Memory Pressure
- **B (Blue)**: I/O Throughput / Network Activity
- **A (Alpha)**: Lifecycle Phase (Birth -> Death)

### 2. The "Logic Shader" (The CPU)
Instead of iterating through lists of objects, a WGSL Compute Shader runs every frame.
It reads the State Texture, applies rules (Game of Life style, but for OS processes), and writes the Next State Texture.
- **Process Scheduling** = Shader moving a pixel from "Waiting Queue" region to "CPU Core" region.
- **Memory Allocation** = Shader finding a black (empty) pixel block and coloring it.

### 3. The "Glass Box" (AI Oversight)
The AI (`UnifiedCognitiveDaemon`) no longer polls APIs. It simply *looks* at the texture.
- **Anomaly Detection**: A CNN sees a "red cluster" (crashing service) and reacts in <16ms.
- **Optimization**: The AI "paints" optimization intents directly onto the map.

## Benefits
1.  **Zero-Latency Observability**: The screen *is* the memory.
2.  **Massive Parallelism**: GPU handles millions of processes (pixels) simultaneously.
3.  **Hilbert Consistency**: Data locality is visually obvious.
4.  **Aesthetic Alignment**: The OS looks like a living organism because it *is* simulated like one.

## Risks
1.  **Serialization Cost**: Moving non-visual data (strings) into/out of pixels is expensive.
    *   *Mitigation*: Use "Hybrid Bridge" where metadata stays in robust DBs (LanceDB), but *State/Flow* is purely pixel-based.
2.  **Precision**: Floats have precision limits.
    *   *Mitigation*: Use high-precision texture formats (R32G32B32A32_FLOAT) where needed.
