# PixelBrain Inference Pipeline Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable chat with the pixel substrate via GPU inference through a 4-layer transformer on the brain atlas.

**Architecture:** CPU-GPU hybrid inference. GPU compute shaders handle embedding, attention, and FFN operations on the brain atlas texture. CPU orchestrates dispatches, handles tokenization, and samples output tokens.

**Tech Stack:** Rust, wgpu, WGSL compute shaders

---

### Task 1: Create ByteTokenizer

**Files:**
- Create: `systems/infinite_map_rs/src/pixel_brain/tokenizer.rs`
- Modify: `systems/infinite_map_rs/src/pixel_brain/mod.rs`

**Step 1: Write the failing test**

Create `systems/infinite_map_rs/tests/tokenizer_test.rs`:

```rust
//! ByteTokenizer tests

use infinite_map_rs::pixel_brain::tokenizer::ByteTokenizer;

#[test]
fn test_tokenizer_encode() {
    let tok = ByteTokenizer::new();
    let text = "hello";
    let tokens = tok.encode(text);
    assert_eq!(tokens, vec![104, 101, 108, 108, 111]); // ASCII values
}

#[test]
fn test_tokenizer_decode() {
    let tok = ByteTokenizer::new();
    let tokens = vec![104, 101, 108, 108, 111];
    let text = tok.decode(&tokens);
    assert_eq!(text, "hello");
}

#[test]
fn test_tokenizer_roundtrip() {
    let tok = ByteTokenizer::new();
    let original = "Hello, World! 123";
    let tokens = tok.encode(original);
    let decoded = tok.decode(&tokens);
    assert_eq!(original, decoded);
}

#[test]
fn test_tokenizer_vocab_size() {
    let tok = ByteTokenizer::new();
    assert_eq!(tok.vocab_size(), 256);
}
```

**Step 2: Run test to verify it fails**

Run: `cargo test --package infinite_map_rs tokenizer -- --nocapture`
Expected: FAIL with "module not found"

**Step 3: Write minimal implementation**

Create `systems/infinite_map_rs/src/pixel_brain/tokenizer.rs`:

```rust
//! Simple byte-level tokenizer for PixelBrain inference
//!
//! Uses ASCII characters as vocabulary (vocab_size = 256).

use std::collections::HashMap;

/// Byte-level tokenizer (vocab size = 256)
pub struct ByteTokenizer {
    /// Vocabulary: token_id -> string
    vocab: Vec<String>,
    /// Inverse vocabulary: string -> token_id
    vocab_inv: HashMap<String, u32>,
}

impl ByteTokenizer {
    /// Create a new byte tokenizer
    pub fn new() -> Self {
        let vocab: Vec<String> = (0u8..=255u8)
            .map(|b| {
                if b >= 32 && b < 127 {
                    (b as char).to_string()
                } else {
                    format!("<0x{:02X}>", b)
                }
            })
            .collect();

        let vocab_inv: HashMap<String, u32> = vocab
            .iter()
            .enumerate()
            .map(|(i, s)| (s.clone(), i as u32))
            .collect();

        Self { vocab, vocab_inv }
    }

    /// Get vocabulary size
    pub fn vocab_size(&self) -> usize {
        self.vocab.len()
    }

    /// Encode text to token IDs
    pub fn encode(&self, text: &str) -> Vec<u32> {
        text.bytes().map(|b| b as u32).collect()
    }

    /// Decode token IDs to text
    pub fn decode(&self, tokens: &[u32]) -> String {
        tokens.iter()
            .filter(|&&t| t < 256)
            .filter_map(|&t| {
                let b = t as u8;
                if b >= 32 && b < 127 {
                    Some(b as char)
                } else {
                    None
                }
            })
            .collect()
    }
}

impl Default for ByteTokenizer {
    fn default() -> Self{
        Self::new()
    }
}
```

**Step 4: Add module to mod.rs**

Add to `systems/infinite_map_rs/src/pixel_brain/mod.rs`:

```rust
pub mod tokenizer;
```

**Step 5: Run test to verify it passes**

Run: `cargo test --package infinite_map_rs tokenizer -- --nocapture`
Expected: 4 tests pass

**Step 6: Commit**

```bash
git add systems/infinite_map_rs/src/pixel_brain/tokenizer.rs systems/infinite_map_rs/src/pixel_brain/mod.rs systems/infinite_map_rs/tests/tokenizer_test.rs
git commit -m "feat(pixel_brain): add ByteTokenizer for inference tokenization"
```

---

### Task 2: Create Embedding Shader

**Files:**
- Create: `systems/infinite_map_rs/src/shaders/pixel_brain_embed.wgsl`

**Step 1: Create the shader file**

```wgsl
// pixel_brain_embed.wgsl
// Token ID → Hidden state via embedding lookup
//
// This shader looks up the embedding vector for a token ID
// from the brain atlas and stores it in the hidden state buffer.

struct EmbedConfig {
    token_id: u32,        // Input token to embed
    hidden_dim: u32,      // Dimension of hidden state (256 for Nano)
    embed_offset: u32,    // Where embeddings start in atlas
    atlas_size: u32,      // Atlas dimension (4096)
}

@group(0) @binding(0) var<uniform> config: EmbedConfig;
@group(0) @binding(1) var brain_atlas: texture_2d<f32>;
@group(0) @binding(2) var<storage, read_write> hidden_state: array<f32>;

// Hilbert curve: convert distance to (x, y)
fn hilbert_d2xy(n: u32, d: u32) -> vec2<u32> {
    var x: u32 = 0u;
    var y: u32 = 0u;
    var s: u32 = 1u;
    var rx: u32 = 0u;
    var ry: u32 = 0u;
    var t: u32 = d;

    while (s < n) {
        ry = (t >> 1u) & 1u;
        rx = (t ^ ry) & 1u;

        // Rotate
        if (ry == 0u) {
            if (rx == 1u) {
                x = s - 1u - x;
                y = s - 1u - y;
            }
            let tmp = x;
            x = y;
            y = tmp;
        }

        x += s * rx;
        y += s * ry;
        t >>= 2u;
        s <<= 1u;
    }

    return vec2<u32>(x, y);
}

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx = global_id.x;

    // Bounds check
    if (idx >= config.hidden_dim) {
        return;
    }

    // Calculate address in atlas: embed_offset + token_id * hidden_dim + idx
    let addr = config.embed_offset + config.token_id * config.hidden_dim + idx;

    // Convert to texture coordinates
    let coords = hilbert_d2xy(config.atlas_size, addr);

    // Load embedding weight from brain atlas
    let weight = textureLoad(brain_atlas, vec2<i32>(i32(coords.x), i32(coords.y))).r;

    // Store to hidden state buffer
    hidden_state[idx] = weight;
}
```

**Step 2: Verify shader file exists**

Run: `cat systems/infinite_map_rs/src/shaders/pixel_brain_embed.wgsl | head -20`
Expected: Shader file created with proper structure

**Step 3: Commit**

```bash
git add systems/infinite_map_rs/src/shaders/pixel_brain_embed.wgsl
git commit -m "feat(shaders): add pixel_brain_embed.wgsl for token embedding"
```

---

### Task 3: Create Attention Shader

**Files:**
- Create: `systems/infinite_map_rs/src/shaders/pixel_brain_attention.wgsl`

**Step 1: Create the shader file**

```wgsl
// pixel_brain_attention.wgsl
// Single-head self-attention for PixelBrain Nano
//
// Computes: attention(Q, K, V) = softmax(Q * K^T) * V
// Then: output = attention * O

struct AttentionConfig {
    layer: u32,           // Current layer (0-3)
    hidden_dim: u32,      // 256 for Nano
    head_dim: u32,        // 64 for Nano (hidden_dim / n_heads)
    seq_len: u32,         // Sequence length (1 for single token)
    q_offset: u32,        // Q weight offset in atlas
    k_offset: u32,        // K weight offset
    v_offset: u32,        // V weight offset
    o_offset: u32,        // O weight offset
    atlas_size: u32,      // Atlas dimension
}

@group(0) @binding(0) var<uniform> config: AttentionConfig;
@group(0) @binding(1) var brain_atlas: texture_2d<f32>;
@group(0) @binding(2) var<storage, read> hidden_in: array<f32>;
@group(0) @binding(3) var<storage, read_write> hidden_out: array<f32>;
@group(0) @binding(4) var<storage, read_write> attention_buffer: array<f32>;

fn hilbert_d2xy(n: u32, d: u32) -> vec2<u32> {
    var x: u32 = 0u;
    var y: u32 = 0u;
    var s: u32 = 1u;
    var rx: u32 = 0u;
    var ry: u32 = 0u;
    var t: u32 = d;

    while (s < n) {
        ry = (t >> 1u) & 1u;
        rx = (t ^ ry) & 1u;

        if (ry == 0u) {
            if (rx == 1u) {
                x = s - 1u - x;
                y = s - 1u - y;
            }
            let tmp = x;
            x = y;
            y = tmp;
        }

        x += s * rx;
        y += s * ry;
        t >>= 2u;
        s <<= 1u;
    }

    return vec2<u32>(x, y);
}

fn load_weight(offset: u32, row: u32, col: u32) -> f32 {
    let addr = offset + row * config.hidden_dim + col;
    let coords = hilbert_d2xy(config.atlas_size, addr);
    return textureLoad(brain_atlas, vec2<i32>(i32(coords.x), i32(coords.y))).r;
}

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx = global_id.x;

    if (idx >= config.hidden_dim) {
        return;
    }

    // 1. Compute Q[idx] = hidden_in · W_q[idx, :]
    var q_val: f32 = 0.0;
    for (var i: u32 = 0u; i < config.hidden_dim; i++) {
        let w = load_weight(config.q_offset, idx, i);
        q_val += hidden_in[i] * w;
    }

    // 2. Compute K and V similarly (simplified for single token)
    var k_val: f32 = 0.0;
    var v_val: f32 = 0.0;
    for (var i: u32 = 0u; i < config.hidden_dim; i++) {
        k_val += hidden_in[i] * load_weight(config.k_offset, idx, i);
        v_val += hidden_in[i] * load_weight(config.v_offset, idx, i);
    }

    // 3. For single token: attention = softmax(q * k) * v ≈ v (simplified)
    //    In full implementation, this would compute attention scores
    let attention_out = v_val;

    // 4. Apply output projection: O · attention
    var out_val: f32 = 0.0;
    for (var i: u32 = 0u; i < config.hidden_dim; i++) {
        out_val += attention_out * load_weight(config.o_offset, idx, i);
    }

    // 5. Residual connection
    hidden_out[idx] = hidden_in[idx] + out_val;
}
```

**Step 2: Commit**

```bash
git add systems/infinite_map_rs/src/shaders/pixel_brain_attention.wgsl
git commit -m "feat(shaders): add pixel_brain_attention.wgsl for self-attention"
```

---

### Task 4: Create FFN Shader

**Files:**
- Create: `systems/infinite_map_rs/src/shaders/pixel_brain_ffn.wgsl`

**Step 1: Create the shader file**

```wgsl
// pixel_brain_ffn.wgsl
// Feed-forward network: hidden → expand → ReLU → contract → hidden
//
// FFN(x) = ReLU(x · W_up + b_up) · W_down + b_down
// output = x + FFN(x)  (residual connection)

struct FFNConfig {
    layer: u32,           // Current layer (0-3)
    hidden_dim: u32,      // 256 for Nano
    ffn_dim: u32,         // 1024 for Nano (4x hidden_dim)
    up_offset: u32,       // Up projection weights offset
    down_offset: u32,     // Down projection weights offset
    atlas_size: u32,      // Atlas dimension
}

@group(0) @binding(0) var<uniform> config: FFNConfig;
@group(0) @binding(1) var brain_atlas: texture_2d<f32>;
@group(0) @binding(2) var<storage, read> hidden_in: array<f32>;
@group(0) @binding(3) var<storage, read_write> hidden_out: array<f32>;
@group(0) @binding(4) var<storage, read_write> ffn_buffer: array<f32>;

fn hilbert_d2xy(n: u32, d: u32) -> vec2<u32> {
    var x: u32 = 0u;
    var y: u32 = 0u;
    var s: u32 = 1u;
    var rx: u32 = 0u;
    var ry: u32 = 0u;
    var t: u32 = d;

    while (s < n) {
        ry = (t >> 1u) & 1u;
        rx = (t ^ ry) & 1u;

        if (ry == 0u) {
            if (rx == 1u) {
                x = s - 1u - x;
                y = s - 1u - y;
            }
            let tmp = x;
            x = y;
            y = tmp;
        }

        x += s * rx;
        y += s * ry;
        t >>= 2u;
        s <<= 1u;
    }

    return vec2<u32>(x, y);
}

fn load_weight(offset: u32, row: u32, col: u32, stride: u32) -> f32 {
    let addr = offset + row * stride + col;
    let coords = hilbert_d2xy(config.atlas_size, addr);
    return textureLoad(brain_atlas, vec2<i32>(i32(coords.x), i32(coords.y))).r;
}

fn relu(x: f32) -> f32 {
    return max(0.0, x);
}

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx = global_id.x;

    if (idx >= config.hidden_dim) {
        return;
    }

    // 1. Up projection: ffn_buffer = hidden_in · W_up
    //    Each thread computes one output of the up projection
    //    Note: This is simplified - in practice we'd dispatch differently

    // For thread idx, compute contribution to all ffn_dim outputs
    var down_input: f32 = 0.0;

    for (var j: u32 = 0u; j < config.ffn_dim; j++) {
        // Up projection
        var up_val: f32 = 0.0;
        for (var i: u32 = 0u; i < config.hidden_dim; i++) {
            up_val += hidden_in[i] * load_weight(config.up_offset, j, i, config.hidden_dim);
        }

        // ReLU activation
        let activated = relu(up_val);

        // Accumulate down projection for this output element
        down_input += activated * load_weight(config.down_offset, idx, j, config.ffn_dim);
    }

    // 2. Residual connection
    hidden_out[idx] = hidden_in[idx] + down_input;
}
```

**Step 2: Commit**

```bash
git add systems/infinite_map_rs/src/shaders/pixel_brain_ffn.wgsl
git commit -m "feat(shaders): add pixel_brain_ffn.wgsl for feed-forward network"
```

---

### Task 5: Create PixelBrainInferencer

**Files:**
- Create: `systems/infinite_map_rs/src/pixel_brain/infer.rs`
- Modify: `systems/infinite_map_rs/src/pixel_brain/mod.rs`

**Step 1: Write the failing test**

Create `systems/infinite_map_rs/tests/pixel_brain_infer_test.rs`:

```rust
//! PixelBrain inference tests

use infinite_map_rs::pixel_brain::infer::PixelBrainInferencer;
use infinite_map_rs::pixel_brain::tokenizer::ByteTokenizer;

#[test]
fn test_inferencer_creation() {
    // Test that inferencer can be created (without GPU)
    // This is a placeholder - actual GPU tests require async setup
}

#[test]
fn test_inference_config() {
    // Test that config struct is correct size
    use std::mem::size_of;
    use infinite_map_rs::pixel_brain::infer::EmbedConfig;

    assert_eq!(size_of::<EmbedConfig>(), 16); // 4 x u32
}

#[test]
fn test_model_config() {
    use infinite_map_rs::pixel_brain::infer::ModelConfig;

    let config = ModelConfig::nano();
    assert_eq!(config.hidden_dim, 256);
    assert_eq!(config.n_layers, 4);
    assert_eq!(config.ffn_dim, 1024);
}
```

**Step 2: Run test to verify it fails**

Run: `cargo test --package infinite_map_rs pixel_brain_infer -- --nocapture`
Expected: FAIL with "module not found"

**Step 3: Write minimal implementation**

Create `systems/infinite_map_rs/src/pixel_brain/infer.rs`:

```rust
//! PixelBrain Inference Pipeline
//!
//! Orchestrates GPU inference through embedding, attention, and FFN layers.

use std::sync::Arc;
use wgpu::{Device, Queue, ComputePipeline, BindGroup, Buffer, ShaderModuleDescriptor};

/// Configuration for the embedding shader
#[repr(C)]
#[derive(Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct EmbedConfig {
    pub token_id: u32,
    pub hidden_dim: u32,
    pub embed_offset: u32,
    pub atlas_size: u32,
}

/// Configuration for the attention shader
#[repr(C)]
#[derive(Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct AttentionConfig {
    pub layer: u32,
    pub hidden_dim: u32,
    pub head_dim: u32,
    pub seq_len: u32,
    pub q_offset: u32,
    pub k_offset: u32,
    pub v_offset: u32,
    pub o_offset: u32,
}

/// Configuration for the FFN shader
#[repr(C)]
#[derive(Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct FFNConfig {
    pub layer: u32,
    pub hidden_dim: u32,
    pub ffn_dim: u32,
    pub up_offset: u32,
    pub down_offset: u32,
    pub atlas_size: u32,
    pub _padding: [u32; 2],
}

/// Model configuration
pub struct ModelConfig {
    pub hidden_dim: u32,
    pub n_layers: u32,
    pub n_heads: u32,
    pub ffn_dim: u32,
    pub vocab_size: u32,
    pub atlas_size: u32,
}

impl ModelConfig {
    /// Nano model configuration (1M parameters)
    pub fn nano() -> Self {
        Self {
            hidden_dim: 256,
            n_layers: 4,
            n_heads: 4,
            ffn_dim: 1024,
            vocab_size: 256,
            atlas_size: 4096,
        }
    }
}

/// PixelBrain inference orchestrator
pub struct PixelBrainInferencer {
    device: Arc<Device>,
    queue: Arc<Queue>,
    config: ModelConfig,
    embed_pipeline: Option<ComputePipeline>,
    attention_pipeline: Option<ComputePipeline>,
    ffn_pipeline: Option<ComputePipeline>,
    hidden_buffer: Option<Buffer>,
}

impl PixelBrainInferencer {
    /// Create a new inference orchestrator
    pub fn new(device: Arc<Device>, queue: Arc<Queue>) -> Self {
        Self {
            device,
            queue,
            config: ModelConfig::nano(),
            embed_pipeline: None,
            attention_pipeline: None,
            ffn_pipeline: None,
            hidden_buffer: None,
        }
    }

    /// Create with custom model config
    pub fn with_config(device: Arc<Device>, queue: Arc<Queue>, config: ModelConfig) -> Self {
        Self {
            device,
            queue,
            config,
            embed_pipeline: None,
            attention_pipeline: None,
            ffn_pipeline: None,
            hidden_buffer: None,
        }
    }

    /// Get the model configuration
    pub fn config(&self) -> &ModelConfig {
        &self.config
    }

    /// Infer the next token given the current token
    /// Returns the predicted next token ID
    pub fn infer_token(&mut self, _token_id: u32) -> u32 {
        // TODO: Implement actual inference
        // 1. Dispatch embed shader
        // 2. For each layer: attention + FFN
        // 3. Read logits and sample
        0 // Placeholder
    }

    /// Generate tokens for a prompt
    pub fn generate(&mut self, _prompt: &str, _max_tokens: usize) -> Vec<u32> {
        // TODO: Implement generation loop
        Vec::new()
    }
}
```

**Step 4: Add module to mod.rs**

Add to `systems/infinite_map_rs/src/pixel_brain/mod.rs`:

```rust
pub mod infer;
```

**Step 5: Run test to verify it passes**

Run: `cargo test --package infinite_map_rs pixel_brain_infer -- --nocapture`
Expected: 3 tests pass

**Step 6: Commit**

```bash
git add systems/infinite_map_rs/src/pixel_brain/infer.rs systems/infinite_map_rs/src/pixel_brain/mod.rs systems/infinite_map_rs/tests/pixel_brain_infer_test.rs
git commit -m "feat(pixel_brain): add PixelBrainInferencer orchestrator skeleton"
```

---

### Task 6: Implement Shader Compilation in Inferencer

**Files:**
- Modify: `systems/infinite_map_rs/src/pixel_brain/infer.rs`

**Step 1: Add shader compilation**

Add to `infer.rs`:

```rust
impl PixelBrainInferencer {
    /// Initialize GPU pipelines
    pub fn init_pipelines(&mut self) -> Result<(), String> {
        // Load embed shader
        let embed_shader = self.device.create_shader_module(ShaderModuleDescriptor {
            label: Some("pixel_brain_embed"),
            source: wgpu::ShaderSource::Wgsl(include_str!("../../shaders/pixel_brain_embed.wgsl").into()),
        });

        // Load attention shader
        let attention_shader = self.device.create_shader_module(ShaderModuleDescriptor {
            label: Some("pixel_brain_attention"),
            source: wgpu::ShaderSource::Wgsl(include_str!("../../shaders/pixel_brain_attention.wgsl").into()),
        });

        // Load FFN shader
        let ffn_shader = self.device.create_shader_module(ShaderModuleDescriptor {
            label: Some("pixel_brain_ffn"),
            source: wgpu::ShaderSource::Wgsl(include_str!("../../shaders/pixel_brain_ffn.wgsl").into()),
        });

        // Create pipelines (simplified - actual implementation needs bind group layouts)
        // ...

        Ok(())
    }
}
```

**Step 2: Build to verify**

Run: `cargo build --package infinite_map_rs 2>&1 | tail -20`
Expected: Compiles with only warnings

**Step 3: Commit**

```bash
git add systems/infinite_map_rs/src/pixel_brain/infer.rs
git commit -m "feat(pixel_brain): add shader compilation to inferencer"
```

---

### Task 7: Create Hidden State Buffer

**Files:**
- Modify: `systems/infinite_map_rs/src/pixel_brain/infer.rs`

**Step 1: Add hidden state buffer creation**

```rust
impl PixelBrainInferencer {
    /// Create hidden state buffer
    fn create_hidden_buffer(&self) -> Buffer {
        let size = (self.config.hidden_dim as usize * std::mem::size_of::<f32>()) as u64;

        self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("hidden_state_buffer"),
            size,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_SRC | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        })
    }

    /// Initialize buffers for inference
    pub fn init_buffers(&mut self) {
        self.hidden_buffer = Some(self.create_hidden_buffer());
    }
}
```

**Step 2: Build to verify**

Run: `cargo build --package infinite_map_rs 2>&1 | tail -10`
Expected: Compiles successfully

**Step 3: Commit**

```bash
git add systems/infinite_map_rs/src/pixel_brain/infer.rs
git commit -m "feat(pixel_brain): add hidden state buffer management"
```

---

### Task 8: Integrate with gpu_dev_daemon

**Files:**
- Modify: `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs`

**Step 1: Add inferencer to daemon**

```rust
use infinite_map_rs::pixel_brain::infer::PixelBrainInferencer;
use infinite_map_rs::pixel_brain::tokenizer::ByteTokenizer;

// Add static for inferencer
static BRAIN_INFERENCER: OnceLock<Mutex<PixelBrainInferencer>> = OnceLock::new();
static BRAIN_TOKENIZER: OnceLock<ByteTokenizer> = OnceLock::new();

fn get_brain_inferencer() -> Option<&'static Mutex<PixelBrainInferencer>> {
    BRAIN_INFERENCER.get()
}

fn get_brain_tokenizer() -> &'static ByteTokenizer {
    BRAIN_TOKENIZER.get_or_init(ByteTokenizer::new)
}
```

**Step 2: Add /infer endpoint**

Add to HTTP handling section:

```rust
// POST /infer - Generate tokens from prompt
if request_str.starts_with("POST /infer") {
    let body_start = request_str.find("\r\n\r\n").unwrap_or(0) + 4;
    let body = &request_str[body_start..];

    match serde_json::from_str::<serde_json::Value>(body) {
        Ok(json) => {
            let prompt = json["prompt"].as_str().unwrap_or("");
            let max_tokens = json["max_tokens"].as_u64().unwrap_or(32) as usize;

            // Get tokenizer and inferencer
            let tokenizer = get_brain_tokenizer();
            let tokens = tokenizer.encode(prompt);

            // For now, return placeholder (actual inference needs GPU setup)
            let response = serde_json::json!({
                "prompt": prompt,
                "input_tokens": tokens.len(),
                "output_tokens": [],
                "output_text": "",
                "status": "inference_pipeline_initialized"
            });

            let http_response = format!(
                "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{}\n",
                serde_json::to_string(&response).unwrap_or_default()
            );
            let _ = stream.write_all(http_response.as_bytes());
        }
        Err(e) => {
            let error_response = format!(
                "HTTP/1.1 400 Bad Request\r\nContent-Type: application/json\r\n\r\n{{\"error\":\"{}\"}}\n",
                e
            );
            let _ = stream.write_all(error_response.as_bytes());
        }
    }
    return;
}
```

**Step 3: Build to verify**

Run: `cargo build --bin gpu_dev_daemon 2>&1 | tail -15`
Expected: Compiles with only warnings

**Step 4: Commit**

```bash
git add systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs
git commit -m "feat(gpu_daemon): add /infer endpoint for PixelBrain inference"
```

---

### Task 9: Final Verification

**Step 1: Run all tests**

Run: `cargo test --package infinite_map_rs -- --nocapture 2>&1 | tail -30`
Expected: All tests pass

**Step 2: Verify daemon builds**

Run: `cargo build --bin gpu_dev_daemon 2>&1 | tail -10`
Expected: Build succeeds

**Step 3: Test /infer endpoint (manual)**

```bash
curl -X POST http://localhost:9889/infer \
  -H "Content-Type: application/json" \
  -d '{"prompt": "hello", "max_tokens": 10}'
```

Expected: JSON response with status "inference_pipeline_initialized"

**Step 4: Final commit (if any fixes needed)**

```bash
git status
# If clean, no commit needed
```

---

## Summary

| Task | Description | Commits |
|------|-------------|---------|
| 1 | Create ByteTokenizer | 1 |
| 2 | Create Embedding Shader | 1 |
| 3 | Create Attention Shader | 1 |
| 4 | Create FFN Shader | 1 |
| 5 | Create PixelBrainInferencer | 1 |
| 6 | Implement Shader Compilation | 1 |
| 7 | Create Hidden State Buffer | 1 |
| 8 | Integrate with gpu_dev_daemon | 1 |
| 9 | Final Verification | 0-1 |

**Total: 8-9 commits**

## Next Steps (Future Work)

After this plan is complete:
1. Wire up actual GPU dispatch in `infer_token()`
2. Add sampling logic (greedy/softmax)
3. Test with actual model weights
4. Add multi-head attention support
5. Implement KV-cache for efficient generation
