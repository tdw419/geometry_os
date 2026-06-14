use crate::kernel::rng::RngEngine;
use crate::kernel::world::FileParticle;

pub fn load_pxl1_stub(rng: &mut dyn RngEngine) -> Vec<FileParticle> {
    let mut particles = Vec::new();
    for i in 0..10 {
        particles.push(FileParticle {
            id: i as u64,
            size: 128,
            x: (rng.next_f32() * 1024.0) as u32,
            y: (rng.next_f32() * 1024.0) as u32,
            vx: 0.0,
            vy: 0.0,
            energy: 1.0,
            file_type: (i % 4) as u32,
            semantic_vector: [
                rng.gen_range_f32(-1.0, 1.0),
                rng.gen_range_f32(-1.0, 1.0),
                rng.gen_range_f32(-1.0, 1.0),
                rng.gen_range_f32(-1.0, 1.0),
            ],
        });
    }
    particles
}
