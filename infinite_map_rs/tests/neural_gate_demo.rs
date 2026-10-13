//! NEURAL_GATE Demo — Simulates a spatial program prompting Ollama
//!
//! This test demonstrates the full NEURAL_GATE protocol from the perspective
//! of a spatial program running on the grid. It shows:
//!   1. Writing a prompt string into the Transmitter Buffer
//!   2. Setting the Trigger Cell to SUBMIT
//!   3. Polling until the gate responds (DONE)
//!   4. Reading the response from the Receiver Buffer
//!
//! Since we don't have a tokio runtime in this test (and Ollama may not be
//! running), we test the protocol flow with the error paths. The test
//! verifies that a spatial program can:
//!   - Address gate memory via byte offsets (MMIO-style)
//!   - Get proper status codes back
//!   - Read/write the full buffer region

use infinite_map_rs::neural_gate::{
    self, NeuralGate, NeuralGateConfig, GATE_WORDS, MODEL_ID_WORD, RESPONSE_LEN_WORD,
    RX_BUFFER_START, RX_BUFFER_WORDS, STATUS_ERROR, STATUS_OK, STATUS_WORD, TRIGGER_DONE,
    TRIGGER_IDLE, TRIGGER_PROCESSING, TRIGGER_SUBMIT, TRIGGER_WORD, TX_BUFFER_START,
    TX_BUFFER_WORDS,
};

/// Helper: simulate a spatial program writing a string to the TX buffer
/// via byte-addressed MMIO writes (4 bytes per word)
fn spatial_write_prompt(gate: &mut NeuralGate, gate_id: u32, text: &str) {
    let bytes = text.as_bytes();
    for (i, chunk) in bytes.chunks(4).enumerate() {
        let mut word_bytes = [0u8; 4];
        word_bytes[..chunk.len()].copy_from_slice(chunk);
        let word = u32::from_le_bytes(word_bytes);
        let byte_offset = i * 4;
        assert!(gate.write_word(gate_id, byte_offset, word));
    }
}

/// Helper: simulate a spatial program reading the response from RX buffer
fn spatial_read_response(gate: &NeuralGate, gate_id: u32, len: usize) -> String {
    let mut result = Vec::new();
    for i in 0..RX_BUFFER_WORDS {
        if result.len() >= len {
            break;
        }
        let byte_offset = i * 4;
        if let Some(word) = gate.read_word(gate_id, byte_offset) {
            let bytes = word.to_le_bytes();
            for &b in &bytes {
                if result.len() >= len {
                    break;
                }
                if b != 0 {
                    result.push(b);
                }
            }
        }
    }
    String::from_utf8_lossy(&result).to_string()
}

#[test]
fn demo_neural_gate_full_protocol_flow() {
    let mut gate_system = NeuralGate::new(NeuralGateConfig::default());
    let gate_id = gate_system.register_gate(0x03000000);

    // ── Step 1: Spatial program writes prompt to TX buffer ──
    let prompt = "What is the meaning of life?";
    spatial_write_prompt(&mut gate_system, gate_id, prompt);

    // Verify the prompt was written correctly
    let read_back = neural_gate::read_ascii_from_gate(
        &gate_system.gates[0].memory,
        TX_BUFFER_START,
        TX_BUFFER_WORDS,
    );
    assert_eq!(read_back, prompt);
    println!("[DEMO] Step 1: Prompt written to TX buffer: {:?}", prompt);

    // ── Step 2: Spatial program sets trigger to SUBMIT ──
    // In the real system, this would be a store instruction to address
    // 0x03000000 + 0x400 (TRIGGER_WORD offset)
    let trigger_addr = 0x03000000 + (TRIGGER_WORD * 4) as u64;
    assert!(gate_system.write_word(gate_id, TRIGGER_WORD * 4, TRIGGER_SUBMIT));
    println!(
        "[DEMO] Step 2: Trigger set to SUBMIT (MMIO write to 0x{:08X})",
        trigger_addr
    );

    // ── Step 3: Rust compositor polls the gate (called every frame) ──
    // Without a tokio runtime, this will fail gracefully and set DONE+ERROR
    gate_system.poll();
    println!("[DEMO] Step 3: Rust compositor polled gate (no runtime = graceful error)");

    // ── Step 4: Spatial program checks status ──
    let trigger =
        gate_system.read_word(gate_id, TRIGGER_WORD * 4).unwrap();
    let status =
        gate_system.read_word(gate_id, STATUS_WORD * 4).unwrap();

    assert_eq!(trigger, TRIGGER_DONE);
    assert_eq!(status, STATUS_ERROR); // Error because no tokio runtime
    println!(
        "[DEMO] Step 4: Trigger={}, Status={} (ERROR expected — no runtime)",
        trigger, status
    );

    // ── Step 5: Spatial program resets trigger to IDLE ──
    assert!(gate_system.write_word(gate_id, TRIGGER_WORD * 4, TRIGGER_IDLE));
    println!("[DEMO] Step 5: Trigger reset to IDLE — gate ready for next request");

    println!("[DEMO] ✓ Full NEURAL_GATE protocol flow verified!");
}

#[test]
fn demo_neural_gate_multiple_gates_independent() {
    let mut gate_system = NeuralGate::new(NeuralGateConfig::default());

    // Register 3 gates at different addresses (like different regions on the grid)
    let g0 = gate_system.register_gate(0x03000000);
    let g1 = gate_system.register_gate(0x03002000);
    let g2 = gate_system.register_gate(0x03004000);

    // Each gate can hold a different prompt independently
    spatial_write_prompt(&mut gate_system, g0, "Translate to French: Hello");
    spatial_write_prompt(&mut gate_system, g1, "Write a haiku about pixels");
    spatial_write_prompt(&mut gate_system, g2, "What is RISC-V?");

    // Verify independence
    let p0 = neural_gate::read_ascii_from_gate(
        &gate_system.gates[0].memory,
        TX_BUFFER_START,
        TX_BUFFER_WORDS,
    );
    let p1 = neural_gate::read_ascii_from_gate(
        &gate_system.gates[1].memory,
        TX_BUFFER_START,
        TX_BUFFER_WORDS,
    );
    let p2 = neural_gate::read_ascii_from_gate(
        &gate_system.gates[2].memory,
        TX_BUFFER_START,
        TX_BUFFER_WORDS,
    );

    assert_eq!(p0, "Translate to French: Hello");
    assert_eq!(p1, "Write a haiku about pixels");
    assert_eq!(p2, "What is RISC-V?");

    println!("[DEMO] ✓ 3 independent NEURAL_GATEs verified:");
    println!("  Gate 0 @0x03000000: {:?}", p0);
    println!("  Gate 1 @0x03002000: {:?}", p1);
    println!("  Gate 2 @0x03004000: {:?}", p2);
}

#[test]
fn demo_neural_gate_memory_map_verification() {
    let mut gate_system = NeuralGate::new(NeuralGateConfig::default());
    let gate_id = gate_system.register_gate(0x03000000);

    // Verify the memory map is correct and accessible
    // TX Buffer: 0x0000 - 0x03FF (256 words = 1024 bytes)
    let tx_first = gate_system.read_word(gate_id, 0x0000).unwrap();
    let tx_last = gate_system.read_word(gate_id, 0x03FC).unwrap();
    assert_eq!(tx_first, 0);
    assert_eq!(tx_last, 0);

    // Trigger: 0x0400
    let trigger = gate_system.read_word(gate_id, 0x0400).unwrap();
    assert_eq!(trigger, TRIGGER_IDLE);

    // Response Length: 0x0404
    let resp_len = gate_system.read_word(gate_id, 0x0404).unwrap();
    assert_eq!(resp_len, 0);

    // RX Buffer: 0x0408 - 0x07FF (256 words = 1024 bytes)
    let rx_first = gate_system.read_word(gate_id, 0x0408).unwrap();
    assert_eq!(rx_first, 0);

    // Status: 0x0808
    let status = gate_system.read_word(gate_id, 0x0808).unwrap();
    assert_eq!(status, STATUS_OK);

    // Model ID: 0x080C
    let model_id = gate_system.read_word(gate_id, 0x080C).unwrap();
    assert_eq!(model_id, 0);

    // Out of bounds
    assert!(gate_system.read_word(gate_id, GATE_WORDS * 4).is_none());

    println!("[DEMO] ✓ Memory map verified:");
    println!("  TX Buffer:  0x0000-0x03FF (1024 bytes)");
    println!("  Trigger:    0x0400");
    println!("  Resp Len:   0x0404");
    println!("  RX Buffer:  0x0408-0x07FF (1024 bytes)");
    println!("  Status:     0x0808");
    println!("  Model ID:   0x080C");
    println!("  Total size: {} bytes", GATE_WORDS * 4);
}
