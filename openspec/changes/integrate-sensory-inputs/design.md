# Design: Sensory Integration

## Audio Subsystem
- **Library**: `cpal` (Cross-platform Audio Library).
- **Processing**:
  - Capture input stream (microphone/loopback).
  - Perform FFT (Fast Fourier Transform) on 1024-sample chunks.
  - Extract: Low (<150Hz), Mid, High (>2kHz) bands.
  - Beat Detection: Simple energy threshold tracking.

## Input Subsystem
- **Metric**: "Kinetic Entropy".
- **Calculation**:
  $$ E_k = \frac{\Delta x^2 + \Delta y^2}{\Delta t} $$
- **Startle Reflex**: If $E_k > Threshold$, trigger immediate geometric jitter.

## Uniform Mapping
| Source Data | Uniform Field | Visual Effect |
| :--- | :--- | :--- |
| Audio Bass | `bass_energy` | Global Scale Pulse |
| Audio Treble | `treble_energy` | Surface Noise/Sparkle |
| Mouse Velocity | `velocity` | Cluster Rotation Speed |
| Theory of Mind | `alignment` | Cluster Type ($14n+2$ vs $14n+4$) |
