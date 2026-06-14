use crate::kernel::world::FileParticle;
use std::collections::BTreeMap;

#[derive(Clone, Debug)]
pub struct CoherentCluster {
    pub id: u64,
    pub center_x: f32,
    pub center_y: f32,
    pub radius: f32,
    pub particle_ids: Vec<u64>,
    pub stability: f32, // Persistence over time
    pub total_energy: f32,
}

pub struct FieldCoherenceDetector {
    pub clusters: BTreeMap<u64, CoherentCluster>,
    next_cluster_id: u64,
}

impl FieldCoherenceDetector {
    pub fn new() -> Self {
        Self {
            clusters: BTreeMap::new(),
            next_cluster_id: 1,
        }
    }

    pub fn detect(&mut self, particles: &[FileParticle], tick: u64) {
        // 1. Simple Spatial Clustering (DBSCAN-lite or Grid-based)
        // For v2, we'll use a simple proximity-based grouping
        let mut groups: Vec<Vec<u64>> = Vec::new();
        let mut assigned = vec![false; particles.len()];

        for i in 0..particles.len() {
            if assigned[i] {
                continue;
            }

            let mut current_group = vec![particles[i].id];
            assigned[i] = true;

            for j in (i + 1)..particles.len() {
                if assigned[j] {
                    continue;
                }

                let dx = particles[i].x as f32 - particles[j].x as f32;
                let dy = particles[i].y as f32 - particles[j].y as f32;
                let dist_sq = dx * dx + dy * dy;

                if dist_sq < 2500.0 {
                    // 50px radius
                    current_group.push(particles[j].id);
                    assigned[j] = true;
                }
            }

            if current_group.len() > 1 {
                groups.push(current_group);
            }
        }

        // 2. Update/Crystallize Clusters
        let mut new_clusters = BTreeMap::new();
        for group in groups {
            let mut sum_x = 0.0;
            let mut sum_y = 0.0;
            let mut total_energy = 0.0;

            let members: Vec<&FileParticle> =
                particles.iter().filter(|p| group.contains(&p.id)).collect();

            for p in &members {
                sum_x += p.x as f32;
                sum_y += p.y as f32;
                total_energy += p.energy;
            }

            let count = members.len() as f32;
            let center_x = sum_x / count;
            let center_y = sum_y / count;

            // Find existing cluster by center proximity
            let mut found_id = None;
            for (id, cluster) in &self.clusters {
                let dx = cluster.center_x - center_x;
                let dy = cluster.center_y - center_y;
                if dx * dx + dy * dy < 10000.0 {
                    found_id = Some(*id);
                    break;
                }
            }

            let cluster_id = found_id.unwrap_or_else(|| {
                let id = self.next_cluster_id;
                self.next_cluster_id += 1;
                id
            });

            let stability = if let Some(prev) = self.clusters.get(&cluster_id) {
                (prev.stability + 0.1).min(1.0)
            } else {
                0.1
            };

            new_clusters.insert(
                cluster_id,
                CoherentCluster {
                    id: cluster_id,
                    center_x,
                    center_y,
                    radius: 50.0, // Fixed for now
                    particle_ids: group,
                    stability,
                    total_energy,
                },
            );
        }

        self.clusters = new_clusters;
    }
}
