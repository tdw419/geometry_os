# Pixel LLM

> Where every weight is a pixel, and the screen is the hard drive

## Overview

A **Pixel LLM** stores neural network weights as GPU texture pixels instead of traditional memory arrays. This enables visual inspection, real-time mutation, and Hebbian learning without backpropagation.

```
┌─────────────────────────────────────────────────────────────────────────┐
│                        REGULAR LLM                                       │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐              │
│  │ VRAM Array   │───▶│ Tensor Cores │───▶│ Hidden State │              │
│  │ [invisible]  │    │ [matrix ops] │    │ [numbers]    │              │
│  └──────────────┘    └──────────────┘    └──────────────┘              │
│                                                                         │
│  File: model.safetensors (binary, opaque)                               │
│  Edit: Requires full training loop                                      │
│  See: Black box                                                         │
└─────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────┐
│                        PIXEL LLM                                         │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐              │
│  │ GPU Texture  │───▶│ WGSL Shader  │───▶│ Hidden State │              │
│  │ [visible]    │    │ [pixel ops]  │    │ [in texture] │              │
│  └──────────────┘    └──────────────┘    └──────────────┘              │
│                                                                         │
│  File: brain.rts.png (image, inspectable)                               │
│  Edit: OP_GLYPH_MUTATE any pixel                                        │
│  See: Weights glow during inference                                     │
└─────────────────────────────────────────────────────────────────────────┘
```

## Core Concept: Weights as Pixels

In a Pixel LLM, every weight is stored as a pixel in a GPU texture:

```
Traditional Storage:
  weights[layer][row][col] = 0.1234  // Hidden in VRAM

Pixel Storage:
  texture[x][y] = float16_to_rgba(0.1234)  // Visible as color
```

### Float16 to RGBA Encoding

```wgsl
// Encode float16 weight as RGBA pixel
fn encode_weight(value: f32) -> vec4<u8> {
    let bits = pack2x16float(vec2<f32>(value, 0.0));
    return vec4<u8>(
        bits & 0xFF,
        (bits >> 8) & 0xFF,
        (bits >> 16) & 0xFF,
        (bits >> 24) & 0xFF
    );
}

// Decode RGBA pixel to float16 weight
fn decode_weight(pixel: vec4<u8>) -> f32 {
    let bits = (pixel.x | (pixel.y << 8) | (pixel.z << 16) | (pixel.w << 24));
    return unpack2x16float(bits).x;
}
```

## Hilbert Curve Addressing

Pixel LLMs use Hilbert curve addressing for spatial locality - weights that are semantically related are stored near each other in 2D space.

### Why Hilbert?

```
Linear Addressing:           Hilbert Addressing:
0  1  2  3                   0  1  14 15
4  5  6  7                   3  2  13 12
8  9  10 11                  4  7  8  11
12 13 14 15                  5  6  9  10

Linear: 0→1→2→3→4... (jumps around)
Hilbert: 0→1→2→3→4... (stays local)
```

The Hilbert curve ensures that:
- Nearby addresses in 1D space are nearby in 2D texture space
- Weight matrices stay coherent (not scattered)
- GPU texture cache hits increase

### Hilbert D2XY Conversion

```rust
/// Convert Hilbert distance to (x, y) coordinates
pub fn hilbert_d2xy(n: u32, d: u32) -> [u32; 2] {
    let mut x = 0u32;
    let mut y = 0u32;
    let mut s = 1u32;
    let mut d = d;

    while s < n {
        let rx = 1 & (d / 2);
        let ry = 1 & (d ^ rx);

        // Rotate quadrant
        if ry == 0 {
            if rx == 1 {
                x = s - 1 - x;
                y = s - 1 - y;
            }
            std::mem::swap(&mut x, &mut y);
        }

        x += s * rx;
        y += s * ry;
        d /= 4;
        s *= 2;
    }

    [x, y]
}

/// Convert (x, y) coordinates to Hilbert distance
pub fn hilbert_xy2d(n: u32, x: u32, y: u32) -> u32 {
    let mut d = 0u32;
    let mut x = x;
    let mut y = y;
    let mut s = n / 2;

    while s > 0 {
        let rx = if (x & s) > 0 { 1 } else { 0 };
        let ry = if (y & s) > 0 { 1 } else { 0 };
        d += s * s * ((3 * rx) ^ ry);

        // Rotate quadrant
        if ry == 0 {
            if rx == 1 {
                x = s - 1 - x;
                y = s - 1 - y;
            }
            std::mem::swap(&mut x, &mut y);
        }

        s /= 2;
    }

    d
}
```

## Architecture

### Weight Atlas Layout

A PixelBrain texture (e.g., 2048×2048) is organized into regions:

```
┌─────────────────────────────────────────────────────────────┐
│  PIXELBRAIN WEIGHT ATLAS (2048×2048 = 4M pixels)            │
├─────────────────────────────────────────────────────────────┤
│  0x000000-0x000FFF: Token Embeddings (vocab × dim)          │
│  0x001000-0x001FFF: Positional Embeddings (seq_len × dim)   │
│  0x002000-0x003FFF: Layer 0 Attention (Q, K, V, O)          │
│  0x004000-0x005FFF: Layer 0 FFN (up, down, gate)            │
│  0x006000-0x007FFF: Layer 0 LayerNorm (gamma, beta)         │
│  0x008000-0x00FFFF: Layer 1 weights...                      │
│  ...                                                        │
│  0x0F0000-0x0FFFFF: LM Head (output projection)             │
│  0x100000-0x1FFFFF: KV Cache (runtime state)                │
│  0x200000-0x3FFFFF: Reserved (expansion)                    │
└─────────────────────────────────────────────────────────────┘
```

### Inference Pipeline

```
1. EMBED (Opcode 0xD0)
   ┌─────────────┐
   │ Token ID    │───▶ Hilbert lookup ───▶ Embedding vector
   └─────────────┘          │
                            ▼
                     texture[xy2d(x,y)]

2. ATTEND (Opcode 0xD1)
   ┌─────────────┐
   │ Hidden      │───▶ Q = H @ W_q
   │ State       │───▶ K = H @ W_k  ───▶ Attention scores
   │             │───▶ V = H @ W_v     (softmax(Q @ K^T / √d))
   └─────────────┘          │
                            ▼
                     WGSL matmul shader

3. PROJECT (Opcode 0xD2)
   ┌─────────────┐
   │ Attention   │───▶ FFN(x) = down(act(up(x)))
   │ Output      │     ───▶ Hidden state update
   └─────────────┘

4. SAMPLE (Opcode 0xD3)
   ┌─────────────┐
   │ Final       │───▶ Logits = H @ W_lm_head
   │ Hidden      │───▶ Token = argmax/sample(logits)
   └─────────────┘
```

### WGSL Compute Shaders

```wgsl
// Matrix multiplication for attention
@compute @workgroup_size(16, 16)
fn matmul(
    @builtin(global_invocation_id) gid: vec3<u32>
) {
    let row = gid.x;
    let col = gid.y;

    // Read from texture using Hilbert addressing
    var sum: f32 = 0.0;
    for (var k = 0u; k < K_DIM; k++) {
        let a_addr = hilbert_xy2d(TEXTURE_SIZE, row, k);
        let b_addr = hilbert_xy2d(TEXTURE_SIZE, k, col);

        let a = decode_weight(textureLoad(weights, hilbert_d2xy(a_addr)));
        let b = decode_weight(textureLoad(weights, hilbert_d2xy(b_addr)));

        sum += a * b;
    }

    // Write result
    let out_addr = hilbert_xy2d(TEXTURE_SIZE, row, col);
    textureStore(output, hilbert_d2xy(out_addr), encode_weight(sum));
}
```

## Real-Time Mutation

Unlike traditional LLMs that require training loops, Pixel LLMs support direct weight mutation via `OP_GLYPH_MUTATE`:

### The Mutation Opcode

```wgsl
// OP_GLYPH_MUTATE (opcode 226)
// Directly modify a weight in the texture
fn op_glyph_mutate(addr: u32, delta: f32) {
    let [x, y] = hilbert_d2xy(TEXTURE_SIZE, addr);
    let current = decode_weight(textureLoad(weights, vec2<i32>(x, y)));
    let new_weight = current + delta;
    textureStore(weights, vec2<i32>(x, y), encode_weight(new_weight));
}
```

### Hebbian Learning

```wgsl
// Hebbian update: neurons that fire together, wire together
// Δw = η × pre_activation × post_activation
fn hebbian_update(
    pre_addr: u32,      // Address of presynaptic weight
    post_activation: f32, // How strongly postsynaptic neuron fired
    reward: f32,        // User feedback signal (-1, 0, +1)
    learning_rate: f32  // η = 0.01 typically
) {
    let pre_activation = read_activation(pre_addr);
    let delta = learning_rate * pre_activation * post_activation * reward;
    op_glyph_mutate(pre_addr, delta);
}
```

### Why This Matters

```
Traditional LLM Training:
  1. Collect millions of examples
  2. Run backpropagation for weeks
  3. Update weights in batch
  4. Deploy frozen model

Pixel LLM Learning:
  1. Chat with user
  2. User rates response
  3. Update weights immediately
  4. Model improves in real-time
```

## Visual Inference

During inference, you can literally watch the model think:

```
┌─────────────────────────────────────────────────────────────┐
│                    BRAIN ATLAS (2048×2048)                   │
│  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  │
│  ░░░░░░▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  │  ← Embedding layer
│  ░░░░░░▓▓██████▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  │     (token lookup)
│  ░░░░░░▓▓████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  │
│  ░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░  │
│  ░░░░░░░░░░░░░░░░░░░░░░░░▓▓██▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░  │  ← Attention layer
│  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  │     (Q @ K^T)
│  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  │
│  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  │
│  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  │
│  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  │
│  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  │
│  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  │
│  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  │
│  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  │
└─────────────────────────────────────────────────────────────┘

Glow intensity = weight access frequency
Color = weight value (positive=green, negative=red)
```

## Comparison Summary

| Aspect | Regular LLM | Pixel LLM |
|--------|-------------|-----------|
| **Weight Storage** | VRAM arrays | GPU texture pixels |
| **File Format** | `.safetensors` (binary) | `.rts.png` (image) |
| **Addressing** | Linear indices | Hilbert curve (2D) |
| **Inference** | CUDA tensor cores | WGSL compute shaders |
| **Visibility** | Black box | Weights are image |
| **Modification** | Training loop | `OP_GLYPH_MUTATE` |
| **Learning** | Backpropagation | Hebbian (local) |
| **Speed** | Fast (tensor cores) | Slower (shaders) |
| **Model Size** | Billions of params | ~1-10M params |
| **Self-Modification** | No | Yes (can rewrite itself) |
| **Visual Debugging** | No | Yes (watch inference) |
| **Evolution** | Difficult | Natural (mutate pixels) |

## When to Use Pixel LLMs

### Good Fit

- **Embedded systems** - No tensor cores needed
- **Real-time learning** - Chat-based adaptation
- **Evolution experiments** - Genetic algorithms on weights
- **Visual AI research** - Watch the brain think
- **Self-modifying systems** - Model rewrites itself
- **Educational** - See how neural networks work

### Not Good Fit

- **Large models** - Limited to ~10M params
- **Production throughput** - Slower than tensor cores
- **Complex reasoning** - Small model capacity
- **Batch inference** - Designed for streaming

## Implementation in Geometry OS

### Files

| File | Purpose |
|------|---------|
| `systems/visual_shell/wgsl/pixel_brain_embed.wgsl` | Token embedding shader |
| `systems/visual_shell/wgsl/pixel_brain_attention.wgsl` | Self-attention shader |
| `systems/visual_shell/wgsl/pixel_brain_project.wgsl` | FFN shader |
| `systems/visual_shell/wgsl/pixel_brain_sample.wgsl` | Output sampling shader |
| `systems/visual_shell/wgsl/pixel_brain_pipeline.py` | Python orchestrator |
| `systems/glyph_stratum/programs/tinystories_brain.rts.png` | Weight atlas |

### Opcodes

| Opcode | Name | Description |
|--------|------|-------------|
| `0xD0` | EMBED | Token → Hidden state |
| `0xD1` | ATTEND | Self-attention |
| `0xD2` | PROJECT | FFN layer |
| `0xD3` | SAMPLE | Hidden → Token |
| `0xD5` | KV_APPEND | Append to KV cache |
| `0xD6` | THOUGHT_PULSE | Visual feedback |

### GeoASM Cognitive Loop

```asm
.main
  0xD4                  ; LLM_PROMPT (await input)
  0xD0 R1, R2           ; EMBED (token → hidden)

  LOOP 8
    0xD1 R2, R2         ; ATTEND (self-attention)
    0xD2 R2, R2         ; PROJECT (FFN)
  ENDLOOP

  0xD3 R2, R3           ; SAMPLE (hidden → token)
  0xD6 R3               ; THOUGHT_PULSE (visual feedback)
  JMP .main
```

## Future Directions

### 1. Larger Models

Current limit is ~1M params (TinyStories). Future work:
- Multi-texture sharding
- Compression techniques
- Sparse attention patterns

### 2. Hybrid Architecture

```
┌─────────────────┐
│  Pixel LLM      │ ← Fast local inference
│  (1M params)    │
└────────┬────────┘
         │ Fallback
         ▼
┌─────────────────┐
│  External LLM   │ ← Complex reasoning
│  (cloud/local)  │
└─────────────────┘
```

### 3. Evolutionary Optimization

```rust
// Genetic algorithm on weight atlas
fn evolve_brain(atlas: &mut Texture) {
    for generation in 0..1000 {
        let fitness = evaluate_fitness(atlas);
        let mutations = select_mutations(fitness);
        for (addr, delta) in mutations {
            op_glyph_mutate(atlas, addr, delta);
        }
    }
}
```

---

## Philosophy

> "The screen IS the hard drive"

In Geometry OS, the Pixel LLM embodies the principle that **state should be visible**. When every weight is a pixel:

- Humans can see the model
- AI can inspect itself
- Evolution can mutate directly
- Learning is transparent

The model is not a black box. It's a living image that glows when it thinks.

---

## See Also

- [Chat Learning Loop](CHAT_LEARNING_LOOP.md) - How chat makes the brain smarter
- [GPU Daemon API](GPU_DAEMON_API.md) - HTTP endpoints for inference
- [Glyph Programming Reference](../GLYPH_PROGRAMMING_REFERENCE.md) - GeoASM opcodes

---

*Where every weight is a pixel, and learning is visual.*
