// vision_render.rs -- Exercise the GPU rendering pipeline for Substrate and Particles

use geometry_os::kernel::render::{SubstrateConfig, VisualCortex};
use geometry_os::kernel::world::FileParticle;
use geometry_os::tile_store::CHUNK_SIZE;
use pollster::block_on;

fn main() {
    println!("[vision_render] Initializing Visual Cortex...");

    let width = 1024;
    let height = 1024;

    let cortex = match block_on(VisualCortex::new(width, height)) {
        Ok(c) => c,
        Err(e) => {
            eprintln!("[vision_render] Failed to initialize Visual Cortex: {}", e);
            return;
        },
    };

    // 1. Prepare Substrate Atlas Data (Mock)
    // Create a 2x2 chunk atlas (128x128 pixels total)
    let atlas_width_chunks = 2u32;
    let pixels_per_chunk = (CHUNK_SIZE * CHUNK_SIZE) as u32;
    let mut atlas =
        vec![0u32; (atlas_width_chunks * atlas_width_chunks * pixels_per_chunk) as usize];

    // Fill chunks with patterns
    for cy in 0..atlas_width_chunks {
        for cx in 0..atlas_width_chunks {
            let chunk_idx = cy * atlas_width_chunks + cx;
            let offset = (chunk_idx * pixels_per_chunk) as usize;

            // Fill chunk with a color based on its index
            let color = match chunk_idx {
                0 => 0xFF0000FF, // Red
                1 => 0xFF00FF00, // Green
                2 => 0xFFFF0000, // Blue
                3 => 0xFFFFFFFF, // White
                _ => 0xFF888888,
            };

            for i in 0..pixels_per_chunk {
                atlas[offset + i as usize] = color;
            }
        }
    }

    let config = SubstrateConfig {
        atlas_width_chunks,
        chunk_size: CHUNK_SIZE as u32,
        screen_width: width,
        screen_height: height,
        camera_x: 0,
        camera_y: 0,
        _padding: [0; 2],
    };

    // 2. Prepare Particles (Mock)
    let particles = vec![
        FileParticle {
            id: 1,
            size: 1,
            x: 512,
            y: 512,
            vx: 0.0,
            vy: 0.0,
            energy: 1.0,
            file_type: 1, // Cyan
            semantic_vector: [0.0; 4],
        },
        FileParticle {
            id: 2,
            size: 1,
            x: 100,
            y: 100,
            vx: 0.0,
            vy: 0.0,
            energy: 1.0,
            file_type: 2, // Purple
            semantic_vector: [0.0; 4],
        },
        FileParticle {
            id: 3,
            size: 1,
            x: 900,
            y: 900,
            vx: 0.0,
            vy: 0.0,
            energy: 1.0,
            file_type: 3, // Green
            semantic_vector: [0.0; 4],
        },
    ];

    println!("[vision_render] Rendering substrate and particles to output.png...");

    match block_on(cortex.render_to_file(&particles, Some((&atlas, config)), "output.png")) {
        Ok(_) => println!("[vision_render] Success! Result saved to output.png"),
        Err(e) => eprintln!("[vision_render] Render failed: {}", e),
    }
}
