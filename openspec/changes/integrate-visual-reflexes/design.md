# Design: The Visual Cortex (Frontend)

## 1. Shader Architecture
We will use PixiJS `Filter` system.

### The "Substrate" Filter
A master shader applied to the entire `world` container.
- **Uniforms**:
  - `uTime`: Global time.
  - `uPulse`: 0.0 to 1.0 (Beat intensity).
  - `uStress`: 0.0 to 1.0 (Entropy/Glitch amount).
  - `uFocus`: 0.0 to 1.0 (Vignette/sharpness).

## 2. Morphological Rules

#### Scenario: Audio Pulse (Techno Kick)
- **Signal**: `reflex_type: "audio_pulse", intensity: 0.8`
- **Reaction**:
  - Grid lines flash White -> Cyan.
  - `uPulse` spikes to 0.8 and decays over 200ms.
  - Camera zoom punches In/Out by 5%.

#### Scenario: Input Focus (Coding Spree)
- **Signal**: `reflex_type: "input_focus"`
- **Reaction**:
  - Background dims (Vignette increases).
  - Grid becomes static (Wobble reduces).
  - `uFocus` increases to 1.0.

#### Scenario: Void Stare (Idle)
- **Signal**: `reflex_type: "void_stare"`
- **Reaction**:
  - Grid begins to "breathe" (Sine wave distortion).
  - Colors drift slowly through HSL space.
