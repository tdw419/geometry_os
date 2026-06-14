use crate::kernel::rng::RngEngine;
use crate::kernel::world::FileParticle;

pub struct EntropyParams {
    pub metabolic_rate: f32,         // Energy lost per tick
    pub kinetic_cost: f32,           // Energy lost per unit of velocity
    pub reproduction_cost: f32,      // Energy lost when spawning a child
    pub reproduction_threshold: f32, // Energy required to reproduce
}

pub fn apply_metabolism(p: &mut FileParticle, params: &EntropyParams) {
    // 1. Passive decay (existence cost)
    p.energy -= params.metabolic_rate;

    // 2. Kinetic decay (movement cost)
    let speed = (p.vx * p.vx + p.vy * p.vy).sqrt();
    p.energy -= speed * params.kinetic_cost;

    // Clamp energy
    p.energy = p.energy.max(0.0);
}

pub fn process_life_cycle(
    particles: &mut Vec<FileParticle>,
    params: &EntropyParams,
    rng: &mut dyn RngEngine,
) -> Vec<FileParticle> {
    let mut newborns = Vec::new();
    let mut next_id = particles.iter().map(|p| p.id).max().unwrap_or(0) + 1;

    // 1. Death (Entropy takes its toll)
    particles.retain(|p| p.energy > 0.0);

    // 2. Reproduction (Evolutionary pressure)
    for p in particles.iter_mut() {
        if p.energy > params.reproduction_threshold {
            p.energy -= params.reproduction_cost;

            let mut child = p.clone();
            child.id = next_id;
            next_id += 1;

            // Mutation: slight spatial offset and velocity kick
            let offset_x = (rng.gen_range_f32(0.0, 10.0) - 5.0) as i32;
            let offset_y = (rng.gen_range_f32(0.0, 10.0) - 5.0) as i32;
            child.x = (child.x as i32 + offset_x).clamp(0, 1023) as u32;
            child.y = (child.y as i32 + offset_y).clamp(0, 1023) as u32;
            child.vx += rng.gen_range_f32(-1.0, 1.0);
            child.vy += rng.gen_range_f32(-1.0, 1.0);

            // Child starts with half parent's energy
            child.energy = params.reproduction_cost * 0.5;

            // Semantic Mutation
            for k in 0..4 {
                child.semantic_vector[k] += rng.gen_range_f32(-0.1, 0.1);
            }

            newborns.push(child);
        }
    }

    newborns
}
