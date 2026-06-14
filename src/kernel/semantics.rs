use crate::kernel::physics::PhysicsParams;
use crate::kernel::world::FileParticle;

pub struct SemanticParams {
    pub k_semantic: f32,
    pub coupling_radius: f32,
    pub drift_rate: f32, // Rate at which particles absorb semantics from neighbors
}

pub fn apply_semantic_field(particles: &mut [FileParticle], params: &SemanticParams, dt: f32) {
    apply_semantic_field_excluded(particles, params, dt, &[]);
}

/// Apply semantic field with an exclusion set.
/// Particles in `frozen_ids` skip semantic averaging (line 66-71) — their
/// semantic vectors are left for memory-driven orthogonal innovation to control.
/// This prevents the averaging collapse that would otherwise counteract v8.3.
pub fn apply_semantic_field_excluded(
    particles: &mut [FileParticle],
    params: &SemanticParams,
    dt: f32,
    frozen_ids: &[u64],
) {
    let frozen_set: std::collections::HashSet<u64> = frozen_ids.iter().copied().collect();
    let others = particles.to_vec();

    for p in particles.iter_mut() {
        let mut fx = 0.0;
        let mut fy = 0.0;

        let mut neighbor_semantic_influence = [0.0; 4];
        let mut influence_weight = 0.0;

        for other in &others {
            if p.id == other.id {
                continue;
            }

            let dx = other.x as f32 - p.x as f32;
            let dy = other.y as f32 - p.y as f32;
            let dist_sq = dx * dx + dy * dy + 1.0;
            let dist = dist_sq.sqrt();

            if dist < params.coupling_radius {
                // Calculate semantic similarity (dot product of normalized vectors)
                let mut dot = 0.0;
                let mut norm_p = 0.0;
                let mut norm_o = 0.0;
                for k in 0..4 {
                    dot += p.semantic_vector[k] * other.semantic_vector[k];
                    norm_p += p.semantic_vector[k] * p.semantic_vector[k];
                    norm_o += other.semantic_vector[k] * other.semantic_vector[k];
                }

                let norm_p = norm_p.sqrt().max(0.001);
                let norm_o = norm_o.sqrt().max(0.001);
                let similarity = dot / (norm_p * norm_o); // Range [-1.0, 1.0]

                // Semantic Tension: Attract if similar, repel if orthogonal/opposite
                // The force acts over a long distance, inversely proportional to distance
                let force = (similarity * params.k_semantic) / dist;
                fx += dx / dist * force;
                fy += dy / dist * force;

                // Memory leakage / Semantic drift
                // Particles slowly align their semantic vectors with physically close neighbors
                let weight = 1.0 / dist_sq;
                for k in 0..4 {
                    neighbor_semantic_influence[k] += other.semantic_vector[k] * weight;
                }
                influence_weight += weight;
            }
        }

        // Apply spatial pull from meaning
        p.vx += fx * dt;
        p.vy += fy * dt;

        // Apply semantic drift (proto-communication / learning)
        // v8.3: Skip averaging for frozen particles — their semantics are
        // controlled by memory-driven orthogonal innovation instead.
        if influence_weight > 0.0 && !frozen_set.contains(&p.id) {
            for k in 0..4 {
                let target = neighbor_semantic_influence[k] / influence_weight;
                p.semantic_vector[k] += (target - p.semantic_vector[k]) * params.drift_rate * dt;
            }
        }
    }
}
