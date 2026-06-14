//! vision_bench.rs -- Empirical comparison of Vision vs Text LLM modalities in Geometry OS
//!
//! Generates synthetic system scenarios and compares LLM accuracy and latency.

use geometry_os::hermes::{call_llm, call_ollama_vision, ProviderConfig};
use geometry_os::vision::encode_png_base64;
use std::time::Instant;

struct Scenario {
    name: String,
    text_context: String,
    screen: Vec<u32>,
    expected_healthy: bool,
}

fn generate_scenarios() -> Vec<Scenario> {
    let mut scenarios = Vec::new();

    // 1. Healthy Oscillator (Bouncing Ball)
    let mut screen_healthy = vec![0u32; 256 * 256];
    // Draw a "ball" at (128, 128)
    for dy in -5i32..5 {
        for dx in -5i32..5 {
            let x = 128 + dx;
            let y = 128 + dy;
            if x >= 0 && x < 256 && y >= 0 && y < 256 {
                screen_healthy[(y * 256 + x) as usize] = 0xFFFFFF;
            }
        }
    }
    scenarios.push(Scenario {
        name: "Healthy Oscillator".to_string(),
        text_context: "The program bouncing_ball.asm is running. PC is moving between 0x1020 and 0x1080. r1=128, r2=128.".to_string(),
        screen: screen_healthy,
        expected_healthy: true,
    });

    // 2. Memory Leak / Noise (Fracture)
    let mut screen_leaky = vec![0u32; 256 * 256];
    for i in 0..1000 {
        screen_leaky[i * 64 % (256 * 256)] = 0xFF00FF; // random magenta noise
    }
    scenarios.push(Scenario {
        name: "Memory Fracture".to_string(),
        text_context: "The program noise.asm is running. PC is stuck at 0x1044. Registers r0-r31 are all 0xDEADBEEF.".to_string(),
        screen: screen_leaky,
        expected_healthy: false,
    });

    // 3. Frozen Screen (Halt)
    let screen_frozen = vec![0u32; 256 * 256]; // All black
    scenarios.push(Scenario {
        name: "Frozen System".to_string(),
        text_context: "The program halt.asm was launched. PC is 0x1000. Instruction is HALT."
            .to_string(),
        screen: screen_frozen,
        expected_healthy: false,
    });

    scenarios
}

fn main() {
    println!("--- Geometry OS Vision vs Text Benchmark ---");
    let config = ProviderConfig::load();
    let scenarios = generate_scenarios();

    let system_prompt = "You are a Geometry OS diagnostic expert. Is this system healthy? Reply only with 'YES' or 'NO' and a one-sentence reason.";

    for s in scenarios {
        println!("\nScenario: {}", s.name);

        // --- Text Modality ---
        let start_text = Instant::now();
        let res_text = call_llm(&config, system_prompt, &s.text_context)
            .unwrap_or_else(|| "FAILED".to_string());
        let dur_text = start_text.elapsed();
        let pass_text =
            res_text
                .to_uppercase()
                .contains(if s.expected_healthy { "YES" } else { "NO" });

        // --- Vision Modality ---
        let screen_b64 = encode_png_base64(&s.screen);
        let start_vis = Instant::now();
        let res_vis = call_ollama_vision(system_prompt, &s.text_context, &screen_b64)
            .unwrap_or_else(|| "FAILED".to_string());
        let dur_vis = start_vis.elapsed();
        let pass_vis =
            res_vis
                .to_uppercase()
                .contains(if s.expected_healthy { "YES" } else { "NO" });

        println!(
            "  [Text]   Correct: {:<5} | Latency: {:4}ms | Response: {}",
            pass_text,
            dur_text.as_millis(),
            res_text.trim()
        );
        println!(
            "  [Vision] Correct: {:<5} | Latency: {:4}ms | Response: {}",
            pass_vis,
            dur_vis.as_millis(),
            res_vis.trim()
        );
    }

    println!("\nBenchmark Complete.");
}
