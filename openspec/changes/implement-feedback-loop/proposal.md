# Proposal: Implement Neural-Visual Feedback Loop
**Change ID**: implement-feedback-loop
**Author**: Antigravity
**Status**: DRAFT

## Summary
Implement Phase 18 by closing the loop between the Visual Shell and the Neural Core. The system will capture rendered frames, encode them, and send them back to the Evolution Daemon, which will process the "vision" to adjust its neural state.

## Motivation
Currently, the system is "Blind". It projects its internal state but cannot see the result. The "Glass Box AI" vision requires the system to be self-aware of its morphological output. This enables:
1.  **Homeostasis**: Self-regulating visual intensity.
2.  **Validation**: Confirming that "PANIC" actually looks red.
3.  **Recursion**: Using the screen as an input buffer for the next thought.

## Technical Approach

### 1. Analysis (Visual Feedback)
- The Compositor already sends `VisualThoughtReady` messages.
- The Daemon must decode RLE/Base64 pixel data.
- The Daemon calculates simple metrics (Average Color, Entropy).

### 2. Reaction (Homeostasis)
- Implement a `VisionCortex` in the Daemon.
- Define reflex loops:
    - **Bright Flash Reflex**: If brightness > 0.9, dampen activations.
    - **Void Stare Reflex**: If variance < 0.1 for 5s, inject "GLITCH" pattern.

### 3. Protocol
- Reuse existing JSON-over-Socket.
- Add `VisualThoughtReady` handler to `EvolutionDaemon`.

## Risks
- **Performance**: Decoding 60fps images in Python might be slow. We will limit feedback to 1-5fps.
- **Feedback Loops**: Positive feedback could cause strobe effects. We must implement dampening.

## Geometric Impact
- **PAS Score**: Slightly increased CPU usage for decoding.
- **Morphology**: The system becomes a closed dynamical system.
