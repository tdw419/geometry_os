# PixelBrain Architecture

> **The Screen is the Brain.**
>
> PixelBrain transforms an LLM from a hidden black box into a visible, spatial citizen of Geometry OS.

## Overview

PixelBrain is a native LLM inference system where:

- **Weights live as pixels** in a Hilbert-folded 2D atlas (`tinystories_brain.rts.png`)
- **Inference runs on GPU** via WGSL compute shaders
- **Every thought is visible** as spatial events on the infinite desktop
- **The brain can evolve** through the Evolution Daemon

```
┌─────────────────────────────────────────────────────────────────┐
│                     GEOMETRY OS DESKTOP                         │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │              tinystories_brain.rts.png                   │   │
│  │  ┌────────────────────────────────────────────────────┐  │   │
│  │  │  Embeddings │ Layer 0 │ Layer 1 │ ... │ LM Head   │  │   │
│  │  │   [0-3.2M]  │ QKVO+FFN │ QKVO+FFN │     │ [50257]  │  │   │
│  │  └────────────────────────────────────────────────────┘  │   │
│  │         ↑ Hilbert curve maps 1D weights to 2D pixels     │   │
│  └──────────────────────────────────────────────────────────┘   │
│                                                                 │
│     💠 THOUGHT_PULSE (0xCE)  🌟 ATLAS_GLOW  📊 ATTENTION       │
│         token glyph           weight access     heatmap         │
└─────────────────────────────────────────────────────────────────┘
```

---

## 1. The Brain Atlas

### Format: RTS.PNG

The brain atlas is a standard PNG file with embedded metadata:

```
tinystories_brain.rts.png     # 1024x1024 RGBA float16 texture
tinystories_brain.rts.png.meta.json  # Model config + sector map
```

### Hilbert Curve Mapping

The Hilbert curve is a space-filling fractal that maps 1D sequences to 2D space while **preserving locality**. Consecutive weights stay close together in 2D, which:

- Improves GPU cache coherence
- Makes semantic clusters visible as visual patterns
- Enables spatial mutations (mutate a "region" of the brain)

```python
# Hilbert distance → (x, y) coordinate
def hilbert_d2xy(d: int, n: int) -> tuple[int, int]:
    """Convert Hilbert distance d to (x, y) in n×n space."""
    # ... bit manipulation magic ...
    return (x, y)

# Token 0 embedding starts at distance 0
# Token 1 embedding starts at distance 64 (64 floats per token)
# Layer weights follow embedding sector
```

### Weight Layout

```
Atlas Sector Layout (float indices):
┌────────────────────────────────────────────┐
│ Sector 0: Embeddings                       │
│   - 50,257 tokens × 64 dims = 3,216,448    │
│   - Hilbert indices: 0 to 3,216,447        │
├────────────────────────────────────────────┤
│ Sector 1-N: Transformer Layers             │
│   Per layer (repeated 8× for TinyStories): │
│   - Q weights: 64 × 64 = 4,096             │
│   - K weights: 64 × 64 = 4,096             │
│   - V weights: 64 × 64 = 4,096             │
│   - O weights: 64 × 64 = 4,096             │
│   - gate_proj: 256 × 64 = 16,384           │
│   - up_proj: 256 × 64 = 16,384             │
│   - down_proj: 64 × 256 = 16,384           │
├────────────────────────────────────────────┤
│ Sector N+1: LM Head                        │
│   - 50,257 tokens × 64 dims                │
└────────────────────────────────────────────┘
```

---

## 2. WGSL Compute Shaders

### Shader Pipeline

```
┌──────────────┐    ┌──────────────┐    ┌──────────────┐    ┌──────────────┐
│    EMBED     │───▶│    ATTEND    │───▶│   PROJECT    │───▶│    SAMPLE    │
│   0xD0       │    │    0xD1      │    │    0xD2      │    │    0xD3      │
│              │    │              │    │              │    │              │
│ token → 64d  │    │ self-attend  │    │  SwiGLU FFN  │    │ 64d → token  │
│  hidden      │    │  8 heads     │    │  64→256→64   │    │  logits      │
└──────────────┘    └──────────────┘    └──────────────┘    └──────────────┘
```

### pixel_brain_embed.wgsl

**Purpose:** Convert token ID to hidden state vector.

```wgsl
// Lookup embedding for token_id
fn lookup_embedding(token_id: u32, out_base: u32) {
    for (var pixel_off = 0u; pixel_off < PIXELS_PER_TOKEN; pixel_off++) {
        let coord = get_embed_coord(token_id, float_base);
        let pixel = textureLoad(brain_atlas, coord, 0);
        // Write 4 floats per pixel (RGBA)
        output_hidden.hidden[out_base + 0] = pixel.r;
        output_hidden.hidden[out_base + 1] = pixel.g;
        output_hidden.hidden[out_base + 2] = pixel.b;
        output_hidden.hidden[out_base + 3] = pixel.a;
    }
}
```

### pixel_brain_attention.wgsl

**Purpose:** Self-attention with 8 heads.

```wgsl
// 8 attention heads, 8 dims per head
const NUM_HEADS: u32 = 8u;
const HEAD_DIM: u32 = 8u;

fn compute_attention(p_hidden: ptr<function, array<f32, 64>>) {
    for (var head = 0u; head < NUM_HEADS; head++) {
        // Load Q, K, V weights for this head from atlas
        var q_weights = load_head_weights(layer, 0u, head);
        var k_weights = load_head_weights(layer, 1u, head);
        var v_weights = load_head_weights(layer, 2u, head);

        // Project and attend
        var q = matvec(q_weights, (*p_hidden));
        var k = matvec(k_weights, (*p_hidden));
        var v = matvec(v_weights, (*p_hidden));

        // Scaled dot-product attention
        let score = dot(q, k) / sqrt(HEAD_DIM);
        let head_out = score * v;

        // Concatenate heads, apply output projection
        // ...
    }
    // Residual connection
    (*p_hidden) = (*p_hidden) + attention_output;
}
```

### pixel_brain_project.wgsl

**Purpose:** Feed-forward network with SwiGLU activation.

```wgsl
// LLaMA-style SwiGLU: gate * up, then down
fn compute_ffn(p_hidden: ptr<function, array<f32, 64>>) {
    // gate_proj: 64 → 256 with SiLU
    var gate: array<f32, 256>;
    for (var i = 0u; i < 256u; i++) {
        var sum = 0.0;
        for (var j = 0u; j < 64u; j++) {
            sum += load_ffn_weight(layer, 0u, i, j) * (*p_hidden)[j];
        }
        gate[i] = silu(sum);  // x / (1 + exp(-x))
    }

    // up_proj: 64 → 256
    var up: array<f32, 256>;
    // ... similar matrix-vector multiply ...

    // Element-wise gate * up
    var intermediate: array<f32, 256>;
    for (var i = 0u; i < 256u; i++) {
        intermediate[i] = gate[i] * up[i];
    }

    // down_proj: 256 → 64
    var output: array<f32, 64>;
    // ... matrix-vector multiply ...

    // Residual connection
    for (var i = 0u; i < 64u; i++) {
        (*p_hidden)[i] = (*p_hidden)[i] + output[i];
    }
}
```

### pixel_brain_sample.wgsl

**Purpose:** Convert hidden state to token logits and sample.

```wgsl
// LM head: 64 → 50257 (vocab size)
fn compute_logits(hidden: array<f32, 64>) -> array<f32, 50257> {
    var logits: array<f32, 50257>;
    // Parallel computation across vocabulary
    for (var token = 0u; token < 50257u; token++) {
        var sum = 0.0;
        for (var i = 0u; i < 64u; i++) {
            sum += load_lm_head_weight(token, i) * hidden[i];
        }
        logits[token] = sum;
    }
    return logits;
}

// Greedy sampling (argmax) or temperature sampling
fn sample_token(logits: array<f32, 50257>) -> u32 {
    // Find max logit
    var max_idx = 0u;
    var max_val = logits[0];
    for (var i = 1u; i < 50257u; i++) {
        if (logits[i] > max_val) {
            max_val = logits[i];
            max_idx = i;
        }
    }
    return max_idx;
}
```

---

## 3. GeoASM Opcodes

PixelBrain extends GeoASM with neural primitives:

| Opcode | Name | Args | Description |
|--------|------|------|-------------|
| 0xD0 | EMBED | 2 | Token → hidden state lookup |
| 0xD1 | ATTEND | 2 | Self-attention computation |
| 0xD2 | PROJECT | 2 | FFN projection |
| 0xD3 | SAMPLE | 2 | Hidden → token sampling |
| 0xD5 | KV_APPEND | 1 | Append to KV-cache texture |
| 0xD6 | THOUGHT_PULSE | 1 | Emit visual glyph |

### Orchestration Example

```asm
# Generate one token from prompt
EMBED   R1, R2      ; R1=token_id, R2=hidden_state[64]
ATTEND  R2, R3      ; Self-attention, result in R2
PROJECT R2, R4      ; FFN, result in R2
SAMPLE  R2, R5      ; R5=next_token_id
THOUGHT_PULSE R5    ; Emit visual glyph for token
```

---

## 4. Visual Feedback System

### THOUGHT_PULSE (0xCE)

Every generated token emits a visible glyph pulse:

```python
def emit_thought_pulse(self, token_id: int, position: tuple, intensity: float) -> bool:
    glyph = {
        "type": "THOUGHT_PULSE",
        "opcode": 0xCE,
        "token_id": token_id,
        "x": position[0],
        "y": position[1],
        "intensity": intensity,
        "timestamp": time.time()
    }
    # Broadcast to WebSocket clients
    # Rendered as cyan pulsing circle in NeuralCityEngine
```

### ATLAS_GLOW

When weights are accessed, the atlas "glows" at those coordinates:

```python
def emit_atlas_glow(self, coords: List[tuple], intensity: float) -> bool:
    # coords = [(x1, y1), (x2, y2), ...] of accessed pixels
    # Rendered as heatmap overlay on brain atlas
```

### ATTENTION_UPDATE

Real-time attention weight visualization:

```python
def emit_attention_update(self, layer: int, head: int, weights: List[float]) -> bool:
    message = {
        "type": "ATTENTION_UPDATE",
        "layer": layer,
        "head": head,
        "weights": weights,  # Softmax scores
        "timestamp": time.time()
    }
    # Rendered as heatmap in AttentionVisualizer
```

### Data Flow Diagram

```
┌─────────────────────────────────────────────────────────────────────┐
│                         PYTHON BACKEND                              │
│  ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐ │
│  │PixelBrainPipeline│───▶│  VisualBridge   │───▶│  WebSocket      │ │
│  │                 │    │                 │    │  broadcast      │ │
│  │ forward() →     │    │ emit_thought_   │    │                 │ │
│  │   token         │    │   pulse()       │    │                 │ │
│  │                 │    │ emit_atlas_     │    │                 │ │
│  │                 │    │   glow()        │    │                 │ │
│  │                 │    │ emit_attention_ │    │                 │ │
│  │                 │    │   update()      │    │                 │ │
│  └─────────────────┘    └─────────────────┘    └─────────────────┘ │
└─────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────┐
│                        BROWSER FRONTEND                             │
│  ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐ │
│  │NeuralCityEngine │───▶│ThoughtVisualizer│    │AtlasGlowOverlay │ │
│  │ (PixiJS v8)     │    │                 │    │                 │ │
│  │                 │    │  💠 Cyan glyphs │    │  🌟 Heatmap     │ │
│  │                 │    │  3s fade        │    │  on atlas       │ │
│  └─────────────────┘    └─────────────────┘    └─────────────────┘ │
│                                                                     │
│  ┌─────────────────┐                                                │
│  │AttentionViz     │  📊 Per-head heatmaps, probability bars       │
│  └─────────────────┘                                                │
└─────────────────────────────────────────────────────────────────────┘
```

---

## 5. Cognitive Core Integration

### PixelBrainService

Singleton service wrapping the pipeline:

```python
from systems.visual_shell.api.pixel_brain_service import get_pixel_brain_service

service = get_pixel_brain_service()

# Generate with visual feedback
result = await service.generate(
    prompt="Hello, world!",
    max_tokens=50,
    temperature=0.7,
    emit_visual=True  # Emits THOUGHT_PULSE, ATLAS_GLOW, ATTENTION_UPDATE
)

# Returns:
# {
#     "text": "Hello, world! I am...",
#     "tokens": [15496, 11, 995, 0, ...],
#     "visual_feedback": {
#         "thought_pulses": [...],
#         "atlas_glow_points": [...],
#         "attention_updates": [...]
#     },
#     "latency_ms": 234.5
# }
```

### SwarmLLMBackend

Swarm agents use native inference:

```python
from systems.swarm.llm_backend import get_swarm_llm_backend

backend = get_swarm_llm_backend()

# Used by EngineerAgent, ArchitectAgent, ReviewerAgent
code = await backend.generate_code("Write a function to sort a list")
analysis = await backend.analyze("Review this code for security issues")
```

### WebMCP Integration

WebMCP tools route through PixelBrain:

```javascript
// In webmcp_bridge.js
async function sendLLMPrompt(prompt, options = {}) {
    const usePixelBrain = options.use_pixel_brain !== false;

    if (usePixelBrain && pixelBrainAvailable) {
        // Native inference with visual feedback
        return await websocket.request('PIXEL_BRAIN_GENERATE', {
            prompt,
            max_tokens: options.max_tokens || 100,
            emit_visual: true
        });
    } else {
        // Fallback to external LM Studio
        return await externalLLM(prompt, options);
    }
}
```

---

## 6. Recursive Evolution

### Brain Mutations

The Evolution Daemon can mutate the brain:

```python
from systems.evolution_daemon.brain_mutations import (
    mutate_weight_sector,
    mutate_shader,
    evaluate_brain_fitness
)

# Mutate a weight sector (e.g., embedding layer)
mutate_weight_sector(atlas, sector=0, rate=0.001)

# Mutate shader code
mutated_code = mutate_shader(original_wgsl, mutation_type="attention_tweak")

# Evaluate fitness (e.g., perplexity on held-out data)
fitness = evaluate_brain_fitness(atlas, test_data)
```

### Evolution Hook

```python
# In brain_evolution_hook.py
class BrainEvolutionHook:
    def on_evolution_cycle(self, daemon):
        # 1. Apply mutation
        self.mutation = mutate_weight_sector(self.atlas, sector=random_sector())

        # 2. Evaluate fitness
        new_fitness = evaluate_brain_fitness(self.atlas, self.test_data)

        # 3. Keep or revert
        if new_fitness > self.current_fitness:
            self.current_fitness = new_fitness
            return "keep"
        else:
            revert_mutation(self.mutation)
            return "revert"
```

---

## 7. File Reference

### Core Files

```
systems/visual_shell/wgsl/
├── pixel_brain_pipeline.py    # Orchestrates all shaders
├── pixel_brain_embed.wgsl     # Token → hidden
├── pixel_brain_attention.wgsl # Self-attention
├── pixel_brain_project.wgsl   # FFN
└── pixel_brain_sample.wgsl    # Hidden → token

systems/visual_shell/api/
├── visual_bridge.py           # emit_thought_pulse, emit_atlas_glow, emit_attention_update
└── pixel_brain_service.py     # Singleton service

systems/swarm/
├── llm_backend.py             # SwarmLLMBackend
└── llm_agent.py               # SwarmLLMAgent base class

systems/evolution_daemon/
├── brain_mutations.py         # Weight/shader mutations
└── hooks/brain_evolution_hook.py  # Evolution integration

systems/visual_shell/web/
├── ThoughtVisualizer.js       # Glyph rendering
├── AtlasGlowOverlay.js        # Weight access heatmap
└── AttentionVisualizer.js     # Attention patterns
```

### Converter

```
pixel_brain_converter.py       # HuggingFace → Hilbert atlas
```

### Tests

```
tests/
├── test_pixel_brain_converter.py
├── test_pixel_brain_pipeline.py
├── test_pixel_brain_service.py
├── test_thought_pulse.py
├── test_pixel_brain_e2e.py
├── test_pixel_brain_visual_e2e.py
├── test_attention_data_emission.py
├── test_swarm_llm_backend.py
└── test_brain_mutations.py
```

---

## 8. Usage Examples

### Basic Generation

```python
from systems.visual_shell.api.pixel_brain_service import get_pixel_brain_service

service = get_pixel_brain_service()
result = await service.generate("Once upon a time", max_tokens=50)
print(result["text"])
```

### With Visual Feedback

```python
result = await service.generate(
    "What is the meaning of life?",
    max_tokens=100,
    emit_visual=True
)

# Access visual events
for pulse in result["visual_feedback"]["thought_pulses"]:
    print(f"Token {pulse['token_id']} at ({pulse['x']}, {pulse['y']})")
```

### Via WebMCP

```javascript
// In browser
const response = await window.webmcp.send_llm_prompt(
    "Write a haiku about neural networks",
    { use_pixel_brain: true, max_tokens: 30 }
);
console.log(response.text);
```

### Direct Pipeline

```python
from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline

pipeline = PixelBrainPipeline("tinystories_brain.rts.png")
tokens = pipeline.generate([0, 1, 2], max_tokens=10)  # Greedy sampling
```

---

## 9. Architecture Decisions

### Why Hilbert Curve?

- **Locality preservation**: Related weights stay close in 2D
- **Cache efficiency**: GPU texture sampling benefits from spatial coherence
- **Visual interpretability**: Semantic clusters appear as visual patterns
- **Spatial mutations**: Can mutate "regions" of the brain

### Why WGSL Instead of CUDA?

- **Cross-platform**: Works on any WebGPU-compatible device
- **Browser-compatible**: Same shaders run in browser via WebGPU
- **Python bindings**: wgpu-py provides native access
- **Future-proof**: WebGPU is the emerging standard

### Why Float16?

- **Half the size** of float32
- **Sufficient precision** for inference (training needs float32)
- **GPU-native**: Modern GPUs have float16 acceleration
- **PNG-compatible**: Can store as 16-bit per channel

### Why Separate Shaders?

- **Modularity**: Each stage can be tested independently
- **Debuggability**: Easier to isolate issues
- **Extensibility**: Can add new stages without modifying others
- **Performance**: Can optimize each shader independently

---

## 10. Future Directions

### Planned Enhancements

1. **KV-Cache Texture**: Store key-value cache in atlas for faster autoregressive generation
2. **Speculative Decoding**: Generate multiple tokens in parallel, verify
3. **LoRA Adapters**: Mutate only small adapter weights
4. **Multi-Model Atlas**: Multiple models in single atlas, context-switch via metadata
5. **Distributed Inference**: Split atlas across multiple GPUs

### Research Questions

- Can evolution discover better attention patterns than hand-designed?
- What visual patterns emerge in well-trained vs. poorly-trained weights?
- Can we train directly on the atlas via gradient descent on pixel values?

---

*Last updated: 2026-03-09*
*Authors: Geometry OS Team + PixelBrain Team*
