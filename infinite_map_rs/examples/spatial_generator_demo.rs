//! Spatial Generator Demo - Full Integration with LLM
//!
//! Demonstrates the complete generative evolution pipeline:
//! 1. Parse OpenSpec specification
//! 2. Hallucinate initial circuit via LLM (Ollama)
//! 3. Instantiate in idle region
//! 4. Handoff to Evolution Daemon

use infinite_map_rs::spatial::spatial_generator::{
    SpatialGenerator, SpatialGeneratorConfig,
};
use infinite_map_rs::spatial::lm_studio_bridge::LmStudioConfig;
use infinite_map_rs::geoasm_materializer::CellState;
use std::time::Duration;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    env_logger::Builder::from_env(env_logger::Env::default().default_filter_or("info")).init();

    println!("🧬 Spatial Generator Demo - Full Integration Pipeline\n");

    // Configure Ollama connection (port 11434)
    let llm_config = LmStudioConfig {
        endpoint: "http://localhost:11434/v1/chat/completions".to_string(),
        model: "qwen2.5-coder:14b".to_string(),
        temperature: 0.7,
        max_tokens: 2048,
        timeout: Duration::from_secs(60),
    };

    let generator_config = SpatialGeneratorConfig {
        llm_config,
        ..SpatialGeneratorConfig::default()
    };

    println!("🔧 Initializing spatial generator...");
    let mut generator = SpatialGenerator::new(generator_config)?;

    // Test LLM connection
    println!("🔌 Testing LLM connection...");
    match generator.llm_client.health_check() {
        Ok(true) => println!("✅ LLM is accessible"),
        Ok(false) => {
            eprintln!("❌ LLM health check failed");
            return Err("LLM not accessible".into());
        }
        Err(e) => {
            eprintln!("❌ LLM connection error: {}", e);
            return Err(e.into());
        }
    }

    // Create test grid (512x512 empty grid)
    let grid: Vec<CellState> = vec![CellState::new(0, 0, 0); 512 * 512];
    println!("📐 Created 512x512 test grid (262,144 cells)");

    // Load OpenSpec specification
    let spec_path = "examples/convolution_3x3.spec";
    println!("\n📄 Loading specification: {}", spec_path);

    let result = generator.generate_from_file(spec_path, &grid);

    match result {
        Ok(gen_result) => {
            println!("\n🎉 Generation successful!\n");
            println!("Circuit ID: {}", gen_result.circuit_id);
            println!("Region: ({}, {})", gen_result.region.0, gen_result.region.1);
            println!("Cells generated: {}", gen_result.cells.len());
            if let Some(exp_id) = gen_result.experiment_id {
                println!("Evolution experiment: {}", exp_id);
            }

            // Print sample cells
            println!("\n📊 Sample circuit layout (first 10 cells):");
            for (i, cell) in gen_result.cells.iter().take(10).enumerate() {
                println!("  Cell {}: opcode={}, data={}", i, cell.opcode_or_type, cell.data_buffer);
            }

            println!("\n🚀 Pipeline complete!");
            println!("   1. ✅ Parse OpenSpec");
            println!("   2. ✅ Hallucinate circuit via LLM");
            println!("   3. ✅ Instantiate in idle region");
            println!("   4. ✅ Handoff to Evolution Daemon");
        }
        Err(e) => {
            eprintln!("\n❌ Generation failed: {}", e);
            return Err(e.into());
        }
    }

    Ok(())
}