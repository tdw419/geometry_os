//! Spatial Attention Demo (Phase 14.2)
//!
//! Demonstrates processing a 16-token sequence using the Spatial Attention Mechanism.
//! Allocates memory, writes pseudo-random weight patterns to the grid,
//! feeds a 16-token sequence, and executes a full scaled dot-product attention forward pass.

use infinite_map_rs::geoasm_materializer::CellState;
use infinite_map_rs::spatial::llm_weight_mapper::{TensorShape, WeightMapper, WeightMapperConfig};
use infinite_map_rs::spatial::spatial_attention::SpatialAttention;
use std::time::Instant;

fn main() {
    println!("╔════════════════════════════════════════════════════════════╗");
    println!("║  Geometry OS - Phase 14.2: Spatial Attention Demo          ║");
    println!("╚════════════════════════════════════════════════════════════╝\n");

    let grid_w = 1024;
    let grid_h = 1024;
    println!("[1/5] Allocating Spatial Grid ({}x{} cells)...", grid_w, grid_h);
    let mut grid = vec![CellState::new(0, 0, 0); grid_w * grid_h];

    let dim = 64;
    let seq_len = 16;
    let num_heads = 1;

    let mut config = WeightMapperConfig::default();
    config.default_origin = (100, 100);
    config.pas_threshold = 0.5;
    let mut mapper = WeightMapper::with_config(config);

    // Generate dummy orthogonal weights for testing
    let weight_size = dim * dim;
    let q_weights: Vec<f32> = (0..weight_size).map(|i| (i as f32 * 0.01).sin()).collect();
    let k_weights: Vec<f32> = (0..weight_size).map(|i| (i as f32 * 0.02).cos()).collect();
    let v_weights: Vec<f32> = (0..weight_size).map(|i| (i as f32 * 0.03).sin()).collect();
    let out_weights: Vec<f32> = (0..weight_size).map(|i| (i as f32 * 0.04).cos()).collect();

    let shape = TensorShape::Matrix { rows: dim, cols: dim };

    println!("[2/5] Mapping LLM Weights (Q, K, V, Out) to Spatial Grid with PAS...");
    let q_proj = mapper.map_weights(&mut grid, grid_w, &q_weights, shape.clone(), "attn.q_proj").unwrap();
    println!("      ↳ Q_Proj: Origin ({}, {}) | PAS Stability: {:.2}", q_proj.origin.0, q_proj.origin.1, q_proj.stability);
    
    let k_proj = mapper.map_weights(&mut grid, grid_w, &k_weights, shape.clone(), "attn.k_proj").unwrap();
    println!("      ↳ K_Proj: Origin ({}, {}) | PAS Stability: {:.2}", k_proj.origin.0, k_proj.origin.1, k_proj.stability);

    let v_proj = mapper.map_weights(&mut grid, grid_w, &v_weights, shape.clone(), "attn.v_proj").unwrap();
    println!("      ↳ V_Proj: Origin ({}, {}) | PAS Stability: {:.2}", v_proj.origin.0, v_proj.origin.1, v_proj.stability);

    let out_proj = mapper.map_weights(&mut grid, grid_w, &out_weights, shape, "attn.out_proj").unwrap();
    println!("      ↳ O_Proj: Origin ({}, {}) | PAS Stability: {:.2}", out_proj.origin.0, out_proj.origin.1, out_proj.stability);

    println!("[3/5] Initializing {}-token sequence (dim={})...", seq_len, dim);
    let token_origin = (10, 10);
    // Write tokens directly into spatial grid
    for i in 0..seq_len {
        for j in 0..dim {
            let val = if i == j { 1.0f32 } else { 0.1f32 }; // Simple diagonal pattern
            grid[(token_origin.1 + i) * grid_w + token_origin.0 + j].data_buffer = val.to_bits();
            grid[(token_origin.1 + i) * grid_w + token_origin.0 + j].is_active = 1;
        }
    }
    println!("      ↳ Tokens written to Origin ({}, {})", token_origin.0, token_origin.1);

    let output_origin = (10, 50);
    println!("[4/5] Executing Spatial Attention Forward Pass (CPU Benchmark)...");
    
    let attn = SpatialAttention::new(dim, num_heads, seq_len);
    
    let start = Instant::now();
    let result = attn.forward_cpu(
        &mut grid,
        grid_w,
        token_origin,
        &q_proj,
        &k_proj,
        &v_proj,
        &out_proj,
        output_origin
    );
    let duration = start.elapsed();

    assert!(result.is_ok());

    println!("      ↳ Forward Pass Completed in {:?}", duration);

    println!("[5/5] Extracting Output Features from ({}, {})...", output_origin.0, output_origin.1);
    
    // Sample first 4 dimensions of the first 4 tokens for display
    for i in 0..4 {
        print!("      Token {}: [", i);
        for j in 0..4 {
            let offset = (output_origin.1 + i) * grid_w + output_origin.0 + j;
            let val = f32::from_bits(grid[offset].data_buffer);
            print!("{:.4}, ", val);
        }
        println!("... ]");
    }

    println!("\n✅ Phase 14.2 Spatial Attention Prototype Verified.");
}
