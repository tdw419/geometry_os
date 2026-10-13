//! Phase 21.3 end-to-end verification harness.
//!
//! Drives the full neural pattern pipeline against a live Ollama instance:
//! NeuralPrompter → /v1/chat/completions → JSON parse → PatternMaterializer.
//!
//! Usage: cargo run --example neural_e2e [attempts]

use std::time::{Duration, Instant};

use infinite_map_rs::spatial::lm_studio_bridge::LmStudioConfig;
use infinite_map_rs::spatial::neural_prompter::{NeuralConstraints, NeuralPrompt, NeuralPrompter};
use infinite_map_rs::spatial::pattern_materializer::PatternMaterializer;

fn main() {
    env_logger::Builder::from_env(env_logger::Env::default().default_filter_or("info")).init();

    let attempts: usize = std::env::args()
        .nth(1)
        .and_then(|a| a.parse().ok())
        .unwrap_or(10);

    let config = LmStudioConfig {
        endpoint: "http://localhost:11434/v1/chat/completions".to_string(),
        model: "qwen2.5-coder:14b".to_string(),
        temperature: 0.7,
        max_tokens: 2048,
        timeout: Duration::from_secs(180),
    };

    println!("=== Phase 21.3 Neural Pattern E2E ===");
    println!("Endpoint: {}", config.endpoint);
    println!("Model:    {}", config.model);
    println!("Attempts: {}\n", attempts);

    let prompter = NeuralPrompter::with_config(config).expect("client init");
    let materializer = PatternMaterializer::new(32, 32);

    let prompt = NeuralPrompt {
        goal: "Design circuits with high parallelization potential".to_string(),
        width: 32,
        height: 32,
        constraints: Some(NeuralConstraints {
            low_latency: true,
            high_throughput: true,
            high_density: false,
        }),
    };

    let mut generated_ok = 0usize;
    let mut materialized_ok = 0usize;
    let mut latencies_ms: Vec<u128> = Vec::new();
    let mut rationales: Vec<String> = Vec::new();
    let mut failures: Vec<(usize, String)> = Vec::new();

    for i in 1..=attempts {
        let start = Instant::now();
        match prompter.generate_pattern(&prompt) {
            Ok(pattern) => {
                let elapsed = start.elapsed().as_millis();
                latencies_ms.push(elapsed);
                generated_ok += 1;

                let mat_start = Instant::now();
                match materializer.materialize_to_grid(&pattern.cells) {
                    Ok(grid) => {
                        materialized_ok += 1;
                        println!(
                            "[{:>2}/{}] OK  {:>6}ms  {} cells → {} grid cells  tokens={:?}",
                            i,
                            attempts,
                            elapsed,
                            pattern.cells.len(),
                            grid.len(),
                            pattern.tokens_used,
                        );
                        println!(
                            "        materialize: {}µs  rationale: {:.120}",
                            mat_start.elapsed().as_micros(),
                            pattern.rationale.replace('\n', " "),
                        );
                        rationales.push(pattern.rationale);
                    }
                    Err(e) => {
                        println!(
                            "[{:>2}/{}] GEN-OK/MAT-FAIL  {:>6}ms  {} cells: {}",
                            i,
                            attempts,
                            elapsed,
                            pattern.cells.len(),
                            e
                        );
                        failures.push((i, format!("materialize: {}", e)));
                    }
                }
            }
            Err(e) => {
                let elapsed = start.elapsed().as_millis();
                latencies_ms.push(elapsed);
                println!("[{:>2}/{}] GEN-FAIL  {:>6}ms  {}", i, attempts, elapsed, e);
                failures.push((i, format!("generate: {}", e)));
            }
        }
    }

    latencies_ms.sort_unstable();
    let median = latencies_ms.get(latencies_ms.len() / 2).copied().unwrap_or(0);
    let mean: u128 = if latencies_ms.is_empty() {
        0
    } else {
        latencies_ms.iter().sum::<u128>() / latencies_ms.len() as u128
    };

    println!("\n=== Summary ===");
    println!(
        "Generation success:      {}/{} ({:.0}%)",
        generated_ok,
        attempts,
        100.0 * generated_ok as f64 / attempts as f64
    );
    println!(
        "Materialization success: {}/{} ({:.0}%) of generated",
        materialized_ok,
        generated_ok.max(1),
        100.0 * materialized_ok as f64 / generated_ok.max(1) as f64
    );
    println!(
        "End-to-end success:      {}/{} ({:.0}%)",
        materialized_ok,
        attempts,
        100.0 * materialized_ok as f64 / attempts as f64
    );
    println!(
        "Latency ms: min={} median={} mean={} max={}",
        latencies_ms.first().copied().unwrap_or(0),
        median,
        mean,
        latencies_ms.last().copied().unwrap_or(0)
    );

    if !failures.is_empty() {
        println!("\nFailures:");
        for (i, reason) in &failures {
            println!("  attempt {}: {}", i, reason);
        }
    }

    if !rationales.is_empty() {
        println!("\nRationale samples:");
        for r in rationales.iter().take(3) {
            println!("  - {:.240}", r.replace('\n', " "));
        }
    }
}
