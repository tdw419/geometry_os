# Design: Synaptic Map Integration

## Visual/Geometric Impact Analysis
The Synaptic Map Integration transforms the OS from a passive observer to an active, intent-driven substrate. 

### 1. The Intent Overlay (The "Synaptic Breach")
- **Morphology**: A semi-transparent glass brick that floats at a fixed Z-depth in front of the camera.
- **Aesthetic**: Uses "Crystalline Frost" (hex: #A0D0FF) for borders. Text is rendered using Hilbert-mapped glyphs to maintain geometric consistency with the rest of the OS.
- **Micro-animation**: Pulsates in sync with the `CognitiveState.arousal` metric. High arousal = faster, sharper pulses.

### 2. Semantic Navigation (Motion)
- **Physics**: Camera movement triggered by intent uses "Non-Euclidean Damping". Instead of a linear slide, the camera "folds" through coordinates, briefly increasing transparency/blur to simulate spatial warping.
- **Integrity**: Ensures the camera always settles on a 4096-aligned boundary to maintain PixelRTS v2 compatibility.

### 3. Shader Re-alignment (Synthesis)
- **Mechanism**: The LLM output modifies the `Entropy` and `Chaos` uniforms in the `grid.wgsl` and `memory_artifacts.wgsl` shaders.
- **Outcome**: A "Crystallize" command will clamp the `noise_value` and increase `edge_glow` sharpness, visually "fixing" the map's texture.

## Phase Alignment Stability (PAS) Scan
- **Performance (P)**: Expected shift: -0.05. LLM processing is asynchronous (external Daemon), but overlay rendering adds raw vertex load.
- **Aesthetic (A)**: Expected shift: +0.15. Direct semantic control over visual entropy allows the user (and the machine) to maintain a higher aesthetic order.
- **System (S)**: Expected shift: +0.10. Semantic navigation increases the reliability of memory introspection.

**Predicted PAS Score Adjustment: +0.20** 
(Net gain due to improved architectural transparency).
