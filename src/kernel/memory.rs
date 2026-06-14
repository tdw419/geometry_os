//! Kernel v8.3 — Adaptive Memory Layer: Semantic Landscape Plasticity
//!
//! Each ConsciousnessField accumulates compressed situation-outcome traces.
//! Memory has TWO functions:
//!   1. Reinforcement bias (query_bias): approach known-good situations
//!   2. Semantic novelty drift: expand the semantic manifold via orthogonal innovation
//!
//! v8.1-v8.2 tried to steer velocity (fast DOF) — physics dominated.
//! v8.3 shifts memory to modify semantic drift (slow DOF), creating:
//!
//!   behavior → memory → semantic drift → interaction topology → new behaviors
//!
//! The semantic manifold never collapses because drift uses ORTHOGONAL INNOVATION:
//! new directions are projected out of the span of recently seen directions,
//! preventing averaging convergence (semantic diffusion).
//!
//! Key invariants:
//!   - Memory is bounded (MAX_TRACES = 64)
//!   - Values decay exponentially each tick (no unbounded growth)
//!   - Situation signatures are coarse hashes (deterministic binning)
//!   - Learning rate is fixed (no adaptive rates that could diverge)
//!   - Repetition window is bounded (REPETITION_WINDOW = 20)
//!   - Semantic basis has SEMANTIC_BASIS_SIZE (16) stored directions
//!   - Semantic drift strength bounded by SEMANTIC_NOVELTY_MAX (0.02)
//!   - Memory modifies FIELDS (semantic vectors), not FORCES (velocity)
//!   - Physics retains exclusive control over kinematic DOFs

use std::collections::VecDeque;

/// Maximum traces per CF. Bounded to prevent memory explosion.
pub const MAX_TRACES: usize = 64;

/// Per-tick decay factor. After ~700 ticks, trace value is < 0.001.
pub const DECAY_FACTOR: f32 = 0.99;

/// How strongly memory biases intent decisions.
pub const MEMORY_GAIN: f32 = 0.3;

/// Learning rate for value updates on outcome.
pub const LEARNING_RATE: f32 = 0.1;

/// How many recent situation signatures to track for repetition detection.
pub const REPETITION_WINDOW: usize = 20;

/// Maximum strength of anti-attractor / novelty pressure.
/// This is deliberately small — it's a perturbation, not an override.
pub const NOVELTY_MAX: f32 = 0.15;

/// Repetition threshold above which novelty pressure activates.
/// Below this, the system is exploring freely and no perturbation is needed.
pub const REPETITION_THRESHOLD: f32 = 0.3;

/// Number of angular sectors for action histogram.
/// 8 sectors = 45° each. Enough resolution to find unexplored regions
/// without over-binning (which would make the histogram noisy).
pub const ACTION_SECTORS: usize = 8;

/// Size of the semantic direction basis for orthogonal innovation.
/// This is the number of recently-seen semantic directions stored per CF.
/// 16 directions in a 4D space means the basis can span the full space
/// and innovation is always orthogonal to recent history.
pub const SEMANTIC_BASIS_SIZE: usize = 16;

/// Maximum strength of semantic novelty drift per tick.
/// Deliberately small — this is a slow variable that accumulates over time.
/// At 0.02, after 100 ticks of stuck behavior, semantic vectors shift
/// by about 2.0 in a new direction — enough to reshape interaction topology.
pub const SEMANTIC_NOVELTY_MAX: f32 = 0.02;

/// Semantic vector dimensionality. Must match world.rs FileParticle.semantic_vector.
pub const SEMANTIC_DIM: usize = 4;

/// Compressed situation signature.
/// Bins key state variables into coarse categories so similar situations
/// map to the same signature and memory is reusable.
#[derive(Clone, Debug, PartialEq, Eq, Hash)]
pub struct SituationSignature {
    /// Energy level binned to 8 levels (0=depleted, 7=full)
    pub energy_bin: u8,
    /// External pressure binned to 4 levels (0=calm, 3=under siege)
    pub pressure_bin: u8,
    /// Neighbor count binned to 4 levels (0=isolated, 3=crowded)
    pub density_bin: u8,
    /// Semantic similarity to nearest neighbor binned to 4 levels
    pub semantic_bin: u8,
}

/// A single memory trace: compressed situation + accumulated value.
#[derive(Clone, Debug)]
pub struct MemoryTrace {
    pub signature: SituationSignature,
    /// Accumulated outcome value. Positive = beneficial, negative = harmful.
    /// Decays each tick.
    pub value: f32,
    /// Age in ticks since creation. Used for eviction priority.
    pub age: u32,
    /// Last intent direction taken in this situation (normalized).
    pub action_bias: [f32; 2],
}

/// Per-CF memory store. Bounded VecDeque with LRU eviction.
/// Tracks recent situation signatures for repetition detection,
/// maintains an angular action histogram, and stores a semantic basis
/// for orthogonal innovation (v8.3).
#[derive(Clone, Debug)]
pub struct MemoryStore {
    pub traces: VecDeque<MemoryTrace>,
    /// Rolling window of recent situation signatures for repetition detection.
    pub recent_signatures: VecDeque<SituationSignature>,
    /// Angular histogram of action directions across all memory traces.
    /// Sector i covers angle [i*45°, (i+1)*45°).
    /// Counts are weighted by trace value and recency.
    action_histogram: [f32; ACTION_SECTORS],
    /// Cache of total histogram weight (for normalization).
    histogram_total: f32,
    /// Semantic direction basis for orthogonal innovation (v8.3).
    /// Stores recently-seen normalized semantic vectors. When computing
    /// novelty drift, the innovation direction is projected orthogonal
    /// to all basis vectors, preventing semantic diffusion.
    semantic_basis: Vec<[f32; SEMANTIC_DIM]>,
}

impl MemoryStore {
    pub fn new() -> Self {
        Self {
            traces: VecDeque::with_capacity(MAX_TRACES),
            recent_signatures: VecDeque::with_capacity(REPETITION_WINDOW),
            action_histogram: [0.0; ACTION_SECTORS],
            histogram_total: 0.0,
            semantic_basis: Vec::with_capacity(SEMANTIC_BASIS_SIZE),
        }
    }

    /// Bin a raw value into n equal-width bins over [min, max).
    fn bin(value: f32, min: f32, max: f32, n: u8) -> u8 {
        let t = ((value - min) / (max - min)).clamp(0.0, 1.0);
        (t * (n as f32 - 1.0)).round() as u8
    }

    /// Compute the angular sector index for a 2D direction vector.
    /// Maps angle to [0, ACTION_SECTORS) using atan2.
    fn direction_to_sector(dx: f32, dy: f32) -> usize {
        // atan2 returns [-π, π], map to [0, 2π)
        let angle = dy.atan2(dx) + std::f32::consts::PI;
        // Map to sector index
        let sector =
            (angle / (2.0 * std::f32::consts::PI / ACTION_SECTORS as f32)).floor() as usize;
        sector.min(ACTION_SECTORS - 1)
    }

    /// Compute the unit direction vector for the center of a sector.
    fn sector_to_direction(sector: usize) -> [f32; 2] {
        let angle = (sector as f32 + 0.5) * (2.0 * std::f32::consts::PI / ACTION_SECTORS as f32)
            - std::f32::consts::PI;
        [angle.cos(), angle.sin()]
    }

    /// Rebuild the action histogram from all current traces.
    /// Called after eviction or when traces change structurally.
    fn rebuild_histogram(&mut self) {
        self.action_histogram = [0.0; ACTION_SECTORS];
        self.histogram_total = 0.0;

        for trace in &self.traces {
            let mag = (trace.action_bias[0].powi(2) + trace.action_bias[1].powi(2)).sqrt();
            if mag < 0.001 {
                continue;
            }

            let sector = Self::direction_to_sector(trace.action_bias[0], trace.action_bias[1]);
            // Weight by absolute value and inverse age
            let w = trace.value.abs() * (1.0 / (1.0 + trace.age as f32));
            self.action_histogram[sector] += w;
            self.histogram_total += w;
        }
    }

    /// Compute a compressed situation signature from current state.
    pub fn compute_signature(
        energy: f32,
        pressure: f32,
        neighbor_count: usize,
        semantic_similarity: f32,
    ) -> SituationSignature {
        SituationSignature {
            energy_bin: Self::bin(energy, 0.0, 1.0, 8),
            pressure_bin: Self::bin(pressure, 0.0, 1.0, 4),
            density_bin: Self::bin(neighbor_count as f32, 0.0, 20.0, 4),
            semantic_bin: Self::bin(semantic_similarity, 0.0, 1.0, 4),
        }
    }

    /// Find a trace matching this signature, if one exists.
    pub fn find_matching(&self, sig: &SituationSignature) -> Option<usize> {
        self.traces.iter().position(|t| t.signature == *sig)
    }

    /// Record an outcome for a situation.
    /// If the situation already exists in memory, update its value.
    /// Otherwise, create a new trace (evicting the oldest if at capacity).
    /// Also records the signature in the repetition window and updates
    /// the action histogram.
    pub fn record_outcome(
        &mut self,
        signature: SituationSignature,
        outcome: f32,
        action_direction: [f32; 2],
    ) {
        // Track in repetition window
        if self.recent_signatures.len() >= REPETITION_WINDOW {
            self.recent_signatures.pop_front();
        }
        self.recent_signatures.push_back(signature.clone());

        // Normalize action direction
        let mag = (action_direction[0].powi(2) + action_direction[1].powi(2)).sqrt();
        let norm_action = if mag > 0.0001 {
            [action_direction[0] / mag, action_direction[1] / mag]
        } else {
            [0.0, 0.0]
        };

        let needs_histogram_rebuild;

        if let Some(idx) = self.find_matching(&signature) {
            // Update existing trace
            let trace = &mut self.traces[idx];
            trace.value += LEARNING_RATE * (outcome - trace.value);
            trace.age = 0;
            // Blend action bias toward the action that produced this outcome
            let blend = if outcome > 0.0 { 0.2 } else { -0.1 };
            trace.action_bias[0] = trace.action_bias[0] * (1.0 - blend) + norm_action[0] * blend;
            trace.action_bias[1] = trace.action_bias[1] * (1.0 - blend) + norm_action[1] * blend;
            // Re-normalize action bias
            let bias_mag = (trace.action_bias[0].powi(2) + trace.action_bias[1].powi(2)).sqrt();
            if bias_mag > 1.0 {
                trace.action_bias[0] /= bias_mag;
                trace.action_bias[1] /= bias_mag;
            }
            needs_histogram_rebuild = true; // value and direction changed
        } else {
            // New trace
            let trace = MemoryTrace {
                signature,
                value: outcome,
                age: 0,
                action_bias: norm_action,
            };

            if self.traces.len() >= MAX_TRACES {
                // Evict lowest-value trace (or oldest if values are close)
                let evict_idx = self
                    .traces
                    .iter()
                    .enumerate()
                    .min_by(|(_, a), (_, b)| {
                        // Lower value first, break ties by age (older first)
                        a.value
                            .partial_cmp(&b.value)
                            .unwrap_or(std::cmp::Ordering::Equal)
                            .then(b.age.cmp(&a.age))
                    })
                    .map(|(i, _)| i);

                if let Some(idx) = evict_idx {
                    self.traces.remove(idx);
                }
            }

            self.traces.push_back(trace);
            needs_histogram_rebuild = true; // new trace added
        }

        if needs_histogram_rebuild {
            self.rebuild_histogram();
        }
    }

    /// Decay all trace values and increment ages. Called once per tick.
    pub fn decay(&mut self) {
        for trace in &mut self.traces {
            trace.value *= DECAY_FACTOR;
            trace.age += 1;
        }
        // Rebuild histogram after decay changes weights
        self.rebuild_histogram();
    }

    /// Query memory for the best-known action in a given situation.
    /// Returns a weighted intent modifier: direction to move + strength.
    /// If no matching trace, returns zero (no memory bias).
    pub fn query_bias(&self, signature: &SituationSignature) -> [f32; 2] {
        // Exact match first
        if let Some(idx) = self.find_matching(signature) {
            let trace = &self.traces[idx];
            let strength = trace.value * MEMORY_GAIN;
            return [
                trace.action_bias[0] * strength,
                trace.action_bias[1] * strength,
            ];
        }

        // Fuzzy match: find the trace with the closest signature
        // (Hamming distance on bins)
        let mut best_dist = u32::MAX;
        let mut best_bias = [0.0_f32; 2];

        for trace in &self.traces {
            let dist = (trace.signature.energy_bin as i32 - signature.energy_bin as i32)
                .unsigned_abs()
                + (trace.signature.pressure_bin as i32 - signature.pressure_bin as i32)
                    .unsigned_abs()
                + (trace.signature.density_bin as i32 - signature.density_bin as i32)
                    .unsigned_abs()
                + (trace.signature.semantic_bin as i32 - signature.semantic_bin as i32)
                    .unsigned_abs();

            if dist < best_dist {
                best_dist = dist;
                let strength = trace.value * MEMORY_GAIN * (1.0 / (1.0 + dist as f32));
                best_bias = [
                    trace.action_bias[0] * strength,
                    trace.action_bias[1] * strength,
                ];
            }
        }

        // Only apply fuzzy match if reasonably close (within 4 bins total)
        if best_dist <= 4 {
            best_bias
        } else {
            [0.0, 0.0]
        }
    }

    // ── Anti-Attractor / Novelty Pressure ────────────────────────────────────

    /// Compute repetition score: how much the system has been in similar situations.
    /// Returns 0.0 (diverse/exploring) to 1.0 (stuck in a loop).
    ///
    /// Method: count how many of the last N signatures are identical to the
    /// most recent one. If most are the same, the system is repeating.
    pub fn repetition_score(&self) -> f32 {
        if self.recent_signatures.len() < 3 {
            return 0.0; // Not enough data to judge
        }

        let latest = match self.recent_signatures.back() {
            Some(s) => s,
            None => return 0.0,
        };

        // Count near-matches (Hamming distance ≤ 1)
        let near_matches = self
            .recent_signatures
            .iter()
            .filter(|s| {
                let d = (s.energy_bin as i32 - latest.energy_bin as i32).unsigned_abs()
                    + (s.pressure_bin as i32 - latest.pressure_bin as i32).unsigned_abs()
                    + (s.density_bin as i32 - latest.density_bin as i32).unsigned_abs()
                    + (s.semantic_bin as i32 - latest.semantic_bin as i32).unsigned_abs();
                d <= 1
            })
            .count();

        // Use near-matches (more robust than exact-only)
        near_matches as f32 / self.recent_signatures.len() as f32
    }

    /// Compute the dominant action direction from all memory traces,
    /// weighted by value and recency.
    fn dominant_direction(&self) -> [f32; 2] {
        let mut wx = 0.0_f32;
        let mut wy = 0.0_f32;
        let mut total_w = 0.0_f32;

        for trace in &self.traces {
            // Weight by absolute value (positive or negative — both are informative)
            // and inverse age (recent traces matter more)
            let w = trace.value.abs() * (1.0 / (1.0 + trace.age as f32));
            wx += trace.action_bias[0] * w;
            wy += trace.action_bias[1] * w;
            total_w += w;
        }

        if total_w > 0.0001 {
            [wx / total_w, wy / total_w]
        } else {
            [0.0, 0.0]
        }
    }

    /// Compute anti-attractor perturbation using memory landscape targeting.
    ///
    /// v8.1 used fixed 90° CCW rotation — a predictable attractor that
    /// the system eventually learns to game ("controlled chaos").
    ///
    /// v8.2 targets the least-explored angular sector in the action histogram.
    /// This creates genuine structural misprediction:
    ///   - The CF cannot anticipate the perturbation without knowing the
    ///     full memory state
    ///   - But the memory state is what the perturbation is trying to shape
    ///   - Circular dependency = structurally unavoidable exploration
    ///
    /// Algorithm:
    ///   1. Find the angular sector with the lowest histogram weight
    ///   2. Point toward the center of that sector
    ///   3. If all sectors are equally populated (diverse memory), use
    ///      the dominant direction's orthogonal as fallback
    ///   4. Scale by repetition score, cap at NOVELTY_MAX
    ///
    /// When repetition is low (< REPETITION_THRESHOLD), returns zero.
    pub fn novelty_pressure(&self) -> [f32; 2] {
        let rep = self.repetition_score();

        // No pressure if the system is exploring freely
        if rep < REPETITION_THRESHOLD {
            return [0.0, 0.0];
        }

        // No pressure if memory has no directional information
        if self.traces.is_empty() {
            return [0.0, 0.0];
        }

        // Find the least-explored sector
        let mut min_weight = f32::MAX;
        let mut min_sector = 0;

        for (i, &w) in self.action_histogram.iter().enumerate() {
            if w < min_weight {
                min_weight = w;
                min_sector = i;
            }
        }

        // If histogram has no data at all, fall back to orthogonal
        if self.histogram_total < 0.0001 {
            let dominant = self.dominant_direction();
            let dom_mag = (dominant[0].powi(2) + dominant[1].powi(2)).sqrt();
            if dom_mag < 0.001 {
                return [0.0, 0.0];
            }
            let orthogonal = [-dominant[1] / dom_mag, dominant[0] / dom_mag];
            let strength = (rep * NOVELTY_MAX).min(NOVELTY_MAX);
            return [orthogonal[0] * strength, orthogonal[1] * strength];
        }

        // Check if the histogram is "flat" (all sectors roughly equal)
        // If so, the system already has diverse action history — use orthogonal
        let avg_weight = self.histogram_total / ACTION_SECTORS as f32;
        let is_flat = self
            .action_histogram
            .iter()
            .all(|&w| (w - avg_weight).abs() < avg_weight * 0.5);

        let target_direction = if is_flat {
            // All sectors explored equally — fall back to orthogonal to dominant
            let dominant = self.dominant_direction();
            let dom_mag = (dominant[0].powi(2) + dominant[1].powi(2)).sqrt();
            if dom_mag < 0.001 {
                return [0.0, 0.0];
            }
            [-dominant[1] / dom_mag, dominant[0] / dom_mag]
        } else {
            // Target the center of the least-explored sector
            Self::sector_to_direction(min_sector)
        };

        // Strength scales with repetition depth, capped at NOVELTY_MAX
        let strength = (rep * NOVELTY_MAX).min(NOVELTY_MAX);

        [
            target_direction[0] * strength,
            target_direction[1] * strength,
        ]
    }

    /// Get the action histogram (for testing/inspection).
    pub fn action_histogram(&self) -> &[f32; ACTION_SECTORS] {
        &self.action_histogram
    }

    /// Get total histogram weight (for testing/inspection).
    pub fn histogram_total(&self) -> f32 {
        self.histogram_total
    }

    /// Total number of active traces.
    pub fn len(&self) -> usize {
        self.traces.len()
    }

    pub fn is_empty(&self) -> bool {
        self.traces.is_empty()
    }

    // ── Semantic Basis & Orthogonal Innovation (v8.3) ──────────────────────

    /// Record a semantic direction into the basis.
    /// Called each tick with the current cluster's mean semantic direction.
    /// The vector is normalized and added to the FIFO basis. Old entries
    /// are evicted when the basis exceeds SEMANTIC_BASIS_SIZE.
    pub fn record_semantic_direction(&mut self, direction: [f32; SEMANTIC_DIM]) {
        // Normalize
        let mag = direction
            .iter()
            .map(|v| v * v)
            .sum::<f32>()
            .sqrt()
            .max(0.001);
        let norm = [
            direction[0] / mag,
            direction[1] / mag,
            direction[2] / mag,
            direction[3] / mag,
        ];

        if self.semantic_basis.len() >= SEMANTIC_BASIS_SIZE {
            self.semantic_basis.remove(0);
        }
        self.semantic_basis.push(norm);
    }

    /// Get the current semantic basis (for testing/inspection).
    pub fn semantic_basis(&self) -> &[[f32; SEMANTIC_DIM]] {
        &self.semantic_basis
    }

    /// Compute a semantic novelty drift vector using orthogonal innovation.
    ///
    /// The algorithm:
    ///   1. Generate a random candidate direction (from action histogram —
    ///      least-explored sector → deterministic, not random)
    ///   2. Gram-Schmidt: subtract projections onto all stored basis vectors
    ///   3. If the residual has enough magnitude, use it as the drift direction
    ///   4. If residual is too small (space is saturated), generate a
    ///      small random perturbation instead
    ///   5. Scale by repetition score, cap at SEMANTIC_NOVELTY_MAX
    ///
    /// Returns a 4D semantic drift vector. Apply to particle semantic_vectors
    /// to reshape the interaction landscape.
    ///
    /// Only fires when repetition > REPETITION_THRESHOLD (system is stuck).
    pub fn semantic_novelty_drift(&self) -> [f32; SEMANTIC_DIM] {
        let rep = self.repetition_score();

        // No drift if exploring freely
        if rep < REPETITION_THRESHOLD {
            return [0.0; SEMANTIC_DIM];
        }

        // No drift without memory traces
        if self.traces.is_empty() {
            return [0.0; SEMANTIC_DIM];
        }

        // Generate candidate from action histogram (least-explored sector)
        // This maps the 2D action landscape into a 4D semantic direction
        // using a deterministic mapping: sector index → angle → 4D via trig
        let candidate = self.semantic_candidate_from_histogram();

        // Gram-Schmidt: project out the span of stored basis vectors
        let mut innovation = candidate;

        for basis_vec in &self.semantic_basis {
            // dot(innovation, basis)
            let dot: f32 = innovation
                .iter()
                .zip(basis_vec.iter())
                .map(|(a, b)| a * b)
                .sum();

            // innovation -= dot * basis
            for i in 0..SEMANTIC_DIM {
                innovation[i] -= dot * basis_vec[i];
            }
        }

        // Check residual magnitude
        let residual_mag = innovation.iter().map(|v| v * v).sum::<f32>().sqrt();

        // If residual is too small, the basis nearly spans the full space.
        // Use a fallback: small perturbation in an arbitrary direction.
        if residual_mag < 0.01 {
            // Fallback: use the least-explored sector angle to seed a
            // different 4D direction via a different trig mapping
            let fallback = self.semantic_fallback_direction();
            return [
                fallback[0] * SEMANTIC_NOVELTY_MAX * rep * 0.1,
                fallback[1] * SEMANTIC_NOVELTY_MAX * rep * 0.1,
                fallback[2] * SEMANTIC_NOVELTY_MAX * rep * 0.1,
                fallback[3] * SEMANTIC_NOVELTY_MAX * rep * 0.1,
            ];
        }

        // Normalize the innovation direction
        let inv_mag = 1.0 / residual_mag;
        let strength = (rep * SEMANTIC_NOVELTY_MAX).min(SEMANTIC_NOVELTY_MAX);

        [
            innovation[0] * inv_mag * strength,
            innovation[1] * inv_mag * strength,
            innovation[2] * inv_mag * strength,
            innovation[3] * inv_mag * strength,
        ]
    }

    /// Map the action histogram's least-explored sector into a 4D semantic direction.
    /// Uses trigonometric mapping from 2D angle to 4D.
    fn semantic_candidate_from_histogram(&self) -> [f32; SEMANTIC_DIM] {
        // Find least-explored sector
        let mut min_weight = f32::MAX;
        let mut min_sector = 0;
        for (i, &w) in self.action_histogram.iter().enumerate() {
            if w < min_weight {
                min_weight = w;
                min_sector = i;
            }
        }

        // If no histogram data, use sector 0
        if self.histogram_total < 0.0001 {
            min_sector = 0;
        }

        // Map sector angle to 4D via trig expansion
        // sector 0 = 22.5°, sector 7 = 337.5° (centers)
        let angle = (min_sector as f32 + 0.5)
            * (2.0 * std::f32::consts::PI / ACTION_SECTORS as f32)
            - std::f32::consts::PI;

        // Expand 1D angle to 4D using harmonic mapping:
        // v = [cos(θ), sin(θ), cos(2θ), sin(2θ)]
        // This creates distinct 4D directions for each sector
        [
            angle.cos(),
            angle.sin(),
            (2.0 * angle).cos(),
            (2.0 * angle).sin(),
        ]
    }

    /// Fallback direction when Gram-Schmidt residual is too small.
    /// Uses a different trig mapping than the primary candidate.
    fn semantic_fallback_direction(&self) -> [f32; SEMANTIC_DIM] {
        let mut min_sector = 0;
        let mut min_weight = f32::MAX;
        for (i, &w) in self.action_histogram.iter().enumerate() {
            if w < min_weight {
                min_weight = w;
                min_sector = i;
            }
        }

        // Use 3rd and 4th harmonics instead of 1st and 2nd
        let angle = (min_sector as f32 + 0.5)
            * (2.0 * std::f32::consts::PI / ACTION_SECTORS as f32)
            - std::f32::consts::PI;

        [
            (3.0 * angle).cos(),
            (3.0 * angle).sin(),
            (4.0 * angle).cos(),
            (4.0 * angle).sin(),
        ]
    }
}
