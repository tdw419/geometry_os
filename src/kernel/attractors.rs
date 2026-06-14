use crate::kernel::physics::PhysicsParams;
use crate::kernel::world::FileParticle;

pub struct Attractor {
    pub x: f32,
    pub y: f32,
    pub strength: f32, // Positive = attraction, Negative = repulsion
    pub radius: f32,
}

pub fn apply_attractors(p: &mut FileParticle, attractors: &[Attractor], params: &PhysicsParams) {
    let mut fx = 0.0;
    let mut fy = 0.0;

    for a in attractors {
        let dx = a.x - p.x as f32;
        let dy = a.y - p.y as f32;
        let dist_sq = dx * dx + dy * dy + 1.0;
        let dist = dist_sq.sqrt();

        if dist < a.radius {
            let force = a.strength / dist_sq;
            fx += dx * force;
            fy += dy * force;
        }
    }

    p.vx += fx * params.dt;
    p.vy += fy * params.dt;
}
