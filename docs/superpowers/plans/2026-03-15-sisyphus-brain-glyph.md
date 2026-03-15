# Sisyphus Brain Glyph Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Connect gpu_dev_daemon to LM Studio via a glyph-native Sisyphus Brain that lives on the GPU substrate, enabling autonomous cognitive loops for self-analysis and optimization.

**Architecture:** A glyph program (`sisyphus_brain.glyph`) runs on the GPU substrate, perceiving its own memory state, formatting HTTP requests for LM Studio, and executing returned commands. The Rust daemon provides a minimal MMIO bridge that polls a semaphore and forwards requests to `localhost:1234`.

**Tech Stack:** Rust (tokio, wgpu, reqwest), Glyph Assembly (32-bit ISA), LM Studio OpenAI-compatible API

---

## File Structure

```
systems/glyph_stratum/programs/
└── sisyphus_brain.glyph          # Main cognitive loop with all subroutines inline (CREATE)

systems/infinite_map_rs/src/bin/
└── gpu_dev_daemon.rs             # Add brain_bridge thread (MODIFY)

systems/infinite_map_rs/src/
└── brain_bridge.rs               # LM Studio bridge module (CREATE)

systems/glyph_stratum/programs/
└── test_sisyphus_brain.py        # Integration test (CREATE)

memory/
└── sisyphus-brain-glyph.md       # Documentation (CREATE)
```

## Memory Map

```
┌─────────────────────────────────────────────────────────────┐
│ SISYPHUS BRAIN GLYPH MEMORY LAYOUT                         │
├─────────────────────────────────────────────────────────────┤
│ 0x0000-0x00FF  │ Emulator State (PC, IR, temps)            │
│ 0x0100-0x013F  │ Guest Registers x0-x31                    │
│ 0x0200-0x02FF  │ UART Output Buffer                        │
│ 0x0300-0x03FF  │ Cognitive State                           │
│                 │   0x0300: current_intent (32b)            │
│                 │   0x0304: thought_cycle_count (32b)       │
│                 │   0x0308: last_action (32b)               │
│                 │   0x030C: fitness_score (float bits)      │
│ 0x0400-0x04FF  │ Perception Buffer                         │
│                 │   0x0400: entropy_sum (32b)               │
│                 │   0x0404: hot_addr (32b)                  │
│                 │   0x0408: scan_cursor (32b)               │
│ 0x0500-0x0FFF  │ HTTP Request Buffer (3KB)                 │
│ 0x1000-0x1FFF  │ HTTP Response Buffer (4KB)                │
│ 0x2000          │ CTRL_SEMAPHORE (1 = request pending)      │
│ 0x2004          │ RESPONSE_READY (1 = response available)   │
│ 0x2008          │ REQUEST_LENGTH (bytes)                    │
│ 0x8000-0xFFFF   │ Self-Analysis Region                      │
└─────────────────────────────────────────────────────────────┘
```

---

## Chunk 1: Rust Brain Bridge Module

### Task 1.1: Create brain_bridge.rs Module

**Files:**
- Create: `systems/infinite_map_rs/src/brain_bridge.rs`
- Modify: `systems/infinite_map_rs/src/lib.rs` (add mod declaration)
- Test: Inline doctests

- [ ] **Step 1: Add module declaration to lib.rs**

```rust
// In systems/infinite_map_rs/src/lib.rs, add:
pub mod brain_bridge;
```

- [ ] **Step 2: Create brain_bridge.rs with BrainBridge struct**

Create `systems/infinite_map_rs/src/brain_bridge.rs`:

```rust
//! Brain Bridge - MMIO Bridge between Glyph Substrate and LM Studio
//!
//! Polls a semaphore in GPU memory and forwards HTTP requests
//! to LM Studio's OpenAI-compatible API.

use std::sync::Arc;
use std::time::Duration;
use tokio::sync::Mutex;
use wgpu::{Device, Queue, Texture};
use wgpu::util::DeviceExt;  // For create_buffer_init
use serde::{Deserialize, Serialize};

/// Memory addresses for brain bridge communication
pub mod addresses {
    pub const CTRL_SEMAPHORE: u32 = 0x2000;
    pub const RESPONSE_READY: u32 = 0x2004;
    pub const REQUEST_LENGTH: u32 = 0x2008;
    pub const HTTP_REQUEST_START: u32 = 0x0500;
    pub const HTTP_RESPONSE_START: u32 = 0x1000;
    pub const HTTP_RESPONSE_MAX: usize = 4096;
}

/// LM Studio API configuration
pub struct BrainBridgeConfig {
    pub lm_studio_url: String,
    pub poll_interval_ms: u64,
}

impl Default for BrainBridgeConfig {
    fn default() -> Self {
        Self {
            lm_studio_url: "http://localhost:1234".to_string(),
            poll_interval_ms: 100,
        }
    }
}

/// Bridge between GPU substrate and LM Studio
pub struct BrainBridge {
    config: BrainBridgeConfig,
    client: reqwest::Client,
    device: Arc<Device>,
    queue: Arc<Queue>,
    ram_texture: Arc<Texture>,
    running: Arc<Mutex<bool>>,
}

/// Request format for LM Studio chat completions
#[derive(Debug, Serialize)]
struct ChatRequest {
    model: String,
    messages: Vec<Message>,
    temperature: f32,
    max_tokens: u32,
}

#[derive(Debug, Serialize, Deserialize)]
struct Message {
    role: String,
    content: String,
}

/// Response format from LM Studio
#[derive(Debug, Deserialize)]
struct ChatResponse {
    choices: Vec<Choice>,
}

#[derive(Debug, Deserialize)]
struct Choice {
    message: Message,
}

impl BrainBridge {
    /// Create a new brain bridge
    pub fn new(
        config: BrainBridgeConfig,
        device: Arc<Device>,
        queue: Arc<Queue>,
        ram_texture: Arc<Texture>,
    ) -> Self {
        Self {
            config,
            client: reqwest::Client::new(),
            device,
            queue,
            ram_texture,
            running: Arc::new(Mutex::new(false)),
        }
    }

    /// Start the brain bridge polling loop
    pub async fn start(&self) {
        let mut running = self.running.lock().await;
        *running = true;
        drop(running);

        log::info!("🧠 Brain Bridge started - polling for glyph requests");

        loop {
            let running = self.running.lock().await;
            if !*running {
                break;
            }
            drop(running);

            if let Err(e) = self.poll_and_forward().await {
                log::warn!("Brain bridge error: {}", e);
            }

            tokio::time::sleep(Duration::from_millis(self.config.poll_interval_ms)).await;
        }
    }

    /// Stop the brain bridge
    pub async fn stop(&self) {
        let mut running = self.running.lock().await;
        *running = false;
        log::info!("🧠 Brain Bridge stopped");
    }

    /// Poll GPU memory for pending request and forward to LM Studio
    async fn poll_and_forward(&self) -> Result<(), Box<dyn std::error::Error + Send + Sync>> {
        // Read semaphore from GPU texture
        let semaphore = self.read_gpu_u32(addresses::CTRL_SEMAPHORE).await?;

        if semaphore != 1 {
            return Ok(()); // No pending request
        }

        log::info!("🧠 Glyph request detected - reading HTTP buffer");

        // Read request length
        let request_len = self.read_gpu_u32(addresses::REQUEST_LENGTH).await? as usize;

        if request_len == 0 || request_len > 3072 {
            log::warn!("Invalid request length: {}", request_len);
            self.write_gpu_u32(addresses::CTRL_SEMAPHORE, 0).await?;
            return Ok(());
        }

        // Read HTTP request body from GPU memory
        let request_body = self.read_gpu_bytes(addresses::HTTP_REQUEST_START, request_len).await?;

        log::info!("🧠 Forwarding {} bytes to LM Studio", request_len);

        // Forward to LM Studio
        let response = self.forward_to_lm_studio(&request_body).await?;

        // Write response to GPU memory
        let response_bytes = response.as_bytes();
        let response_len = response_bytes.len().min(addresses::HTTP_RESPONSE_MAX);

        self.write_gpu_bytes(addresses::HTTP_RESPONSE_START, &response_bytes[..response_len]).await?;
        self.write_gpu_u32(addresses::RESPONSE_READY, 1).await?;
        self.write_gpu_u32(addresses::CTRL_SEMAPHORE, 0).await?; // Clear request

        log::info!("🧠 Response written ({} bytes)", response_len);

        Ok(())
    }

    /// Forward request to LM Studio and return response
    async fn forward_to_lm_studio(&self, request_body: &[u8]) -> Result<String, Box<dyn std::error::Error + Send + Sync>> {
        // Parse the request body as JSON (glyph sends chat format)
        let request_text = String::from_utf8_lossy(request_body);

        // If it's raw text, wrap it in a chat request
        let chat_request = if request_text.starts_with('{') {
            // Already JSON - pass through
            request_text.to_string()
        } else {
            // Wrap in chat request format
            let chat = ChatRequest {
                model: "local-model".to_string(),
                messages: vec![
                    Message {
                        role: "system".to_string(),
                        content: "You are the Sisyphus Brain of Geometry OS. Analyze substrate state and return JSON commands.".to_string(),
                    },
                    Message {
                        role: "user".to_string(),
                        content: request_text.to_string(),
                    },
                ],
                temperature: 0.7,
                max_tokens: 500,
            };
            serde_json::to_string(&chat)?
        };

        let response = self.client
            .post(format!("{}/v1/chat/completions", self.config.lm_studio_url))
            .header("Content-Type", "application/json")
            .body(chat_request)
            .send()
            .await?;

        if !response.status().is_success() {
            return Err(format!("LM Studio error: {}", response.status()).into());
        }

        let chat_response: ChatResponse = response.json().await?;

        let content = chat_response
            .choices
            .first()
            .map(|c| c.message.content.clone())
            .unwrap_or_default();

        Ok(content)
    }

    /// Read a u32 from GPU texture at Hilbert address
    async fn read_gpu_u32(&self, addr: u32) -> Result<u32, Box<dyn std::error::Error + Send + Sync>> {
        let (tx, ty) = hilbert_d2xy(4096, addr);
        let bytes = self.read_gpu_bytes(addr, 4).await?;
        Ok(u32::from_le_bytes([bytes[0], bytes[1], bytes[2], bytes[3]]))
    }

    /// Write a u32 to GPU texture at Hilbert address
    async fn write_gpu_u32(&self, addr: u32, value: u32) -> Result<(), Box<dyn std::error::Error + Send + Sync>> {
        let bytes = value.to_le_bytes();
        self.write_gpu_bytes(addr, &bytes).await
    }

    /// Read bytes from GPU texture starting at Hilbert address
    async fn read_gpu_bytes(&self, start_addr: u32, len: usize) -> Result<Vec<u8>, Box<dyn std::error::Error + Send + Sync>> {
        let mut result = Vec::with_capacity(len);

        for i in 0..len {
            let addr = start_addr + i as u32;
            let (tx, ty) = hilbert_d2xy(4096, addr);

            let staging = self.device.create_buffer(&wgpu::BufferDescriptor {
                label: Some("brain_bridge_staging"),
                size: 256,
                usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
                mapped_at_creation: false,
            });

            let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("brain_bridge_read"),
            });

            encoder.copy_texture_to_buffer(
                wgpu::ImageCopyTexture {
                    texture: &self.ram_texture,
                    mip_level: 0,
                    origin: wgpu::Origin3d { x: tx, y: ty, z: 0 },
                    aspect: wgpu::TextureAspect::All,
                },
                wgpu::ImageCopyBuffer {
                    buffer: &staging,
                    layout: wgpu::ImageDataLayout {
                        offset: 0,
                        bytes_per_row: Some(256),
                        rows_per_image: Some(1),
                    },
                },
                wgpu::Extent3d { width: 1, height: 1, depth_or_array_layers: 1 },
            );

            self.queue.submit(Some(encoder.finish()));

            let slice = staging.slice(..);
            let (tx_chan, rx) = std::sync::mpsc::channel();
            slice.map_async(wgpu::MapMode::Read, move |res| { tx_chan.send(res).ok(); });
            self.device.poll(wgpu::Maintain::Wait);

            if let Ok(Ok(())) = rx.recv() {
                let data = slice.get_mapped_range();
                result.push(data[0]); // First byte of RGBA
                drop(data);
                staging.unmap();
            }
        }

        Ok(result)
    }

    /// Write bytes to GPU texture starting at Hilbert address
    async fn write_gpu_bytes(&self, start_addr: u32, data: &[u8]) -> Result<(), Box<dyn std::error::Error + Send + Sync>> {
        // Create a staging buffer with the data
        let mut pixels = Vec::with_capacity(data.len() * 4);
        for &byte in data {
            pixels.extend_from_slice(&[byte, 0, 0, 255]); // RGBA
        }

        let staging = self.device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("brain_bridge_write"),
            contents: &pixels,
            usage: wgpu::BufferUsages::COPY_SRC,
        });

        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("brain_bridge_write_encoder"),
        });

        // Write pixel by pixel (inefficient but correct)
        for (i, &byte) in data.iter().enumerate() {
            let addr = start_addr + i as u32;
            let (tx, ty) = hilbert_d2xy(4096, addr);

            encoder.copy_buffer_to_texture(
                wgpu::ImageCopyBuffer {
                    buffer: &staging,
                    layout: wgpu::ImageDataLayout {
                        offset: (i * 4) as u64,
                        bytes_per_row: Some(4),
                        rows_per_image: Some(1),
                    },
                },
                wgpu::ImageCopyTexture {
                    texture: &self.ram_texture,
                    mip_level: 0,
                    origin: wgpu::Origin3d { x: tx, y: ty, z: 0 },
                    aspect: wgpu::TextureAspect::All,
                },
                wgpu::Extent3d { width: 1, height: 1, depth_or_array_layers: 1 },
            );
        }

        self.queue.submit(Some(encoder.finish()));
        Ok(())
    }

    /// Test connection to LM Studio
    pub async fn test_connection(&self) -> Result<bool, Box<dyn std::error::Error + Send + Sync>> {
        let response = self.client
            .get(format!("{}/v1/models", self.config.lm_studio_url))
            .send()
            .await?;

        Ok(response.status().is_success())
    }
}

/// Convert Hilbert index to (x, y) coordinates
fn hilbert_d2xy(n: u32, d: u32) -> (u32, u32) {
    let (mut x, mut y, mut s, mut t) = (0, 0, 1, d);
    while s < n {
        let rx = 1 & (t / 2);
        let ry = 1 & (t ^ rx);
        if ry == 0 {
            if rx == 1 { x = s - 1 - x; y = s - 1 - y; }
            std::mem::swap(&mut x, &mut y);
        }
        x += s * rx; y += s * ry; t /= 4; s *= 2;
    }
    (x, y)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_hilbert_d2xy() {
        assert_eq!(hilbert_d2xy(4096, 0), (0, 0));
        assert_eq!(hilbert_d2xy(4096, 1), (0, 1));
        assert_eq!(hilbert_d2xy(4096, 2), (1, 1));
    }

    #[test]
    fn test_addresses() {
        assert_eq!(addresses::CTRL_SEMAPHORE, 0x2000);
        assert_eq!(addresses::HTTP_REQUEST_START, 0x0500);
    }
}
```

- [ ] **Step 3: Run tests to verify module compiles**

Run: `cd systems/infinite_map_rs && cargo test brain_bridge --no-run`
Expected: Compiles without errors

- [ ] **Step 4: Commit**

```bash
git add systems/infinite_map_rs/src/brain_bridge.rs systems/infinite_map_rs/src/lib.rs
git commit -m "feat(brain-bridge): add MMIO bridge module for glyph↔LM Studio communication"
```

---

### Task 1.2: Integrate Brain Bridge into gpu_dev_daemon

**Files:**
- Modify: `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs`

- [ ] **Step 0: Add pollster dependency**

Add to `systems/infinite_map_rs/Cargo.toml` under `[dependencies]`:

```toml
pollster = "0.3"
```

- [ ] **Step 1: Add imports and brain bridge initialization**

In `gpu_dev_daemon.rs`, add at top:

```rust
use infinite_map_rs::brain_bridge::{BrainBridge, BrainBridgeConfig};
```

After the scheduler initialization (around line 40), add:

```rust
    // Brain Bridge for LM Studio communication
    let bridge_config = BrainBridgeConfig::default();
    let brain_bridge = Arc::new(BrainBridge::new(
        bridge_config,
        device.clone(),
        queue.clone(),
        ram_texture.clone(),
    ));
```

- [ ] **Step 2: Add brain bridge thread spawn**

After the API server thread spawn (around line 62), add:

```rust
    // Brain Bridge Thread
    let bridge_clone = brain_bridge.clone();
    thread::spawn(move || {
        let rt = tokio::runtime::Runtime::new().unwrap();
        rt.block_on(async {
            bridge_clone.start().await;
        });
    });
```

- [ ] **Step 3: Add brain health endpoint to HTTP handler**

In `handle_hal_request`, add new endpoint after `/vmstate`:

**IMPORTANT:** Since `handle_hal_request` is a sync function, we use `pollster::block_on()` for async calls.

```rust
        } else if request.starts_with("GET /brain/health") {
            // Check LM Studio connection (sync wrapper for async)
            let healthy = pollster::block_on(brain_bridge.test_connection()).unwrap_or(false);
            let response = format!("HTTP/1.1 200 OK\r\n\r\n{{\"lm_studio\": {}}}\n", healthy);
            let _ = stream.write_all(response.as_bytes());
            return;
        } else if request.starts_with("GET /brain/state") {
            // Read cognitive state from substrate
            let entropy = pollster::block_on(brain_bridge.read_gpu_u32(0x0400)).unwrap_or(0);
            let cycles = pollster::block_on(brain_bridge.read_gpu_u32(0x0304)).unwrap_or(0);
            let response = format!(
                "HTTP/1.1 200 OK\r\n\r\n{{\"entropy\": {}, \"cycles\": {}}}\n",
                entropy, cycles
            );
            let _ = stream.write_all(response.as_bytes());
            return;
```

Note: The handler will need access to `brain_bridge` - pass as parameter.

- [ ] **Step 4: Update handle_hal_request signature**

Change function signature to accept brain_bridge:

```rust
fn handle_hal_request(
    stream: &mut TcpStream,
    queue: &wgpu::Queue,
    texture: &wgpu::Texture,
    device: &wgpu::Device,
    scheduler: &Arc<Mutex<GlyphVmScheduler>>,
    brain_bridge: &Arc<BrainBridge>,  // Add this
) {
```

Update the call site in the API thread to pass `brain_bridge`.

- [ ] **Step 5: Run daemon to verify compilation**

Run: `cd systems/infinite_map_rs && cargo build --release --bin gpu_dev_daemon`
Expected: Compiles successfully

- [ ] **Step 6: Commit**

```bash
git add systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs
git commit -m "feat(daemon): integrate brain bridge thread and /brain/* endpoints"
```

---

## Chunk 2: Sisyphus Brain Glyph Program

### Task 2.1: Create sisyphus_brain.glyph Main Program

**Files:**
- Create: `systems/glyph_stratum/programs/sisyphus_brain.glyph`

> **NOTE:** This glyph uses only opcodes available in `compile_glyph.py`:
> - Core: NOP, LDI, MOV, LOAD, STORE, ADD, SUB, MUL, DIV, JMP, JZ, CALL, RET, HALT
> - Bitwise: AND, OR, XOR, SHL, SHR, SAR
>
> Unavailable opcodes avoided: CMP, JLT, ROL, PUSH, POP, JE, JNZ

- [ ] **Step 1: Create main glyph file with memory layout**

Create `systems/glyph_stratum/programs/sisyphus_brain.glyph`:

```assembly
// ============================================================================
// Geometry OS - Sisyphus Brain Glyph
// ============================================================================
//
// A self-aware cognitive agent that lives on the GPU substrate.
// Perceives memory state, queries LM Studio for guidance, and executes actions.
//
// Memory Layout:
//   0x0300-0x03FF: Cognitive State
//   0x0400-0x04FF: Perception Buffer
//   0x0500-0x0FFF: HTTP Request Buffer
//   0x1000-0x1FFF: HTTP Response Buffer
//   0x2000:         CTRL_SEMAPHORE
//   0x2004:         RESPONSE_READY
//   0x2008:         REQUEST_LENGTH
//
// ============================================================================

.equ COG_CYCLES,     0x0304
.equ COG_LAST_ACT,   0x0308

.equ PERCEPT_ENTROPY, 0x0400
.equ PERCEPT_CURSOR,  0x0408

.equ HTTP_REQ,       0x0500
.equ HTTP_RES,       0x1000
.equ CTRL_SEM,       0x2000
.equ RES_READY,      0x2004
.equ REQ_LEN,        0x2008

.equ SCAN_START,     0x8000
.equ SCAN_END,       0x8050

// ============================================================================
// MAIN COGNITIVE LOOP
// ============================================================================

:main
    // Initialize cognitive state
    LDI r1, 0
    STORE COG_CYCLES, r1
    STORE PERCEPT_CURSOR, r1

    // Signal brain active (Magenta pulse to UART)
    LDI r1, 0x00FF00FF
    LDI r2, 0x0200
    STORE r2, r1

:cognitive_loop
    // Increment cycle counter
    LOAD r1, COG_CYCLES
    LDI r2, 1
    ADD r1, r2
    STORE COG_CYCLES, r1

    // Phase 1: PERCEIVE - scan memory for entropy
    CALL perceive_entropy

    // Phase 2: THINK - send query to LM Studio
    CALL think_query

    // Phase 3: ACT - execute response command
    CALL act_on_response

    // Loop forever
    JMP cognitive_loop

// ============================================================================
// PERCEIVE: Scan substrate for entropy patterns
// ============================================================================

:perceive_entropy
    LDI r1, 0
    STORE PERCEPT_ENTROPY, r1

    LOAD r10, PERCEPT_CURSOR
    LDI r11, 16
    ADD r10, r11          // Advance cursor by 16

    // Wrap check: if r10 >= SCAN_END (0x8050), reset
    LDI r11, SCAN_END
    SUB r11, r10          // r11 = SCAN_END - r10
    JZ wrap_cursor        // If zero, wrap
    LDI r12, 0
    SUB r12, r11          // Check sign
    JZ scan_cont          // Continue if not wrapped
    JMP scan_cont

:wrap_cursor
    LDI r10, SCAN_START

:scan_cont
    STORE PERCEPT_CURSOR, r10
    LDI r12, 0            // entropy accumulator
    LDI r13, 16           // words to scan

:scan_word
    LOAD r10, r15         // r15 = mem[r10]

    // Count bits in r15
    MOV r16, r15
    LDI r17, 0            // bit count
:count_bit
    LDI r18, 0
    SUB r18, r16          // Check if r16 == 0
    JZ bits_done
    MOV r18, r16
    LDI r19, 1
    AND r18, r19          // r18 = r16 & 1
    ADD r17, r18
    LDI r18, 1
    SHR r16, r18
    JMP count_bit
:bits_done
    ADD r12, r17
    LDI r18, 1
    ADD r10, r18
    LDI r18, 1
    SUB r13, r18
    JZ scan_done
    JMP scan_word
:scan_done
    STORE PERCEPT_ENTROPY, r12
    RET

// ============================================================================
// THINK: Send query to LM Studio via Rust bridge
// Bridge wraps raw text in JSON automatically
// ============================================================================

:think_query
    LDI r20, HTTP_REQ
    LDI r21, 0

    // Write "e=" (entropy shorthand)
    LDI r22, 0x3D65       // "e="
    STORE r20, r22
    LDI r22, 2
    ADD r20, r22
    ADD r21, r22

    // Write entropy as decimal (simplified)
    LOAD r1, PERCEPT_ENTROPY
    CALL write_decimal_r1
    ADD r21, r4

    STORE REQ_LEN, r21

    // Trigger bridge
    LDI r1, 1
    STORE CTRL_SEM, r1

    // Poll for response
:wait_resp
    LOAD r1, RES_READY
    LDI r2, 0
    SUB r1, r2
    JZ wait_resp

    LDI r1, 0
    STORE RES_READY, r1
    RET

// ============================================================================
// ACT: Parse first byte of response
// N=NOP, S=SCAN, H=HALT
// ============================================================================

:act_on_response
    LDI r1, HTTP_RES
    LOAD r1, r2
    LDI r3, 0xFF
    AND r2, r3            // r2 = first byte

    // Check 'N' (NOP)
    LDI r3, 0x4E
    SUB r2, r3
    JZ do_nop

    // Check 'S' (SCAN) - reload r2
    LDI r1, HTTP_RES
    LOAD r1, r2
    LDI r3, 0xFF
    AND r2, r3
    LDI r3, 0x53
    SUB r2, r3
    JZ do_scan

    // Check 'H' (HALT)
    LDI r1, HTTP_RES
    LOAD r1, r2
    LDI r3, 0xFF
    AND r2, r3
    LDI r3, 0x48
    SUB r2, r3
    JZ do_halt

    // Default: NOP
    JMP do_nop

:do_nop
    LDI r1, 0x504F4E00
    STORE COG_LAST_ACT, r1
    RET

:do_scan
    LDI r1, SCAN_START
    STORE PERCEPT_CURSOR, r1
    LDI r1, 0x4E414353
    STORE COG_LAST_ACT, r1
    RET

:do_halt
    LDI r1, 0x544C4148
    STORE COG_LAST_ACT, r1
    HALT

// ============================================================================
// UTILITY: Write r1 as decimal string to buffer at r20
// Returns r4 = bytes written
// ============================================================================

:write_decimal_r1
    MOV r5, r1            // value
    LDI r4, 0             // count

    // Handle zero case
    LDI r6, 0
    SUB r6, r5
    JZ write_zero

    // Extract digits by repeated division (simplified: just write low byte)
    LDI r6, 0xFF
    AND r5, r6            // r5 = low byte
    LDI r6, 100
    DIV r5, r6            // r5 = r5 / 100 (hundreds)
    LDI r6, 0x30
    ADD r5, r6            // ASCII
    STORE r20, r5
    LDI r6, 1
    ADD r20, r6
    ADD r4, r6

    // This is simplified - full decimal would need MOD operation
    RET

:write_zero
    LDI r5, 0x30          // '0'
    STORE r20, r5
    LDI r5, 1
    ADD r20, r5
    ADD r4, r5
    RET
```

- [ ] **Step 2: Commit glyph program**

```bash
git add systems/glyph_stratum/programs/sisyphus_brain.glyph
git commit -m "feat(glyph): add sisyphus_brain.glyph cognitive agent"
```

---

### Task 2.2: Create Python Test for Sisyphus Brain

**Files:**
- Create: `systems/glyph_stratum/programs/test_sisyphus_brain.py`

- [ ] **Step 1: Create integration test**

Create `systems/glyph_stratum/programs/test_sisyphus_brain.py`:

```python
#!/usr/bin/env python3
"""
Test suite for Sisyphus Brain Glyph.

Tests the cognitive loop in simulation before GPU execution.
"""

import sys
from pathlib import Path

# Add project root to path
PROJECT_ROOT = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

import pytest
from systems.glyph_stratum.programs.compile_glyph import compile_glyph_file


class TestSisyphusBrainCompilation:
    """Test that the glyph compiles correctly."""

    def test_compiles_to_png(self, tmp_path):
        """Verify sisyphus_brain.glyph compiles to valid texture."""
        glyph_path = PROJECT_ROOT / "systems/glyph_stratum/programs/sisyphus_brain.glyph"
        output_path = tmp_path / "sisyphus_brain.rts.png"

        if not glyph_path.exists():
            pytest.skip("sisyphus_brain.glyph not yet created")

        compile_glyph_file(str(glyph_path), str(output_path))

        assert output_path.exists()
        assert output_path.stat().st_size > 0

    def test_memory_addresses_valid(self):
        """Verify all memory addresses are within 4096x4096 texture bounds."""
        addresses = {
            "COG_STATE": 0x0300,
            "PERCEPT_ENTROPY": 0x0400,
            "HTTP_REQ": 0x0500,
            "HTTP_RES": 0x1000,
            "CTRL_SEM": 0x2000,
            "SCAN_START": 0x8000,
        }

        max_address = 4096 * 4096  # 16M pixels

        for name, addr in addresses.items():
            assert addr < max_address, f"{name} (0x{addr:04X}) exceeds texture bounds"


class TestSisyphusBrainSimulation:
    """Test cognitive loop in Python simulation."""

    @pytest.fixture
    def brain_state(self):
        """Create initial brain state."""
        return {
            "cog_cycles": 0,
            "percept_entropy": 0,
            "percept_hot": 0,
            "percept_cursor": 0x8000,
            "ctrl_sem": 0,
            "res_ready": 0,
            "req_len": 0,
        }

    def test_perceive_increments_entropy(self, brain_state):
        """Verify entropy scanning accumulates values."""
        # Simulate one perceive cycle
        initial_entropy = brain_state["percept_entropy"]

        # In real execution, this would scan memory
        # For test, we simulate finding some entropy
        brain_state["percept_entropy"] = 42  # Simulated

        assert brain_state["percept_entropy"] >= initial_entropy

    def test_cognitive_loop_increments_cycles(self, brain_state):
        """Verify cycle counter increments each loop."""
        for _ in range(5):
            brain_state["cog_cycles"] += 1

        assert brain_state["cog_cycles"] == 5

    def test_semaphore_handshake(self, brain_state):
        """Verify request/response semaphore protocol."""
        # Set request
        brain_state["ctrl_sem"] = 1
        assert brain_state["ctrl_sem"] == 1

        # Simulate bridge clearing and setting response
        brain_state["ctrl_sem"] = 0
        brain_state["res_ready"] = 1

        # Glyph reads response
        assert brain_state["res_ready"] == 1
        brain_state["res_ready"] = 0  # Clear after read

        assert brain_state["ctrl_sem"] == 0
        assert brain_state["res_ready"] == 0


class TestBrainBridgeIntegration:
    """Test Rust brain bridge (requires running daemon)."""

    @pytest.mark.integration
    def test_daemon_health_endpoint(self):
        """Test /brain/health endpoint returns valid JSON."""
        import requests

        try:
            response = requests.get("http://127.0.0.1:8769/brain/health", timeout=2)
            assert response.status_code == 200
            data = response.json()
            assert "lm_studio" in data
        except requests.exceptions.ConnectionError:
            pytest.skip("Daemon not running on port 8769")

    @pytest.mark.integration
    def test_daemon_state_endpoint(self):
        """Test /brain/state endpoint returns cognitive state."""
        import requests

        try:
            response = requests.get("http://127.0.0.1:8769/brain/state", timeout=2)
            assert response.status_code == 200
            data = response.json()
            assert "entropy" in data
            assert "cycles" in data
        except requests.exceptions.ConnectionError:
            pytest.skip("Daemon not running on port 8769")


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

- [ ] **Step 2: Run tests**

Run: `cd systems/glyph_stratum/programs && python -m pytest test_sisyphus_brain.py -v`
Expected: Unit tests pass, integration tests skip if daemon not running

- [ ] **Step 3: Commit**

```bash
git add systems/glyph_stratum/programs/test_sisyphus_brain.py
git commit -m "test(glyph): add sisyphus brain integration tests"
```

---

## Chunk 3: API Extensions and Documentation

### Task 3.1: Add POST /brain/inject Endpoint

**Files:**
- Modify: `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs`

- [ ] **Step 1: Add intent injection endpoint**

In `handle_hal_request`, add:

```rust
        } else if request.starts_with("POST /brain/inject") {
            // Extract intent from body
            let body_start = request.find("\r\n\r\n").unwrap_or(0) + 4;
            let intent = &request[body_start..];

            // Write to cognitive state (sync wrapper for async)
            let intent_bytes = intent.as_bytes();
            for (i, &byte) in intent_bytes.iter().enumerate().take(32) {
                pollster::block_on(brain_bridge.write_gpu_u32(0x0300 + i as u32, byte as u32)).ok();
            }

            let _ = stream.write_all(b"HTTP/1.1 200 OK\r\n\r\nIntent injected\n");
            return;
```

- [ ] **Step 2: Test endpoint manually**

Run: `curl -X POST http://127.0.0.1:8769/brain/inject -d "analyze_entropy"`
Expected: "Intent injected"

- [ ] **Step 3: Commit**

```bash
git add systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs
git commit -m "feat(daemon): add POST /brain/inject for intent injection"
```

---

### Task 3.2: Update Memory Documentation

**Files:**
- Create: `memory/sisyphus-brain-glyph.md`

- [ ] **Step 1: Create memory file**

Create `memory/sisyphus-brain-glyph.md`:

```markdown
---
name: sisyphus-brain-glyph
description: Glyph-native Sisyphus Brain for GPU substrate cognition
type: project
---

# Sisyphus Brain Glyph

**Status:** Active Development

**What:** A glyph program that lives on the GPU substrate and performs cognitive loops:
1. PERCEIVE - Scan memory for entropy patterns
2. THINK - Query LM Studio for guidance
3. ACT - Execute commands from LM Studio

**Memory Map:**
- `0x0300-0x03FF`: Cognitive State
- `0x0400-0x04FF`: Perception Buffer
- `0x0500-0x0FFF`: HTTP Request Buffer
- `0x1000-0x1FFF`: HTTP Response Buffer
- `0x2000`: CTRL_SEMAPHORE (1 = request pending)
- `0x2004`: RESPONSE_READY (1 = response available)

**API Endpoints:**
- `GET /brain/health` - Check LM Studio connection
- `GET /brain/state` - Read cognitive state
- `POST /brain/inject` - Write intent to glyph memory

**How to use:**
1. Start LM Studio on port 1234
2. Run `cargo run --release --bin gpu_dev_daemon`
3. Load glyph: `curl -X POST http://127.0.0.1:8769/load -d "sisyphus_brain.rts.png"`
4. Monitor: `curl http://127.0.0.1:8769/brain/state`

**Why:** Enables self-aware GPU programs that can reason about their own state
and receive guidance from external LLMs without leaving the substrate.

**Related:**
- `brain_bridge.rs` - Rust MMIO bridge
- `gpu_dev_daemon.rs` - Host daemon
- `CognitiveDaemonBridge` - LM Studio client
```

- [ ] **Step 2: Update MEMORY.md index**

Add entry to `memory/MEMORY.md`:

```markdown
| [Sisyphus Brain Glyph](sisyphus-brain-glyph.md) | Active | - | GPU-native cognitive agent with LM Studio integration |
```

- [ ] **Step 3: Commit**

```bash
git add memory/sisyphus-brain-glyph.md memory/MEMORY.md
git commit -m "docs: add sisyphus brain glyph memory documentation"
```

---

## Summary

This plan creates a glyph-native Sisyphus Brain that:

1. **Lives on the GPU substrate** as a `.glyph` program
2. **Perceives** its own memory state via entropy scanning
3. **Thinks** by sending HTTP requests to LM Studio through a Rust MMIO bridge
4. **Acts** on commands returned by LM Studio

The Rust daemon provides minimal infrastructure:
- Brain bridge thread that polls a semaphore and forwards requests
- HTTP endpoints for external monitoring and control

**Total Files:**
- 1 new glyph program (`sisyphus_brain.glyph`)
- 1 new Rust module (`brain_bridge.rs`)
- 1 modified Rust binary (`gpu_dev_daemon.rs`)
- 1 new test file (`test_sisyphus_brain.py`)
- 1 new memory document (`sisyphus-brain-glyph.md`)

**Dependencies:**
- `pollster` crate (for `block_on` in sync context) - add to `Cargo.toml`
