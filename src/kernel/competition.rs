use crate::kernel::coherence::{CoherentCluster, FieldCoherenceDetector};

pub struct CompetitionParams {
    pub merge_threshold: f32,
    pub split_threshold: f32,
    pub dominance_factor: f32,
}

pub fn resolve_field_competition(
    detector: &mut FieldCoherenceDetector,
    params: &CompetitionParams,
) {
    let mut to_merge: Vec<(u64, u64)> = Vec::new();
    let cluster_ids: Vec<u64> = detector.clusters.keys().cloned().collect();

    for i in 0..cluster_ids.len() {
        for j in (i + 1)..cluster_ids.len() {
            let id_a = cluster_ids[i];
            let id_b = cluster_ids[j];

            let (c_a, c_b) = {
                let a = detector.clusters.get(&id_a).unwrap();
                let b = detector.clusters.get(&id_b).unwrap();
                (a, b)
            };

            let dx = c_a.center_x - c_b.center_x;
            let dy = c_a.center_y - c_b.center_y;
            let dist_sq = dx * dx + dy * dy;

            if dist_sq < params.merge_threshold * params.merge_threshold {
                to_merge.push((id_a, id_b));
            }
        }
    }

    for (id_a, id_b) in to_merge {
        if !detector.clusters.contains_key(&id_a) || !detector.clusters.contains_key(&id_b) {
            continue;
        }

        let (winner, loser) = {
            let c_a = detector.clusters.get(&id_a).unwrap();
            let c_b = detector.clusters.get(&id_b).unwrap();
            if c_a.stability * c_a.total_energy >= c_b.stability * c_b.total_energy {
                (id_a, id_b)
            } else {
                (id_b, id_a)
            }
        };

        let mut loser_data = detector.clusters.remove(&loser).unwrap();
        let winner_data = detector.clusters.get_mut(&winner).unwrap();

        let total_particles =
            (winner_data.particle_ids.len() + loser_data.particle_ids.len()) as f32;
        winner_data.center_x = (winner_data.center_x * winner_data.particle_ids.len() as f32
            + loser_data.center_x * loser_data.particle_ids.len() as f32)
            / total_particles;
        winner_data.center_y = (winner_data.center_y * winner_data.particle_ids.len() as f32
            + loser_data.center_y * loser_data.particle_ids.len() as f32)
            / total_particles;

        winner_data
            .particle_ids
            .append(&mut loser_data.particle_ids);
        winner_data.total_energy += loser_data.total_energy;
        winner_data.stability = (winner_data.stability + 0.2).min(1.0);
    }
}
