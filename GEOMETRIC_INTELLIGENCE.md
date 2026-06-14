# Geometric Intelligence: The Unified Substrate

This document defines the architectural convergence of Geometry OS as of May 25, 2026. The system operates as a three-layer stack where memory, reasoning, and execution are unified through a visual, spatial substrate.

## 1. Layer 1: Long-term Spatial Memory
The project's memory is no longer a flat file, but a **Spatial Palace** rendered directly in the GeOS environment.
- **Organization:** 24+ facts categorized into concentric rings:
    - **Inner (r=30):** Critical/Actionable facts (Red).
    - **Mid (r=70):** Important/Structural facts (Green).
    - **Outer (r=120):** Reference/Design principles (Blue).
- **Format:** Binary-compiled (`memory_palace.dat`) for high-speed loading into GeOS VM memory.
- **Visualization:** `programs/memory_palace.asm` provides a neural-reality map of the project's long-term state.

## 2. Layer 2: Semantic Reasoning (Ollama Bridge)
A local Ollama instance (qwen2.5-coder:14b) performs cross-ring semantic analysis.
- **Function:** Identifies conceptual clusters (e.g., "Autonomous Recovery," "Total Observability") that span multiple rings.
- **Bridge:** Connects high-level design principles (Outer Ring) to low-level implementation success/failure data (Inner Ring).

## 3. Layer 3: Active Execution (Substrate Coprocessor)
Direct manipulation of the GPU-native cellular substrate via the RISC-V MMIO bridge at `0x4000_0000`.
- **Logic Primitive:** "Pixels Move Pixels." Logic is not symbolic code, but spatial patterns of neurons, synapses, and turner gates.
- **Validation (VCC):** The Visual Consistency Contract ensures structural health. Every substrate modification is followed by a VCC SHA256 hash check to ensure the "Ground Truth" of the GPU memory.
- **Verified Circuits:**
    - XOR Gate (Neural implementation).
    - Fibonacci Register (Spatial buffer).
    - (Planned) 1-bit Full Adder.

## 4. The Neural-Reality Loop
1. **Recall:** Load facts from the Spatial Palace.
2. **Analyze:** Ollama identifies the required circuit/pattern.
3. **Execute:** MMIO Bridge loads and fires the circuit on the GPU.
4. **Verify:** VCC Validation confirms the spatial state.

**Status:** STABLE. The screen is the hard drive. Navigation is spatial. Computation is geometric.
