# PixelBrain Inference Pipeline Design

> Date: 2026-03-16
> Goal: Enable chat with the pixel substrate via GPU inference on the brain atlas

## Summary

Implement a CPU-GPU hybrid inference pipeline for the PixelBrain neural network, Uses the existing brain atlas texture (4096×4096) to run inference through a simple 4-layer transformer model.

## Design Decisions

| Decision | Choice | Rationale |
|----------|--------|-----------|
| Model size | Nano (1M params) | Validate pipeline first, then scale |
| Tokenization | Pre-tokenized (byte-level, vocab=256) | Simple, no external deps |
| Model source | Custom test model | Validate inference without external dependencies |
| Architecture | 4 layers, single-head attention | Minimal viable model |
| Inference approach | CPU-GPU hybrid | GPU for matmul, CPU for orchestration |
| Use case | Single token prediction | Validate core first, expand to full chat later |

## Architecture

```
┌─────────────────────────────────────────────────────────────────────────┐
│                        PIXELBRAIN INFERENCE FLOW                         │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                          │
│   Input Text                                                             │
│       │                                                                  │
│       ▼                                                                  │
│   ByteTokenizer.encode(text) → Vec<u32> token_ids                       │
│       │                                                                  │
│       ▼                                                                  │
│   For each token_id:                                                     │
│       ┌──────────────────────────────────────────────────────────┐       │
│       │ GPU: Embed Shader                                          │       │
│       │   token_id → hidden_state (via embedding weights in atlas) │       │
│       └──────────────────────────────────────────────────────────┘       │
│       │                                                                  │
│       ▼                                                                  │
│       For each layer (0..3):                                             │
│       ┌──────────────────────────────────────────────────────────┐       │
│       │ GPU: Attention Shader                                      │       │
│       │   Q, K, V, O projections via atlas weights                 │       │
│       │   single-head self-attention                                │       │
│       └──────────────────────────────────────────────────────────┘       │
│       ┌──────────────────────────────────────────────────────────┐       │
│       │ GPU: FFN Shader                                             │       │
│       │   up_proj → relu → down_proj                                │       │
│       └──────────────────────────────────────────────────────────┘       │
│       │                                                                  │
│       ▼                                                                  │
│   CPU: Read hidden_state → logits → sample next token                   │
│       │                                                                  │
│       ▼                                                                  │
│   ByteTokenizer.decode(output_tokens) → output_text                      │
│                                                                          │
└─────────────────────────────────────────────────────────────────────────┘
```

## Components

### 1. Embedding Shader (`pixel_brain_embed.wgsl`)

```wgsl
// Token ID → Hidden state via weight lookup

@group(0) @binding(0) var brain_atlas: texture_2d<f32>;
@group(0) @binding(1) var hidden_out: texture_storage_2d<f32, write>;

struct EmbedConfig {
    token_id: u32,
    hidden_dim: u32,
    embed_offset: u32,  // Where embeddings start in atlas
}

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) gid: vec3<u32>) {
    let idx = gid.x;
    if (idx >= config.hidden_dim) { return; }

    // Embedding weight address = embed_offset + token_id * hidden_dim + idx
    let addr = config.embed_offset + config.token_id * config.hidden_dim + idx;
    let coords = hilbert_d2xy(4096u, addr);

    // Load embedding weight and store to hidden state
    let weight = textureLoad(brain_atlas, coords).r;
    textureStore(hidden_out, vec2<i32>(i32(idx), 0), vec4<f32>(weight, 0.0, 0.0, 1.0));
}
```

### 2. Attention Shader (`pixel_brain_attention.wgsl`)

```wgsl
// Single-head self-attention (simplified for 1M model)

@group(0) @binding(0) var brain_atlas: texture_2d<f32>;
@group(0) @binding(1) var hidden_in: texture_2d<f32>;
@group(0) @binding(2) var hidden_out: texture_storage_2d<f32, write>;

struct AttentionConfig {
    layer: u32,
    hidden_dim: u32,
    head_dim: u32,      // hidden_dim / n_heads
    q_offset: u32,      // Q weight offset in atlas
    k_offset: u32,
    v_offset: u32,
    o_offset: u32,
}

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) gid: vec3<u32>) {
    // 1. Load hidden_in[idx] as query vector element
    // 2. Load Q weight,    // 3. Compute q = hidden * Q_weight
    // 4. Similar for K, V
    // 5. Attention = softmax(Q * K^T) * V
    // 6. Output = attention * O_weight
    // 7. Store to hidden_out
}
```

### 3. FFN Shader (`pixel_brain_ffn.wgsl`)

```wgsl
// Feed-forward network: hidden → expand → activate → contract → hidden

struct FFNConfig {
    layer: u32,
    hidden_dim: u32,
    ffn_dim: u32,       // Usually 4x hidden_dim
    up_offset: u32,      // Up projection weights offset
    down_offset: u32,    // Down projection weights offset
}

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) gid: vec3<u32>) {
    // 1. up(x) = x @ W_up  [hidden → ffn_dim]
    // 2. activate = relu(up_out)
    // 3. down(x) = activate @ W_down  [ffn_dim → hidden]
    // 4. residual = hidden_in + down_out
    // 5. Store to hidden_out
}
```

### 4. Rust Inference Orchestrator (`pixel_brain/infer.rs`)

```rust
pub struct PixelBrainInferencer {
    device: Arc<Device>,
    queue: Arc<Queue>,
    embed_pipeline: ComputePipeline,
    attention_pipeline: ComputePipeline,
    ffn_pipeline: ComputePipeline,
    hidden_buffer: Buffer,
    config_buffer: Buffer,
}

impl PixelBrainInferencer {
    pub fn new(device: Arc<Device>, queue: Arc<Queue>) -> Self;

    /// Infer next token from current hidden state
    pub fn infer_token(&mut self, token_id: u32) -> u32 {
        // 1. Dispatch embed shader
        // 2. For each layer (0..3):
        //    - Dispatch attention
        //    - Dispatch FFN
        // 3. Read logits from hidden_buffer
        // 4. Sample (greedy: argmax)
        // 5. Return predicted token
    }

    /// Generate tokens for input text
    pub fn generate(&mut self, prompt: &str) -> String {
        let tokens = tokenize(prompt);
        for token in tokens {
            let next = self.infer_token(token);
            // ... accumulate output
        }
        detokenize(&output_tokens)
    }
}
```

### 5. Tokenizer (`pixel_brain/tokenizer.rs`)

```rust
/// Simple byte-level tokenizer (vocab size = 256)
pub struct ByteTokenizer {
    vocab: Vec<String>,
    vocab_inv: HashMap<String, u32>,
}

impl ByteTokenizer {
    pub fn new() -> Self {
        // ASCII vocab: 0-255
        let vocab: Vec<String> = (0u8..=255u8)
            .map(|b| (b as char).to_string())
            .collect();
        // ...
    }

    pub fn encode(&self, text: &str) -> Vec<u32> {
        text.bytes().map(|b| b as u32).collect()
    }

    pub fn decode(&self, tokens: &[u32]) -> String {
        tokens.iter()
            .filter(|&&t| t < 256)
            .map(|&t| t as u8 as char)
            .collect()
    }
}
```

## File Structure

```
systems/infinite_map_rs/
├── src/
│   ├── pixel_brain/
│   │   ├── mod.rs           # Existing
│   │   ├── atlas.rs          # Existing (weight storage)
│   │   ├── infer.rs          # NEW: Inference orchestrator
│   │   └── tokenizer.rs      # NEW: Simple byte tokenizer
│   ├── shaders/
│   │   ├── pixel_brain_embed.wgsl    # NEW: Token embedding
│   │   ├── pixel_brain_attention.wgsl # NEW: Self-attention
│   │   ├── pixel_brain_ffn.wgsl       # NEW: Feed-forward
│   │   └── hebbian_update.wgsl        # Existing
├── tests/
│   └── pixel_brain_infer_test.rs  # NEW: Inference tests
```

## Weight Atlas Layout (1M Model)

| Region | Offset | Size | Purpose |
|--------|--------|------|---------|
| Embeddings | 0x000000 | 256 × 256 | Token embeddings |
| Layer 0 Q | 0x010000 | 64 × 256 | Query projection |
| Layer 0 K | 0x020000 | 64 × 256 | Key projection |
| Layer 0 V | 0x030000 | 64 × 256 | Value projection |
| Layer 0 O | 0x040000 | 256 × 64 | Output projection |
| Layer 0 FFN up | 0x050000 | 256 × 1024 | FFN up projection |
| Layer 0 FFN down | 0x090000 | 1024 × 256 | FFN down projection |
| ... | ... | ... | (repeat for layers 1-3) |

## Testing

```rust
#[test]
fn test_tokenizer_roundtrip() {
    let tok = ByteTokenizer::new();
    let text = "hello world";
    let tokens = tok.encode(text);
    let decoded = tok.decode(&tokens);
    assert_eq!(text, decoded);
}

#[test]
fn test_inference_returns_valid_token() {
    // End-to-end: prompt → output tokens
    // Output should be valid token IDs (< 256)
}

#[test]
#[ignore = "requires model weights"]
fn test_generate_produces_text() {
    // Full generation test
}
```

## Performance Targets

| Metric | Target |
|--------|--------|
| Single token inference | < 10ms |
| Generation throughput | > 50 tokens/sec |
| Memory usage | < 64MB (atlas + buffers) |

## Future Enhancements

1. Multi-head attention for larger models
2. KV-cache for efficient generation
3. BPE tokenizer for better compression
4. Beam search for better sampling
5. Load models from safetensors

---

*Last updated: 2026-03-16*
