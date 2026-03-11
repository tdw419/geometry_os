# Design: Crystallize Antigravity Agent

## Conceptual Model
The "Mind" is a 1024x1024 RGBA texture mapped via a Hilbert Curve.
- **Red**: Confidence
- **Green**: Structural Health (PAS)
- **Blue**: Logic Branching
- **Alpha**: Opcode/Activity Density

The "Logic" is embedded WGSL code in the PNG metadata key `Logic_Kernel`.

## Architecture

### 1. Converter (`antigravity_rts_converter.py`)
- **Input**: Python `VisualOSAgent` or `UnifiedCognitiveDaemon` state.
- **Process**:
    - Serialize history/state to Hilbert texture.
    - Transpile Python decision rules to WGSL.
    - Pack into `.pixelrts.png`.

### 2. Runtime (`pixelrts_gpu_decoder.wgsl` & Host)
- **Loading**:
    - Texture uploaded to GPU `Texture2D`.
    - Metadata parsed; WGSL kernel compiled as `ComputeShader`.
- **Execution Loop**:
    - `dispatch(16, 16, 1)` (one thread per mental block).
    - Kernel reads `Texture` (Perception).
    - Kernel writes to `StorageBuffer` (Intent).
    - Host reads `StorageBuffer` and applies changes (or GPU applies directly if fully native).

## Visual Impact
- **Agent Texture**: Visible in the "Analyst Window" or "Neuromancy Debugger".
- **Morphing**: The Agent texture pulses and shifts colors as it "thinks".

## Technical Constraints
- **WGSL Limits**: Max uniform buffer size, max compute workgroups.
- **PNG Metadata**: Max chunk size (not an issue for typical kernels).

## Phase Alignment Stability (PAS)
- **Impact**: Positive. Moving logic to GPU reduces jitter and improves frame-perfect synchronization.
- **Verification**: `pas_score` should remain > 0.9 during crystallization.
