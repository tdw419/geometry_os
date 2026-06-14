use crate::kernel::coherence::CoherentCluster;
use crate::kernel::memory::{MemoryStore, SituationSignature};
use crate::kernel::observation::ObservationField;
use std::collections::BTreeMap;

#[derive(Clone, Debug)]
pub struct SelfModel {
    pub expected_center_x: f32,
    pub expected_center_y: f32,
    pub expected_radius: f32,
    pub expected_energy: f32,
    pub predicted_stability: f32,
}

#[derive(Clone, Debug)]
pub struct ConsciousnessField {
    pub cluster_id: u64,
    pub self_model: SelfModel,
    pub intent_vector: [f32; 2],
    pub intent_energy_budget: f32,
    pub semantic_drift: f32,
    pub memory: MemoryStore,
}

// ── Tuning constants ──────────────────────────────────────────────────────────

const ERROR_GAIN: f32 = 0.5;
const PRESSURE_GAIN: f32 = 0.4;
const DRIFT_COMPENSATION: f32 = 0.2;
const ENERGY_BUDGET_BASE: f32 = 0.05;
const SELF_MODEL_SMOOTHING: f32 = 0.1;

pub struct CFDetector {
    pub fields: BTreeMap<u64, ConsciousnessField>,
}

impl CFDetector {
    pub fn new() -> Self {
        Self {
            fields: BTreeMap::new(),
        }
    }

    /// Process all clusters: update self-models and compute perception-informed intent.
    ///
    /// Intent terms:
    ///   1. Error correction (self-model prediction error)
    ///   2. Pressure avoidance (repel from high-energy neighbors)
    ///   3. Drift compensation (counteract perceived world motion)
    ///   4. Semantic drift (SIT alignment toward similar clusters)
    ///   5. Memory bias (v8: experience-guided direction)
    ///   6. Anti-attractor / novelty pressure (v8.1: orthogonal perturbation on repetition)
    pub fn process(
        &mut self,
        clusters: &BTreeMap<u64, CoherentCluster>,
        observations: &BTreeMap<u64, ObservationField>,
        dt: f32,
        ablation: &crate::kernel::diagnostics::AblationFlags,
    ) {
        let mut new_fields = BTreeMap::new();

        for (id, cluster) in clusters {
            if cluster.stability > 0.5 {
                // Carry over memory from previous CF (or start fresh)
                let mut memory = if let Some(cf) = self.fields.get(id) {
                    let mut m = cf.memory.clone();
                    m.decay(); // decay all traces each tick
                    m
                } else {
                    MemoryStore::new()
                };

                let mut self_model = if let Some(cf) = self.fields.get(id) {
                    cf.self_model.clone()
                } else {
                    SelfModel {
                        expected_center_x: cluster.center_x,
                        expected_center_y: cluster.center_y,
                        expected_radius: cluster.radius,
                        expected_energy: cluster.total_energy,
                        predicted_stability: cluster.stability,
                    }
                };

                let error_x = cluster.center_x - self_model.expected_center_x;
                let error_y = cluster.center_y - self_model.expected_center_y;
                let error_energy = cluster.total_energy - self_model.expected_energy;

                self_model.expected_center_x += error_x * SELF_MODEL_SMOOTHING * dt;
                self_model.expected_center_y += error_y * SELF_MODEL_SMOOTHING * dt;
                self_model.expected_energy += error_energy * SELF_MODEL_SMOOTHING * dt;

                self_model.predicted_stability =
                    (cluster.stability - (error_x.abs() + error_y.abs()) * 0.001).clamp(0.0, 1.0);

                // ── Term 1: Error correction (original behavior) ──
                let mut intent_x = 0.0_f32;
                let mut intent_y = 0.0_f32;

                if error_energy < 0.0 || self_model.predicted_stability < cluster.stability {
                    intent_x += -error_x * ERROR_GAIN;
                    intent_y += -error_y * ERROR_GAIN;
                }

                // ── Terms 2-4: Perception-informed (v7) ──
                let mut semantic_drift = 0.0_f32;
                let mut energy_budget = ENERGY_BUDGET_BASE;
                let mut pressure_mag = 0.0_f32;
                let mut neighbor_count = 0usize;
                let mut avg_semantic_similarity = 0.0_f32;

                if let Some(obs) = observations.get(id) {
                    // Term 2: Pressure avoidance
                    let wmx = obs.world_motion_vector[0];
                    let wmy = obs.world_motion_vector[1];
                    pressure_mag = (wmx * wmx + wmy * wmy).sqrt();

                    if pressure_mag > 0.001 {
                        let boundary_mod = obs.self_other_distinction.max(0.1);
                        intent_x += (-wmx / pressure_mag) * PRESSURE_GAIN * boundary_mod;
                        intent_y += (-wmy / pressure_mag) * PRESSURE_GAIN * boundary_mod;
                    }

                    // Term 3: Drift compensation
                    intent_x -= obs.world_motion_vector[0] * DRIFT_COMPENSATION;
                    intent_y -= obs.world_motion_vector[1] * DRIFT_COMPENSATION;

                    // Term 4: Semantic drift signal (scalar, for SIT alignment)
                    neighbor_count = obs.horizon.len();
                    avg_semantic_similarity = obs
                        .horizon
                        .iter()
                        .map(|e| e.relative_semantic_similarity)
                        .sum::<f32>()
                        / (neighbor_count.max(1) as f32);
                    semantic_drift = avg_semantic_similarity;

                    // Scale energy budget by threat
                    let threat = (pressure_mag * 10.0).min(1.0);
                    energy_budget = ENERGY_BUDGET_BASE * (1.0 - threat * 0.5);
                }

                // ── Term 5: Memory bias (v8) ──
                // norm_energy is needed for both memory bias and energy budget scaling
                let norm_energy = (cluster.total_energy / 10.0).min(1.0);
                // Ablation: skip memory bias when disabled
                if !ablation.disable_memory {
                    let sig = MemoryStore::compute_signature(
                        norm_energy,
                        pressure_mag,
                        neighbor_count,
                        avg_semantic_similarity,
                    );
                    let bias = memory.query_bias(&sig);
                    intent_x += bias[0];
                    intent_y += bias[1];
                }

                // NOTE: v8.3 removed Term 6 (novelty_pressure on velocity).
                // Memory now influences the SEMANTIC MANIFOLD instead of velocity.
                // See kernel.rs step() for semantic drift application.
                // The novelty_pressure() method still exists on MemoryStore for
                // the action histogram infrastructure, but is not applied to intent.

                energy_budget *= norm_energy.max(0.01);

                new_fields.insert(
                    *id,
                    ConsciousnessField {
                        cluster_id: *id,
                        self_model,
                        intent_vector: [intent_x, intent_y],
                        intent_energy_budget: energy_budget,
                        semantic_drift,
                        memory,
                    },
                );
            }
        }

        self.fields = new_fields;
    }
}
