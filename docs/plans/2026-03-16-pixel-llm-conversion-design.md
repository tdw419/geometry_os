# Pixel LLM Conversion Design

> Converting existing LLMs into Geometry OS pixel substrate format

## Summary

This design enables neural network weights to be stored as GPU texture pixels, making the model visible, inspectable, and mutable in real-time through chat-based Hebbian learning.

## Problem Statement

Traditional LLMs store weights in opaque binary files (`.safetensors`), requiring:
- External ML frameworks (PyTorch, TensorFlow)
- Backpropagation training loops
- Frozen deployment models
- No visibility into model internals

Geometry OS needs an internal intelligence layer that:
- Lives in the GPU substrate
- Learns from chat interactions in real-time
- Is visible as pixels for debugging
- Can self-modify through `OP_GLYPH_MUTATE`

## Solution: Pixel LLM Architecture

### Core Components

1. **Weight Atlas** - 2048x2048 GPU texture storing all weights as RGBA pixels
2. **Hilbert Addressing** - Spatial locality preserving coordinate system
3. **Float16 Encoding** - Weights encoded as pixel color values
4. **WGSL Compute Shaders** - Inference via GPU compute, not tensor cores
5. **Hebbian Learning** - Local weight updates without backpropagation
6. **Chat Learning Loop** - `/chat` + `/rate` endpoints for training

### Data Flow

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│   User Chat     │────▶│   /chat API     │────▶│  PixelBrain     │
│                 │     │  (inference)    │     │  Inference      │
└─────────────────┘     └─────────────────┘     └─────────────────┘
                                                        │
        ┌───────────────────────────────────────────────┘
        ▼
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│   User Rates    │────▶│   /rate API     │────▶│  Hebbian        │
│   Response      │     │  (learning)     │     │  Weight Update  │
└─────────────────┘     └─────────────────┘     └─────────────────┘
```

### Weight Storage Layout

```
┌─────────────────────────────────────────────────────────────┐
│  PIXELBRAIN WEIGHT ATLAS (2048×2048 = 4M pixels)            │
├─────────────────────────────────────────────────────────────┤
│  0x000000-0x000FFF: Token Embeddings                        │
│  0x001000-0x001FFF: Positional Embeddings                   │
│  0x002000-0x003FFF: Layer 0 Attention (Q, K, V, O)          │
│  0x004000-0x005FFF: Layer 0 FFN                             │
│  0x008000-0x00FFFF: Layer 1...                              │
│  0x100000-0x1FFFFF: KV Cache (runtime)                      │
└─────────────────────────────────────────────────────────────┘
```

## Training Approaches

### A. Convert Existing Model (Recommended First Step)
- Time: Minutes
- Quality: High (starts from trained weights)
- Process: `.safetensors` → decode → Hilbert layout → `.rts.png`

### B. Hebbian Fine-Tuning
- Time: Hours-Days
- Quality: Medium (depends on chat quality)
- Formula: `Δw = η × activation × reward`

### C. Evolutionary Optimization
- Time: Days-Weeks
- Quality: Variable
- Process: Population → Fitness → Selection → Mutation

## Implementation Details

### Float16 → RGBA Encoding

```wgsl
fn encode_weight(value: f32) -> vec4<u8> {
    let bits = pack2x16float(vec2<f32>(value, 0.0));
    return vec4<u8>(
        bits & 0xFF,
        (bits >> 8) & 0xFF,
        (bits >> 16) & 0xFF,
        (bits >> 24) & 0xFF
    );
}
```

### Hebbian Update

```rust
// Δw = η × pre_activation × post_activation × reward
let delta_w = learning_rate * activation * reward;
op_glyph_mutate(weight_addr, delta_w);
```

### Response-Based Activations

Activations are recorded from output token generation (not input processing) to ensure meaningful learning signals.

## API Endpoints

| Endpoint | Purpose | Returns |
|----------|---------|---------|
| `POST /chat` | Generate response | `{chat_id, response, tokens}` |
| `POST /rate` | Rate response quality | `{updated_weights, chat_id}` |

## Files Created

- `docs/PIXEL_LLM.md` - Architecture reference
- `docs/TRAINING_PIXEL_LLM.md` - Training approaches
- `docs/CHAT_LEARNING_LOOP.md` - Chat-based learning
- `docs/PIXEL_LLM_TENSOR_NATIVE_OS.md` - Tensor-native OS integration

## Success Criteria

- [x] `/chat` endpoint generates responses
- [x] `/rate` endpoint applies Hebbian updates
- [x] Weights visible as GPU texture
- [x] Real-time mutation via `OP_GLYPH_MUTATE`
- [ ] Actual PixelBrain model loaded (currently simulated)
- [ ] Visual feedback during inference (THOUGHT_PULSE)

## Risks and Mitigations

| Risk | Mitigation |
|------|------------|
| Small model capacity (~1M params) | Use for simple tasks, fallback to external LLM |
| Shader slower than tensor cores | Acceptable for interactive chat |
| Hebbian less precise than backprop | Sufficient for adaptation, not pre-training |
| Catastrophic forgetting | Low learning rate, memory replay |

## Next Steps

1. Load actual TinyStories-1M weights into substrate
2. Connect real activation recording to inference
3. Implement THOUGHT_PULSE visual feedback
4. Test with real chat sessions and quality ratings

---

*Design validated: 2026-03-16*
