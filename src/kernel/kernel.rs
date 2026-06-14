use crate::kernel::attractors::{apply_attractors, Attractor};
use crate::kernel::cf::CFDetector;
use crate::kernel::coherence::FieldCoherenceDetector;
use crate::kernel::competition::{resolve_field_competition, CompetitionParams};
use crate::kernel::diagnostics::{AblationFlags, PhaseCollector};
use crate::kernel::entropy::{apply_metabolism, process_life_cycle, EntropyParams};
use crate::kernel::observation::ObservationSystem;
use crate::kernel::rng::{KernelRng, RngEngine};
use crate::kernel::semantics::{apply_semantic_field, SemanticParams};
use crate::kernel::spatial::SpatialHash;
use crate::kernel::telemetry::TelemetrySystem;
use crate::kernel::world::FileParticle;

pub struct Kernel {
    pub particles: Vec<FileParticle>,
    pub sit: crate::kernel::sit::SIT,
    pub coherence: FieldCoherenceDetector,
    pub cf_detector: CFDetector,
    pub observation_system: ObservationSystem,
    pub telemetry: TelemetrySystem,
    pub rng: KernelRng,
    pub spatial_hash: SpatialHash,
    pub tick: u64,
    /// Ablation flags for controlled subsystem removal.
    pub ablation: AblationFlags,
    /// Phase diagram collector (optional — None for normal operation).
    pub phase_collector: Option<PhaseCollector>,
}

impl Kernel {
    pub fn new(particles: Vec<FileParticle>, seed: u64) -> Self {
        Self {
            particles,
            sit: crate::kernel::sit::SIT::new(),
            coherence: FieldCoherenceDetector::new(),
            cf_detector: CFDetector::new(),
            observation_system: ObservationSystem::new(),
            telemetry: TelemetrySystem::new(),
            rng: KernelRng::new(seed),
            spatial_hash: SpatialHash::new(100.0),
            tick: 0,
            ablation: AblationFlags::default(),
            phase_collector: None,
        }
    }

    /// Create a kernel with specific ablation flags and phase collector.
    pub fn with_diagnostics(
        particles: Vec<FileParticle>,
        seed: u64,
        ablation: AblationFlags,
        sample_interval: u64,
    ) -> Self {
        Self {
            particles,
            sit: crate::kernel::sit::SIT::new(),
            coherence: FieldCoherenceDetector::new(),
            cf_detector: CFDetector::new(),
            observation_system: ObservationSystem::new(),
            telemetry: TelemetrySystem::new(),
            rng: KernelRng::new(seed),
            spatial_hash: SpatialHash::new(100.0),
            tick: 0,
            ablation,
            phase_collector: Some(PhaseCollector::new(sample_interval)),
        }
    }

    pub fn step(&mut self) {
        let physics_params = crate::kernel::physics::PhysicsParams {
            k_density: 3.0,
            k_void: 0.01,
            k_dir: 0.5,
            dt: 1.0,
        };

        let entropy_params = EntropyParams {
            metabolic_rate: 0.001,
            kinetic_cost: 0.001,
            reproduction_cost: 0.2,
            reproduction_threshold: 0.5,
        };

        let competition_params = CompetitionParams {
            merge_threshold: 80.0,
            split_threshold: 300.0,
            dominance_factor: 1.2,
        };

        let semantic_params = SemanticParams {
            k_semantic: 1.5,
            coupling_radius: 150.0,
            drift_rate: 0.05,
        };

        // Rebuild spatial hash for this tick
        self.spatial_hash.rebuild(&self.particles);

        // 1. Energy Intake (harvesting with carrying capacity scaling)
        let max_particles = 1000;
        let harvest_chance =
            0.1 * (1.0 - (self.particles.len() as f32 / max_particles as f32)).max(0.0);

        for p in &mut self.particles {
            if self.rng.next_f32() < harvest_chance {
                p.energy += 0.3;
            }
        }

        // 1.5 Semantic Field Coupling
        apply_semantic_field(&mut self.particles, &semantic_params, physics_params.dt);

        // 2. Attractor Phase
        let attractors: Vec<Attractor> = self
            .coherence
            .clusters
            .values()
            .map(|c| Attractor {
                x: c.center_x,
                y: c.center_y,
                strength: 8.0 * c.stability,
                radius: 300.0,
            })
            .collect();

        for p in &mut self.particles {
            apply_attractors(p, &attractors, &physics_params);
        }

        // 3. Physics Step (with spatial hash)
        crate::kernel::physics::step_physics(
            &mut self.particles,
            &physics_params,
            &self.spatial_hash,
        );

        // 4. Metabolism Step
        for p in &mut self.particles {
            apply_metabolism(p, &entropy_params);
        }

        // 5. Life Cycle Step (RNG passed explicitly)
        let mut newborns = process_life_cycle(&mut self.particles, &entropy_params, &mut self.rng);
        self.particles.append(&mut newborns);

        // 6. Field Coherence & Competition Detection
        self.coherence.detect(&self.particles, self.tick);
        resolve_field_competition(&mut self.coherence, &competition_params);

        // 6.5 Observation Phase (perception — runs BEFORE CF decisions)
        self.observation_system.update(
            &self.cf_detector.fields,
            &self.coherence.clusters,
            physics_params.dt,
        );

        // 6.6 Consciousness Fields (decision — uses observations to compute intent)
        // Ablation: pass flags so CF can skip memory bias and/or novelty pressure
        self.cf_detector.process(
            &self.coherence.clusters,
            &self.observation_system.observations,
            physics_params.dt,
            &self.ablation,
        );

        // 6.7 Apply CF Intent back to particles (action)
        for (id, cf) in &self.cf_detector.fields {
            if let Some(cluster) = self.coherence.clusters.get(id) {
                let budget = cf.intent_energy_budget;
                for p in &mut self.particles {
                    if cluster.particle_ids.contains(&p.id) {
                        p.vx += cf.intent_vector[0] * budget * physics_params.dt;
                        p.vy += cf.intent_vector[1] * budget * physics_params.dt;
                    }
                }
            }
        }

        // 6.8 Memory outcome recording (v8)
        // Evaluate outcome of current state and record in CF memory.
        // Separate pass to avoid double borrow on cf_detector.fields.
        // NOTE: memory is always recorded (even when ablation disables reading it)
        // so that the reuse rate metric is consistent across ablation modes.
        {
            let clusters = &self.coherence.clusters;
            let observations = &self.observation_system.observations;
            let mut fields_to_update: Vec<(
                u64,
                crate::kernel::memory::SituationSignature,
                f32,
                [f32; 2],
            )> = Vec::new();

            for (id, cf) in &self.cf_detector.fields {
                if let Some(cluster) = clusters.get(id) {
                    let stability_score = cluster.stability;
                    let energy_ratio = (cluster.total_energy / 10.0).min(1.0);
                    let outcome = stability_score * 0.6 + energy_ratio * 0.4;

                    let (pressure, n_count, sem_sim) = if let Some(o) = observations.get(id) {
                        let pm = (o.world_motion_vector[0].powi(2)
                            + o.world_motion_vector[1].powi(2))
                        .sqrt();
                        let avg_sem = o
                            .horizon
                            .iter()
                            .map(|e| e.relative_semantic_similarity)
                            .sum::<f32>()
                            / (o.horizon.len().max(1) as f32);
                        (pm, o.horizon.len(), avg_sem)
                    } else {
                        (0.0, 0, 0.0)
                    };

                    let sig = crate::kernel::memory::MemoryStore::compute_signature(
                        energy_ratio,
                        pressure,
                        n_count,
                        sem_sim,
                    );

                    fields_to_update.push((*id, sig, outcome, cf.intent_vector));
                }
            }

            for (id, sig, outcome, action) in fields_to_update {
                if let Some(cf) = self.cf_detector.fields.get_mut(&id) {
                    // Track whether this is an update or insert for phase collector
                    let was_update = cf.memory.find_matching(&sig).is_some();
                    cf.memory.record_outcome(sig, outcome, action);
                    if let Some(ref mut collector) = self.phase_collector {
                        collector.record_memory_op(was_update);
                    }
                }
            }
        }

        // 6.9 Memory-driven semantic drift (v8.3)
        // Memory modifies FIELDS (semantic vectors), not FORCES (velocity).
        // When a CF is stuck in repetition, memory applies orthogonal innovation
        // to the cluster's semantic vectors, reshaping the interaction landscape.
        // This is the key architectural change: memory controls slow variables.
        if !self.ablation.disable_memory {
            // Collect semantic drifts per CF (avoid double borrow)
            let mut semantic_drifts: Vec<(u64, [f32; 4])> = Vec::new();
            let mut semantic_basis_updates: Vec<(u64, [f32; 4])> = Vec::new();

            for (id, cf) in &self.cf_detector.fields {
                if let Some(cluster) = self.coherence.clusters.get(id) {
                    // Compute cluster mean semantic vector for basis tracking
                    let mut mean_sem = [0.0_f32; 4];
                    let mut count = 0usize;
                    for pid in &cluster.particle_ids {
                        if let Some(p) = self.particles.iter().find(|p| p.id == *pid) {
                            for k in 0..4 {
                                mean_sem[k] += p.semantic_vector[k];
                            }
                            count += 1;
                        }
                    }
                    if count > 0 {
                        for k in 0..4 {
                            mean_sem[k] /= count as f32;
                        }
                        semantic_basis_updates.push((*id, mean_sem));
                    }

                    // Compute semantic novelty drift
                    let drift = cf.memory.semantic_novelty_drift();
                    let drift_mag: f32 = drift.iter().map(|v| v * v).sum::<f32>().sqrt();
                    if drift_mag > 0.0001 {
                        semantic_drifts.push((*id, drift));
                    }
                }
            }

            // Update semantic basis in CF memory
            for (id, mean_sem) in semantic_basis_updates {
                if let Some(cf) = self.cf_detector.fields.get_mut(&id) {
                    cf.memory.record_semantic_direction(mean_sem);
                }
            }

            // Apply semantic drift to cluster particles
            for (id, drift) in semantic_drifts {
                if let Some(cluster) = self.coherence.clusters.get(&id) {
                    for p in &mut self.particles {
                        if cluster.particle_ids.contains(&p.id) {
                            for k in 0..4 {
                                p.semantic_vector[k] += drift[k];
                            }
                        }
                    }
                }
            }
        }

        // 7. Update SIT
        for p in &self.particles {
            self.sit.update(p.id, (p.x, p.y));
        }

        // 8. Telemetry (TEC — pure measurement, no influence on behavior)
        // Ablation: skip TEC to verify it has no behavioral effect
        if !self.ablation.disable_tec {
            self.telemetry.record_tick(
                &self.coherence.clusters,
                &self.observation_system.observations,
            );
        }

        // 9. Phase diagram sampling (if collector is attached)
        if let Some(ref mut collector) = self.phase_collector {
            if self.tick > 0 && self.tick % collector.sample_interval == 0 {
                collector.sample(
                    self.tick,
                    &self.particles,
                    &self.telemetry,
                    &self.cf_detector.fields,
                    &self.coherence.clusters,
                );
            }
        }

        self.tick += 1;
    }

    /// Serialize all mutable state for deterministic replay comparison.
    pub fn snapshot(&self) -> KernelSnapshot {
        KernelSnapshot {
            tick: self.tick,
            particles: self.particles.clone(),
        }
    }
}

#[derive(Clone, Debug)]
pub struct KernelSnapshot {
    pub tick: u64,
    pub particles: Vec<FileParticle>,
}

impl PartialEq for KernelSnapshot {
    fn eq(&self, other: &Self) -> bool {
        if self.tick != other.tick {
            return false;
        }
        if self.particles.len() != other.particles.len() {
            return false;
        }
        for (a, b) in self.particles.iter().zip(other.particles.iter()) {
            if a.id != b.id {
                return false;
            }
            if a.x != b.x || a.y != b.y {
                return false;
            }
            if (a.energy - b.energy).abs() > 0.001 {
                return false;
            }
            if (a.vx - b.vx).abs() > 0.001 {
                return false;
            }
            if (a.vy - b.vy).abs() > 0.001 {
                return false;
            }
        }
        true
    }
}
