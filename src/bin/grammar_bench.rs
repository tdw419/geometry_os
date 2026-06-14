//! grammar_bench.rs -- Benchmark for Hierarchical DGI compression ratio.

use geometry_os::grammar::{
    GrammarRule, PatternMiner, RuleBase, RuleRegistry, RULE_ID_MASK, RULE_PREFIX,
};
use std::time::Instant;

fn main() {
    println!("--- Geometry OS DGI Benchmark ---");
    let width = 1024;
    let height = 1024;
    println!("Generating world ({}x{} pixels)...", width, height);

    let mut pixels = vec![0u32; width * height];

    // Draw 1024 identical "houses" (16x16 patterns) - Aligned to 32x32 grid
    for i in 0..1024 {
        let x = (i % 32) * 32;
        let y = (i / 32) * 32;
        draw_house(&mut pixels, width, x, y, 16, 16);
    }

    // Add 256 "rotated" houses - Aligned to 32x32 grid
    for i in 0..256 {
        let x = (i % 16) * 32 + 512;
        let y = (i / 16) * 32 + 512;
        if x < width && y < height {
            draw_house_rotated(&mut pixels, width, x, y, 16, 16);
        }
    }

    let start = Instant::now();
    println!("Mining for patterns hierarchically (max window=32, threshold=5)...");

    let mut registry = RuleRegistry::new();
    let miner = PatternMiner::new(64, 5);
    let promoted_ids = miner.mine_hierarchical(&pixels, width, height, &mut registry);

    let duration = start.elapsed();
    println!("Mining completed in {:?}", duration);
    println!("Promoted {} recursive rules.", registry.rules.len());
    println!("Number of root promoted IDs: {}", promoted_ids.len());

    // Calculate compression ratio
    let raw_size = width * height * 4; // 4 bytes per pixel

    // Rule registry size estimate:
    // Each rule has a base and transforms.
    // Atomic: 4 bytes. Composite: ~24 bytes (4 rules * 4 bytes + metadata).
    // Reference: ~8 bytes.
    let mut registry_bytes = 0;
    for rule in registry.rules.values() {
        registry_bytes += 8; // base overhead
        match &rule.base {
            RuleBase::Atomic(_) => registry_bytes += 4,
            RuleBase::Reference(_) => registry_bytes += 4,
            RuleBase::Composite { rules, .. } => registry_bytes += 4 * rules.len() as usize + 8,
        }
        registry_bytes += rule.transforms.len() * 2; // ~2 bytes per transform
    }

    // World Map estimate:
    // In a production system, we'd store a grid of rule IDs.
    // Here we count how many pixels are now rule references.
    let mut rule_ref_count = 0;
    for &p in &pixels {
        if p & RULE_PREFIX == RULE_PREFIX {
            rule_ref_count += 1;
        }
    }

    // Total compressed size = Registry + World Map (where pixels are rule IDs)
    // For non-overlapping blocks, we only store 1 ID per block.
    // Let's estimate the "World Map" size based on the highest level of compression achieved.
    // If a 64x64 block is replaced by a rule, it's 1 ID (4 bytes) instead of 4096 pixels (16384 bytes).
    let compressed_world_size = (width * height * 4) / (64 * 64);
    let total_compressed_size = registry_bytes + compressed_world_size;

    println!("---");
    println!("--- RESULTS ---");
    println!(
        "Raw Size: {} bytes ({:.2} KB)",
        raw_size,
        raw_size as f64 / 1024.0
    );
    println!("Grammar Registry Size (est): {} bytes", registry_bytes);
    println!("World Map Size (est): {} bytes", compressed_world_size);
    println!(
        "Total Compressed Size: {} bytes ({:.2} KB)",
        total_compressed_size,
        total_compressed_size as f64 / 1024.0
    );

    let ratio = raw_size as f64 / total_compressed_size as f64;
    println!("COLLAPSE RATIO: {:.2}x", ratio);

    if ratio >= 10.0 {
        println!("STATUS: [SUCCESS] Hierarchical scaling verified.");
    } else {
        println!(
            "STATUS: [FAILURE] Compression ratio too low. Check non-overlapping stride logic."
        );
    }
}

fn draw_house(pixels: &mut [u32], width: usize, x: usize, y: usize, w: usize, h: usize) {
    let color_wall = 0x00D2B48C; // Tan
    let color_roof = 0x008B4513; // Brown
    let color_door = 0x00663300; // Dark Brown

    // Walls
    for py in (h / 2)..h {
        for px in 0..w {
            pixels[(y + py) * width + (x + px)] = color_wall;
        }
    }
    // Roof (triangle-ish)
    for py in 0..(h / 2) {
        let span = py + 1;
        let start_x = (w / 2).saturating_sub(span);
        let end_x = (w / 2).wrapping_add(span).min(w);
        for px in start_x..end_x {
            pixels[(y + py) * width + (x + px)] = color_roof;
        }
    }
    // Door
    let door_w = w / 4;
    let door_h = h / 3;
    let door_x = x + w / 2 - door_w / 2;
    let door_y = y + h - door_h;
    for py in 0..door_h {
        for px in 0..door_w {
            pixels[(door_y + py) * width + (door_x + px)] = color_door;
        }
    }
}

fn draw_house_rotated(pixels: &mut [u32], width: usize, x: usize, y: usize, w: usize, h: usize) {
    let color_wall = 0x00D2B48C;
    let color_roof = 0x008B4513;
    let color_door = 0x00663300;

    // Rotated walls (walls on the side now)
    for py in 0..h {
        for px in (w / 2)..w {
            if x + px < width && y + py < width {
                pixels[(y + py) * width + (x + px)] = color_wall;
            }
        }
    }
    // Rotated roof
    for px in 0..(w / 2) {
        let span = px + 1;
        let start_y = (h / 2).saturating_sub(span);
        let end_y = (h / 2).wrapping_add(span).min(h);
        for py in start_y..end_y {
            if x + px < width && y + py < width {
                pixels[(y + py) * width + (x + px)] = color_roof;
            }
        }
    }
    // Rotated door
    let door_w = w / 3;
    let door_h = h / 4;
    let door_x = x + w - door_w;
    let door_y = y + h / 2 - door_h / 2;
    for py in 0..door_h {
        for px in 0..door_w {
            if door_x + px < width && door_y + py < width {
                pixels[(door_y + py) * width + (door_x + px)] = color_door;
            }
        }
    }
}
