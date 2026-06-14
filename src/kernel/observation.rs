use crate::kernel::cf::ConsciousnessField;
use crate::kernel::coherence::CoherentCluster;
use std::collections::BTreeMap;

#[derive(Clone, Debug)]
pub struct SemanticHorizonEntry {
    pub other_id: u64,
    pub relative_distance: f32,
    pub relative_semantic_similarity: f32,
    pub external_pressure: f32,
}

#[derive(Clone, Debug)]
pub struct ObservationField {
    pub ego_id: u64,
    pub horizon: Vec<SemanticHorizonEntry>,
    pub world_motion_vector: [f32; 2], // Perceived motion of the environment
    pub self_other_distinction: f32,   // 0.0 = noise, 1.0 = clear boundary
}

pub struct ObservationSystem {
    pub observations: BTreeMap<u64, ObservationField>,
}

impl ObservationSystem {
    pub fn new() -> Self {
        Self {
            observations: BTreeMap::new(),
        }
    }

    pub fn update(
        &mut self,
        fields: &BTreeMap<u64, ConsciousnessField>,
        clusters: &BTreeMap<u64, CoherentCluster>,
        dt: f32,
    ) {
        let mut new_observations = BTreeMap::new();

        for (ego_id, _ego_field) in fields {
            let ego_cluster = match clusters.get(ego_id) {
                Some(c) => c,
                None => continue, // Cluster no longer exists (merged/split)
            };
            let mut horizon = Vec::new();
            let mut total_world_fx = 0.0;
            let mut total_world_fy = 0.0;

            for (other_id, other_cluster) in clusters {
                if ego_id == other_id {
                    continue;
                }

                let dx = other_cluster.center_x - ego_cluster.center_x;
                let dy = other_cluster.center_y - ego_cluster.center_y;
                let dist_sq = dx * dx + dy * dy + 1.0;
                let dist = dist_sq.sqrt();

                if dist < 500.0 {
                    let similarity = 1.0 - (dist / 500.0);

                    horizon.push(SemanticHorizonEntry {
                        other_id: *other_id,
                        relative_distance: dist,
                        relative_semantic_similarity: similarity,
                        external_pressure: other_cluster.total_energy / dist_sq,
                    });

                    let p = other_cluster.total_energy / dist_sq;
                    total_world_fx += (dx / dist) * p;
                    total_world_fy += (dy / dist) * p;
                }
            }

            let world_motion_x = total_world_fx * dt;
            let world_motion_y = total_world_fy * dt;

            let boundary_clarity = (ego_cluster.stability
                - (world_motion_x.abs() + world_motion_y.abs()) * 0.1)
                .clamp(0.0, 1.0);

            new_observations.insert(
                *ego_id,
                ObservationField {
                    ego_id: *ego_id,
                    horizon,
                    world_motion_vector: [world_motion_x, world_motion_y],
                    self_other_distinction: boundary_clarity,
                },
            );
        }

        self.observations = new_observations;
    }
}
