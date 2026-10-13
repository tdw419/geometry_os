//! NEURAL_GATE — Spatial LLM Bridge for Geometry OS
//!
//! Phase 6.4: Allows spatial programs to prompt a local LLM (Ollama) directly
//! from the spatial substrate. The gate operates on a CPU-side buffer that
//! follows the Transmitter/Trigger/Receiver protocol:
//!
//! ```text
//!   Offset          Size        Purpose
//!   0x0000          0x0400      Transmitter Buffer (256 u32 = 1024 bytes ASCII)
//!   0x0400          0x0004      Trigger Cell (0 = idle, 1 = submit, 2 = processing, 3 = done)
//!   0x0404          0x0004      Response Length (u32, byte count in receiver)
//!   0x0408          0x0400      Receiver Buffer (256 u32 = 1024 bytes ASCII)
//!   0x0808          0x0004      Status (0 = ok, 1 = error, 2 = timeout)
//!   0x080C          0x0004      Model ID (which Ollama model to use)
//! ```
//!
//! The spatial program writes ASCII text into the Transmitter, sets Trigger=1,
//! and polls Trigger until it becomes 3 (done). The response is in the Receiver.

use serde::{Deserialize, Serialize};
use std::sync::Arc;
use tokio::sync::Mutex;

// Phase 6.4.1: Import GeoASM materializer for LLM-generated spatial instructions
use crate::geoasm_materializer::{CellState, GeoasmMaterializer, MaterializeCell, MaterializeRequest};

// ── Protocol constants ─────────────────────────────────────────────────────

/// Total gate memory size in u32 words
pub const GATE_WORDS: usize = 0x0800; // 2048 words = 8192 bytes

/// Byte offsets within the gate buffer (as u32 word indices)
pub const TX_BUFFER_START: usize = 0x000;
pub const TX_BUFFER_WORDS: usize = 256; // 256 words = 1024 bytes

pub const TRIGGER_WORD: usize = 0x100; // offset 0x400
pub const RESPONSE_LEN_WORD: usize = 0x101; // offset 0x404

pub const RX_BUFFER_START: usize = 0x102; // offset 0x408
pub const RX_BUFFER_WORDS: usize = 256; // 256 words = 1024 bytes

pub const STATUS_WORD: usize = 0x202; // offset 0x808
pub const MODEL_ID_WORD: usize = 0x203; // offset 0x80C

/// Trigger values
pub const TRIGGER_IDLE: u32 = 0;
pub const TRIGGER_SUBMIT: u32 = 1;
pub const TRIGGER_PROCESSING: u32 = 2;
pub const TRIGGER_DONE: u32 = 3;

/// Status values
pub const STATUS_OK: u32 = 0;
pub const STATUS_ERROR: u32 = 1;
pub const STATUS_TIMEOUT: u32 = 2;

/// Gate memory as a flat u32 array (CPU-side mirror of the spatial region)
pub type GateMemory = Vec<u32>;

/// Default base address of the NEURAL_GATE in GPU RAM (48MB offset)
pub const NEURAL_GATE_BASE_ADDR: u64 = 0x03000000;

/// A registered NEURAL_GATE instance at a specific base address in RAM
#[derive(Debug)]
pub struct NeuralGateInstance {
    /// Unique identifier for this gate
    pub id: u32,
    /// Base address in guest RAM (byte offset)
    pub base_addr: u64,
    /// CPU-side gate memory
    pub memory: GateMemory,
    /// Pending async request handle (None = idle)
    pub pending: Option<PendingRequest>,
    /// Phase 6.4.1: Materialized cells from LLM response (for GPU upload)
    pub materialized_cells: Option<Vec<crate::geoasm_materializer::CellState>>,
}

/// A pending LLM request that's in-flight
#[derive(Debug)]
pub struct PendingRequest {
    /// The prompt text sent to the LLM
    pub prompt: String,
    /// Timestamp when the request was submitted
    pub submitted_at: std::time::Instant,
    /// Model to use
    pub model: String,
    /// Shared result slot — filled by the async task when complete
    pub result: Arc<Mutex<Option<Result<String, String>>>>,
}

/// Configuration for the NEURAL_GATE system
#[derive(Debug, Clone)]
pub struct NeuralGateConfig {
    /// Ollama API URL (default: http://localhost:11434)
    pub ollama_url: String,
    /// Default model name
    pub default_model: String,
    /// Request timeout in seconds
    pub timeout_secs: u64,
    /// Maximum response length (bytes)
    pub max_response_bytes: usize,
}

impl Default for NeuralGateConfig {
    fn default() -> Self {
        Self {
            ollama_url: "http://localhost:11434".to_string(),
            default_model: "qwen2.5-coder:14b".to_string(),
            timeout_secs: 120,
            max_response_bytes: TX_BUFFER_WORDS * 4, // 1024 bytes
        }
    }
}

/// The NEURAL_GATE manager — tracks all registered gates and polls them
pub struct NeuralGate {
    /// Registered gate instances
    pub gates: Vec<NeuralGateInstance>,
    /// Configuration
    pub config: NeuralGateConfig,
    /// Tokio runtime handle for spawning async LLM requests
    runtime: Option<tokio::runtime::Handle>,
    /// HTTP client (reused across requests)
    client: reqwest::Client,
    /// Next gate ID
    next_id: u32,
}

/// Ollama /api/generate request body
#[derive(Debug, Serialize)]
struct OllamaRequest {
    model: String,
    prompt: String,
    stream: bool,
}

/// Ollama /api/generate response body
#[derive(Debug, Deserialize)]
struct OllamaResponse {
    response: String,
    done: bool,
}

impl NeuralGate {
    /// Create a new NEURAL_GATE manager
    pub fn new(config: NeuralGateConfig) -> Self {
        let client = reqwest::Client::builder()
            .timeout(std::time::Duration::from_secs(config.timeout_secs))
            .build()
            .unwrap_or_else(|_| reqwest::Client::new());

        Self {
            gates: Vec::new(),
            config,
            runtime: None,
            client,
            next_id: 0,
        }
    }

    /// Attach a tokio runtime handle for spawning async requests
    pub fn set_runtime(&mut self, handle: tokio::runtime::Handle) {
        self.runtime = Some(handle);
    }

    /// Register a new NEURAL_GATE at a specific RAM base address
    pub fn register_gate(&mut self, base_addr: u64) -> u32 {
        let id = self.next_id;
        self.next_id += 1;

        let gate = NeuralGateInstance {
            id,
            base_addr,
            memory: vec![0u32; GATE_WORDS],
            pending: None,
            materialized_cells: None,
        };

        log::info!(
            "🧬 NEURAL_GATE: Registered gate {} at RAM offset 0x{:08x}",
            id,
            base_addr
        );

        self.gates.push(gate);
        id
    }

    /// Poll all registered gates — called every frame from update()
    ///
    /// This checks each gate's trigger cell. If SUBMIT is detected, it extracts
    /// the prompt, spawns an async Ollama request, and marks the gate as
    /// PROCESSING. If a pending request has completed, it writes the response
    /// into the receiver buffer and marks the gate as DONE.
    pub fn poll(&mut self) {
        for gate in &mut self.gates {
            let trigger = gate.memory[TRIGGER_WORD];

            match trigger {
                TRIGGER_SUBMIT => {
                    // Extract prompt from transmitter buffer
                    let prompt = read_ascii_from_gate(&gate.memory, TX_BUFFER_START, TX_BUFFER_WORDS);

                    if prompt.is_empty() {
                        log::warn!("🧬 NEURAL_GATE {}: Submit triggered but transmitter is empty", gate.id);
                        gate.memory[STATUS_WORD] = STATUS_ERROR;
                        gate.memory[TRIGGER_WORD] = TRIGGER_DONE;
                        continue;
                    }

                    // Select model
                    let model_id = gate.memory[MODEL_ID_WORD];
                    let model = match model_id {
                        0 => self.config.default_model.clone(),
                        _ => self.config.default_model.clone(), // Future: model table
                    };

                    log::info!(
                        "🧬 NEURAL_GATE {}: Submit detected ({} bytes) → model {}",
                        gate.id,
                        prompt.len(),
                        model
                    );

                    // Spawn async request
                    if let Some(ref handle) = self.runtime {
                        let result = Arc::new(Mutex::new(None));
                        let client = self.client.clone();
                        let url = self.config.ollama_url.clone();
                        let model_clone = model.clone();
                        let prompt_clone = prompt.clone();
                        let result_clone = result.clone();

                        handle.spawn(async move {
                            let res = query_ollama(&client, &url, &model_clone, &prompt_clone).await;
                            *result_clone.lock().await = Some(res);
                        });

                        gate.memory[TRIGGER_WORD] = TRIGGER_PROCESSING;
                        gate.memory[STATUS_WORD] = STATUS_OK;
                        gate.pending = Some(PendingRequest {
                            prompt,
                            submitted_at: std::time::Instant::now(),
                            model,
                            result,
                        });
                    } else {
                        log::error!("🧬 NEURAL_GATE {}: No tokio runtime — cannot query LLM", gate.id);
                        gate.memory[STATUS_WORD] = STATUS_ERROR;
                        gate.memory[TRIGGER_WORD] = TRIGGER_DONE;
                    }
                }

                TRIGGER_PROCESSING => {
                    // Take ownership of pending request to avoid borrow conflicts
                    let pending_opt = gate.pending.take();
                    let mut completed = false;

                    if let Some(pending) = pending_opt {
                        // Try non-blocking lock to check result
                        let result_ready = pending.result.try_lock().ok().map(|mut guard| guard.take());

                        match result_ready {
                            Some(Some(result)) => {
                                completed = true;
                                match result {
                                    Ok(response) => {
                                        // Phase 6.4.1: Try to parse and materialize GeoASM cells
                                        let response_bytes = response.as_bytes();
                                        let mut materialized_cells: Option<Vec<CellState>> = None;

                                        if let Ok(cells) = GeoasmMaterializer::parse_rx_buffer(
                                            response_bytes,
                                            response.len().min(self.config.max_response_bytes),
                                        ) {
                                            log::info!(
                                                "🧬 NEURAL_GATE {}: Parsed {} cells from LLM response",
                                                gate.id,
                                                cells.len()
                                            );

                                            // Create a 128x64 materializer (standard grid size)
                                            let materializer = GeoasmMaterializer::new(128, 64);
                                            let req = MaterializeRequest {
                                                cells,
                                                region_id: None,
                                            };

                                            match materializer.materialize(&req) {
                                                Ok(grid) => {
                                                    materialized_cells = Some(grid.clone());
                                                    log::info!(
                                                        "🧬 NEURAL_GATE {}: Materialized {} cells to spatial grid",
                                                        gate.id,
                                                        grid.len()
                                                    );
                                                    // Store cell count in special word for GPU to read
                                                    gate.memory[RX_BUFFER_START] = grid.len() as u32;
                                                }
                                                Err(e) => {
                                                    log::warn!(
                                                        "🧬 NEURAL_GATE {}: Materialization failed: {:?}",
                                                        gate.id,
                                                        e
                                                    );
                                                }
                                            }
                                        }

                                        // Write response to receiver buffer (or cell count if materialized)
                                        let truncated: &[u8] = if materialized_cells.is_some() {
                                            // If we materialized, write a marker and cell count
                                            "[MATERIALIZED]".as_bytes()
                                        } else if response.len() > self.config.max_response_bytes {
                                            &response.as_bytes()[..self.config.max_response_bytes]
                                        } else {
                                            response.as_bytes()
                                        };

                                        write_ascii_to_gate(
                                            &mut gate.memory,
                                            RX_BUFFER_START,
                                            RX_BUFFER_WORDS,
                                            &String::from_utf8_lossy(truncated),
                                        );

                                        gate.memory[RESPONSE_LEN_WORD] = truncated.len() as u32;
                                        gate.memory[STATUS_WORD] = STATUS_OK;
                                        gate.memory[TRIGGER_WORD] = TRIGGER_DONE;

                                        // Store materialized cells in the gate instance for later GPU upload
                                        if let Some(cells) = materialized_cells {
                                            gate.materialized_cells = Some(cells);
                                        }

                                        log::info!(
                                            "🧬 NEURAL_GATE {}: Response received ({} bytes)",
                                            gate.id,
                                            truncated.len()
                                        );
                                    }
                                    Err(e) => {
                                        log::error!(
                                            "🧬 NEURAL_GATE {}: LLM query failed: {}",
                                            gate.id,
                                            e
                                        );
                                        gate.memory[STATUS_WORD] = STATUS_ERROR;
                                        gate.memory[RESPONSE_LEN_WORD] = 0;
                                        gate.memory[TRIGGER_WORD] = TRIGGER_DONE;
                                    }
                                }
                            }
                            Some(None) => {
                                // Result not ready yet — restore pending
                                gate.pending = Some(pending);
                            }
                            None => {
                                // Lock contended — restore pending
                                gate.pending = Some(pending);
                            }
                        }

                        // Check for timeout (only if pending was restored and not completed)
                        if !completed {
                            if let Some(ref pending) = gate.pending {
                                let elapsed = pending.submitted_at.elapsed();
                                if elapsed.as_secs() > self.config.timeout_secs {
                                    log::error!(
                                        "🧬 NEURAL_GATE {}: Request timed out after {}s",
                                        gate.id,
                                        elapsed.as_secs()
                                    );
                                    gate.memory[STATUS_WORD] = STATUS_TIMEOUT;
                                    gate.memory[TRIGGER_WORD] = TRIGGER_DONE;
                                    gate.pending = None;
                                }
                            }
                        }
                    } else {
                        // No pending request but trigger says processing — reset
                        gate.memory[TRIGGER_WORD] = TRIGGER_IDLE;
                    }
                }

                TRIGGER_DONE => {
                    // Gate is done — spatial program should reset to IDLE
                    // We leave it alone until the program clears it
                }

                _ => {} // IDLE or unknown
            }
        }
    }

    /// Read a word from a specific gate's memory (for MMIO bridge)
    pub fn read_word(&self, gate_id: u32, offset: usize) -> Option<u32> {
        self.gates
            .iter()
            .find(|g| g.id == gate_id)
            .and_then(|g| g.memory.get(offset / 4).copied())
    }

    /// Write a word to a specific gate's memory (for MMIO bridge)
    pub fn write_word(&mut self, gate_id: u32, offset: usize, val: u32) -> bool {
        if let Some(gate) = self.gates.iter_mut().find(|g| g.id == gate_id) {
            let word_idx = offset / 4;
            if word_idx < gate.memory.len() {
                gate.memory[word_idx] = val;
                return true;
            }
        }
        false
    }

    /// Get gate memory as a byte slice (for GPU buffer upload)
    pub fn gate_bytes(&self, gate_id: u32) -> Option<&[u8]> {
        self.gates
            .iter()
            .find(|g| g.id == gate_id)
            .map(|g| unsafe {
                std::slice::from_raw_parts(g.memory.as_ptr() as *const u8, g.memory.len() * 4)
            })
    }

    /// Get the base address of a gate
    pub fn gate_base_addr(&self, gate_id: u32) -> Option<u64> {
        self.gates.iter().find(|g| g.id == gate_id).map(|g| g.base_addr)
    }

    /// Extract materialized cells from a gate and return them for GPU upload
    ///
    /// Returns the cells and clears them from the gate (consumes once).
    /// Returns None if no cells are available.
    pub fn take_materialized_cells(&mut self, gate_id: u32) -> Option<Vec<CellState>> {
        if let Some(gate) = self.gates.iter_mut().find(|g| g.id == gate_id) {
            gate.materialized_cells.take()
        } else {
            None
        }
    }

    /// Upload materialized cells to a GPU overlay buffer
    ///
    /// This is a convenience method for uploading cells from the gate directly
    /// to the GPU. When spatial routing is integrated into infinite_map_rs,
    /// this will be called after detecting materialized cells.
    pub fn upload_materialized_cells_to_gpu(
        &mut self,
        gate_id: u32,
        device: &wgpu::Device,
        queue: &wgpu::Queue,
    ) -> Option<wgpu::Buffer> {
        let cells = self.take_materialized_cells(gate_id)?;

        // Create overlay buffer using spatial_grid module
        let buffer = crate::spatial_grid::create_overlay_buffer(device, queue, Some(&cells));

        log::info!(
            "🧬 NEURAL_GATE {}: Uploaded {} cells to GPU overlay buffer",
            gate_id,
            cells.len()
        );

        Some(buffer)
    }

    /// Test connection to Ollama
    pub async fn test_connection(&self) -> Result<(), String> {
        let url = format!("{}/api/tags", self.config.ollama_url);
        let response = self
            .client
            .get(&url)
            .send()
            .await
            .map_err(|e| format!("Connection failed: {}", e))?;

        if response.status().is_success() {
            log::info!("✅ NEURAL_GATE: Ollama connection successful at {}", self.config.ollama_url);
            Ok(())
        } else {
            Err(format!("Ollama returned: {}", response.status()))
        }
    }
}

// ── Helper functions ───────────────────────────────────────────────────────

/// Read ASCII text from a gate memory region (u32 words → bytes → ASCII)
pub fn read_ascii_from_gate(memory: &[u32], start: usize, words: usize) -> String {
    let mut bytes = Vec::with_capacity(words * 4);
    for i in start..start + words {
        if i >= memory.len() {
            break;
        }
        let word = memory[i];
        bytes.push((word & 0xFF) as u8);
        bytes.push(((word >> 8) & 0xFF) as u8);
        bytes.push(((word >> 16) & 0xFF) as u8);
        bytes.push(((word >> 24) & 0xFF) as u8);
    }

    // Trim at first null byte
    let end = bytes.iter().position(|&b| b == 0).unwrap_or(bytes.len());
    String::from_utf8_lossy(&bytes[..end]).trim().to_string()
}

/// Write ASCII text into a gate memory region (bytes → u32 words, little-endian)
fn write_ascii_to_gate(memory: &mut [u32], start: usize, words: usize, text: &str) {
    let bytes = text.as_bytes();
    let max_bytes = words * 4;

    // Pad to word boundary
    let mut padded = bytes.to_vec();
    padded.resize(max_bytes.min(padded.len() + 4), 0);
    // Ensure we don't exceed buffer
    let write_len = padded.len().min(max_bytes);
    padded.truncate(write_len);
    // Pad remaining with zeros
    padded.resize(max_bytes, 0);

    for (i, chunk) in padded.chunks(4).enumerate() {
        let word_idx = start + i;
        if word_idx >= memory.len() {
            break;
        }
        let word = u32::from_le_bytes([
            chunk[0],
            chunk.get(1).copied().unwrap_or(0),
            chunk.get(2).copied().unwrap_or(0),
            chunk.get(3).copied().unwrap_or(0),
        ]);
        memory[word_idx] = word;
    }
}

/// Query Ollama /api/generate endpoint
async fn query_ollama(
    client: &reqwest::Client,
    base_url: &str,
    model: &str,
    prompt: &str,
) -> Result<String, String> {
    let request = OllamaRequest {
        model: model.to_string(),
        prompt: prompt.to_string(),
        stream: false,
    };

    let url = format!("{}/api/generate", base_url);
    log::debug!("🧬 NEURAL_GATE: POST {} (model={}, {} bytes)", url, model, prompt.len());

    let response = client
        .post(&url)
        .json(&request)
        .send()
        .await
        .map_err(|e| format!("HTTP request failed: {}", e))?;

    if !response.status().is_success() {
        return Err(format!("Ollama error: {} {}", response.status(), response.text().await.unwrap_or_default()));
    }

    let ollama_resp: OllamaResponse = response
        .json()
        .await
        .map_err(|e| format!("Failed to parse Ollama response: {}", e))?;

    Ok(ollama_resp.response)
}

// ── Tests ──────────────────────────────────────────────────────────────────

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_gate_memory_layout() {
        assert_eq!(GATE_WORDS, 0x0800);
        assert_eq!(TX_BUFFER_START, 0x000);
        assert_eq!(TRIGGER_WORD, 0x100);
        assert_eq!(RX_BUFFER_START, 0x102);
        assert_eq!(STATUS_WORD, 0x202);
        assert_eq!(MODEL_ID_WORD, 0x203);
    }

    #[test]
    fn test_ascii_roundtrip() {
        let mut memory = vec![0u32; GATE_WORDS];
        let text = "Hello, Ollama!";
        write_ascii_to_gate(&mut memory, TX_BUFFER_START, TX_BUFFER_WORDS, text);
        let read_back = read_ascii_from_gate(&memory, TX_BUFFER_START, TX_BUFFER_WORDS);
        assert_eq!(read_back, text);
    }

    #[test]
    fn test_ascii_roundtrip_long() {
        let mut memory = vec![0u32; GATE_WORDS];
        // Fill exactly 1024 bytes
        let text = "A".repeat(500) + "B".repeat(524).as_str();
        write_ascii_to_gate(&mut memory, TX_BUFFER_START, TX_BUFFER_WORDS, &text);
        let read_back = read_ascii_from_gate(&memory, TX_BUFFER_START, TX_BUFFER_WORDS);
        assert_eq!(read_back.len(), 1024);
        assert_eq!(read_back, text);
    }

    #[test]
    fn test_ascii_truncation_on_read() {
        let mut memory = vec![0u32; GATE_WORDS];
        // Write partial data
        memory[TX_BUFFER_START] = u32::from_le_bytes(*b"Hi\0\0");
        let read_back = read_ascii_from_gate(&memory, TX_BUFFER_START, TX_BUFFER_WORDS);
        assert_eq!(read_back, "Hi");
    }

    #[test]
    fn test_gate_register_and_poll_idle() {
        let mut gate = NeuralGate::new(NeuralGateConfig::default());
        let id = gate.register_gate(0x03000000);
        assert_eq!(id, 0);
        assert_eq!(gate.gates.len(), 1);

        // Poll with idle trigger — should be a no-op
        gate.poll();
        assert_eq!(gate.gates[0].memory[TRIGGER_WORD], TRIGGER_IDLE);
    }

    #[test]
    fn test_gate_submit_without_runtime() {
        let mut gate = NeuralGate::new(NeuralGateConfig::default());
        let id = gate.register_gate(0x03000000);

        // Write a prompt
        write_ascii_to_gate(
            &mut gate.gates[0].memory,
            TX_BUFFER_START,
            TX_BUFFER_WORDS,
            "What is 2+2?",
        );

        // Set trigger
        gate.gates[0].memory[TRIGGER_WORD] = TRIGGER_SUBMIT;

        // Poll — should fail gracefully (no runtime)
        gate.poll();

        // Should have error status and be done
        assert_eq!(gate.gates[0].memory[STATUS_WORD], STATUS_ERROR);
        assert_eq!(gate.gates[0].memory[TRIGGER_WORD], TRIGGER_DONE);
    }

    #[test]
    fn test_gate_submit_empty_prompt() {
        let mut gate = NeuralGate::new(NeuralGateConfig::default());
        gate.register_gate(0x03000000);

        // Set trigger without writing prompt
        gate.gates[0].memory[TRIGGER_WORD] = TRIGGER_SUBMIT;

        gate.poll();

        assert_eq!(gate.gates[0].memory[STATUS_WORD], STATUS_ERROR);
        assert_eq!(gate.gates[0].memory[TRIGGER_WORD], TRIGGER_DONE);
    }

    #[test]
    fn test_gate_read_write_word() {
        let mut gate = NeuralGate::new(NeuralGateConfig::default());
        let id = gate.register_gate(0x03000000);

        // Write to trigger word (offset 0x400 = 1024 bytes)
        assert!(gate.write_word(id, 0x400, TRIGGER_SUBMIT));
        assert_eq!(gate.read_word(id, 0x400), Some(TRIGGER_SUBMIT));

        // Out of bounds
        assert!(!gate.write_word(id, GATE_WORDS * 4 + 100, 42));
        assert_eq!(gate.read_word(id, GATE_WORDS * 4 + 100), None);
    }

    #[test]
    fn test_gate_gate_bytes() {
        let mut gate = NeuralGate::new(NeuralGateConfig::default());
        let id = gate.register_gate(0x03000000);

        // Write some data
        gate.gates[0].memory[0] = 0x41414141;

        let bytes = gate.gate_bytes(id).unwrap();
        assert_eq!(bytes.len(), GATE_WORDS * 4);
        assert_eq!(&bytes[0..4], b"AAAA");
    }

    #[test]
    fn test_gate_base_addr() {
        let mut gate = NeuralGate::new(NeuralGateConfig::default());
        let id = gate.register_gate(0x03000000);
        assert_eq!(gate.gate_base_addr(id), Some(0x03000000));
    }

    #[test]
    fn test_multiple_gates() {
        let mut gate = NeuralGate::new(NeuralGateConfig::default());
        let id0 = gate.register_gate(0x03000000);
        let id1 = gate.register_gate(0x03002000);
        let id2 = gate.register_gate(0x03004000);

        assert_eq!(id0, 0);
        assert_eq!(id1, 1);
        assert_eq!(id2, 2);
        assert_eq!(gate.gates.len(), 3);

        // Each gate has independent memory
        gate.write_word(id0, 0, 100);
        gate.write_word(id1, 0, 200);
        gate.write_word(id2, 0, 300);

        assert_eq!(gate.read_word(id0, 0), Some(100));
        assert_eq!(gate.read_word(id1, 0), Some(200));
        assert_eq!(gate.read_word(id2, 0), Some(300));
    }

    #[test]
    fn test_ollama_request_serialization() {
        let req = OllamaRequest {
            model: "qwen2.5-coder:14b".to_string(),
            prompt: "Hello".to_string(),
            stream: false,
        };
        let json = serde_json::to_string(&req).unwrap();
        assert!(json.contains("qwen2.5-coder:14b"));
        assert!(json.contains("Hello"));
        assert!(json.contains("\"stream\":false"));
    }
}
