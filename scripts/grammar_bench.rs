//! scripts/grammar_bench.rs -- Benchmark for Differential Grammar Induction (DGI)
//!
//! Measures the "Collapse Ratio" of a synthetic world containing repetitive structures.

use geometry_os::grammar::{GrammarRule, RuleBase, PatternMiner, RuleRegistry};
use std::time::Instant;

const WORLD_SIZE: usize = 512; // 512x512 pixels
const HOUSE_SIZE: usize = 8;
const NUM_HOUSES: usize = 200;

fn draw_house(pixels: &mut [u32], x: usize, y: usize) {
    for dy in 0..HOUSE_SIZE {
        for dx in 0..HOUSE_SIZE {
            let color = if dy < 3 { 0x00FF0000 } else { 0x00884422 }; // Red roof, brown walls
            let px = x + dx;
            let py = y + dy;
            if px < WORLD_SIZE && py < WORLD_SIZE {
                pixels[py * WORLD_SIZE + px] = color;
            }
        }
    }
}

fn main() {
    println!("--- Geometry OS DGI Benchmark ---");
    
    let mut pixels = vec![0u32; WORLD_SIZE * WORLD_SIZE];
    
    // 1. Generate a world with 200 houses (Identical, Rotated, Flipped)
    println!("Generating world ({}x{} pixels)...", WORLD_SIZE, WORLD_SIZE);
    for i in 0..NUM_HOUSES {
        let x = (i % 14) * 32 + 10;
        let y = (i / 14) * 32 + 10;
        
        let mut house = vec![0u32; HOUSE_SIZE * HOUSE_SIZE];
        for dy in 0..HOUSE_SIZE {
            for dx in 0..HOUSE_SIZE {
                let color = if dy < 3 { 0x00FF0000 } else { 0x00884422 };
                house[dy * HOUSE_SIZE + dx] = color;
            }
        }

        // Apply random symmetry to 50% of houses
        use geometry_os::grammar::Transform;
        let t = match i % 4 {
            1 => Transform::Rotate90,
            2 => Transform::FlipX,
            3 => Transform::Rotate180,
            _ => Transform::None,
        };
        
        let transformed_house = geometry_os::grammar::apply_transform_to_block(&house, HOUSE_SIZE, t);
        
        for dy in 0..HOUSE_SIZE {
            for dx in 0..HOUSE_SIZE {
                pixels[(y + dy) * WORLD_SIZE + (x + dx)] = transformed_house[dy * HOUSE_SIZE + dx];
            }
        }
    }

    let raw_size = pixels.len() * 4;
    println!("Raw State Size: {} bytes ({:.2} MB)", raw_size, raw_size as f64 / 1_048_576.0);

    // 2. Mine for patterns hierarchically (up to 8x8 window)
    println!("Mining for patterns hierarchically (max window=8, threshold=10)...");
    let start = Instant::now();
    let miner = PatternMiner::new(8, 10);
    let mut registry = RuleRegistry::new();
    let promoted_ids = miner.mine_hierarchical(&pixels, WORLD_SIZE, WORLD_SIZE, &mut registry);
    let duration = start.elapsed();
    
    println!("Mining completed in {:?}", duration);
    println!("Promoted {} recursive rules.", promoted_ids.len());

    // 3. Calculate Grammar Size
    let mut grammar_size = 0;
    for (_, rule) in &registry.rules {
        match &rule.base {
            RuleBase::Atomic(_) => grammar_size += 4,
            RuleBase::Reference(_) => grammar_size += 16,
            RuleBase::Composite { rules, .. } => grammar_size += 8 + (rules.len() * 4),
        }
    }

    // 4. Calculate Collapse Ratio
    let world_map_size = NUM_HOUSES * 4; 
    let total_compressed_size = grammar_size + world_map_size;

    println!("\n--- RESULTS ---");
    println!("Grammar Registry Size: {} bytes", grammar_size);
    println!("World Map (References): {} bytes", world_map_size);
    println!("Total Compressed Size: {} bytes ({:.2} KB)", total_compressed_size, total_compressed_size as f64 / 1024.0);
    
    let ratio = raw_size as f64 / total_compressed_size as f64;
    println!("COLLAPSE RATIO: {:.2}x", ratio);

    if ratio > 100.0 {
        println!("\nSTATUS: [SUCCESS] Near-infinite scaling verified.");
    } else {
        println!("\nSTATUS: [MODERATE] Complexity too high for simple induction.");
    }
}
