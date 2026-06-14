use crate::kernel::spatial::SpatialHash;
use crate::kernel::world::FileParticle;

pub struct PhysicsParams {
    pub k_density: f32,
    pub k_void: f32,
    pub k_dir: f32,
    pub dt: f32,
}

pub trait Force {
    fn apply(
        &self,
        p: &mut FileParticle,
        params: &PhysicsParams,
        others: &[FileParticle],
        neighbor_idx: &[usize],
    );
}

pub struct DensityRepulsion;
impl Force for DensityRepulsion {
    fn apply(
        &self,
        p: &mut FileParticle,
        params: &PhysicsParams,
        others: &[FileParticle],
        neighbor_idx: &[usize],
    ) {
        let mut fx = 0.0;
        let mut fy = 0.0;

        for &j in neighbor_idx {
            if p.id == others[j].id {
                continue;
            }

            let dx = p.x as f32 - others[j].x as f32;
            let dy = p.y as f32 - others[j].y as f32;
            let dist_sq = dx * dx + dy * dy + 0.1;

            if dist_sq < 10000.0 {
                // Radius of influence
                let force = params.k_density / dist_sq;
                fx += dx * force;
                fy += dy * force;
            }
        }

        p.vx += fx * params.dt;
        p.vy += fy * params.dt;
    }
}

pub struct VoidAttraction;
impl Force for VoidAttraction {
    fn apply(
        &self,
        p: &mut FileParticle,
        params: &PhysicsParams,
        _others: &[FileParticle],
        _neighbor_idx: &[usize],
    ) {
        // Pull toward the "center of the next quadrant" to encourage exploration
        let target_x = 512.0;
        let target_y = 512.0;

        let dx = target_x - p.x as f32;
        let dy = target_y - p.y as f32;

        p.vx += dx * params.k_void * params.dt;
        p.vy += dy * params.k_void * params.dt;
    }
}

pub struct Friction;
impl Force for Friction {
    fn apply(
        &self,
        p: &mut FileParticle,
        _params: &PhysicsParams,
        _others: &[FileParticle],
        _neighbor_idx: &[usize],
    ) {
        let drag = 0.95;
        p.vx *= drag;
        p.vy *= drag;
    }
}

pub fn step_physics(particles: &mut [FileParticle], params: &PhysicsParams, hash: &SpatialHash) {
    let forces: Vec<Box<dyn Force>> = vec![
        Box::new(DensityRepulsion),
        Box::new(VoidAttraction),
        Box::new(Friction),
    ];

    let others = particles.to_vec();
    for (i, p) in particles.iter_mut().enumerate() {
        let neighbors = hash.nearby(p.x as f32, p.y as f32);
        for force in &forces {
            force.apply(p, params, &others, &neighbors);
        }

        // Apply velocity
        p.x = (p.x as f32 + p.vx).max(0.0).min(1023.0) as u32;
        p.y = (p.y as f32 + p.vy).max(0.0).min(1023.0) as u32;
    }
}
