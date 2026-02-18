# Phase 35: Synaptic Bridge Design

## Architecture

```
[ LLM / Neural Substrate ] 
        | (Thought Vector [f32; 1024])
        v
[ The Axon (API Layer) ]
        | (Signal)
        v
[ Synaptic Layer (Rust) ] <--- [ Resonance Check (Cosine Similarity) ]
    /       |       \
[Synapse A] [Synapse B] [Synapse C]
    |           |           |
[Reflex A]  [Reflex B]  [Reflex C]
(Reboot)    (Launch)    (Terminate)
```

## Data Structures

### Synapse
```rust
struct Synapse {
    id: u64,
    source_vector: Vec<f32>,      // The "Thought" trigger
    target_window_id: Option<usize>,
    action_type: SynapseAction,   // Enum: Execute, Terminate, Reboot, etc.
    activation_threshold: f32,    // 0.0 to 1.0 (default 0.85)
    last_fired: u64,              // Timestamp
}
```

## Endpoints

- `POST /api/synapse/register`: Create a new synapse.
- `POST /api/synapse/signal`: Send a thought vector (or text to be embedded) to check for activation.

## Visualization
- **Synaptic Lines**: Bezier curves drawn from the "Brain" window (if exists) or top-center of screen to the `target_window_id`.
- **Pulse**: Lines pulse brightness based on `current_resonance`.
- **Fire**: Bright flash when `resonance > threshold`.
