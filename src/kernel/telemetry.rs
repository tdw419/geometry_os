//! Kernel Telemetry — Trajectory Entropy Collapse (TEC) Detection
//!
//! TEC measures whether the system is still *exploring behavioral regimes*
//! or quietly converging into a few repeating motion patterns.
//!
//! How it works:
//!   1. Each tick, every cluster is classified into a "behavior state" —
//!      a quantized symbol encoding velocity direction, speed, density, and pressure.
//!   2. Shannon entropy is computed over a rolling window of these symbols.
//!   3. If entropy collapses, the system is becoming dynamically rigid.
//!
//! Key invariants:
//!   - TEC is a *measurement*, not a control signal. It never influences behavior.
//!   - Window size is bounded (no unbounded history).
//!   - Computation is O(clusters * window), cheap for N < 100.
//!   - Fully deterministic given the same kernel state.

use std::collections::BTreeMap;

// ── Configuration ─────────────────────────────────────────────────────────────

/// How many ticks of behavior history to retain per cluster.
pub const TEC_WINDOW: usize = 200;

/// Number of bins for velocity direction (8 = compass directions).
const DIR_BINS: u8 = 8;

/// Number of bins for speed.
const SPEED_BINS: u8 = 4;

/// Number of bins for local density (particle count in neighborhood).
const DENSITY_BINS: u8 = 4;

/// Number of bins for pressure regime.
const PRESSURE_BINS: u8 = 4;

/// Total possible distinct behavior states.
/// DIR_BINS * SPEED_BINS * DENSITY_BINS * PRESSURE_BINS = 8*4*4*4 = 512
const TOTAL_STATES: usize = (DIR_BINS as usize)
    * (SPEED_BINS as usize)
    * (DENSITY_BINS as usize)
    * (PRESSURE_BINS as usize);

// ── Behavior Signature ────────────────────────────────────────────────────────

/// A single quantized behavior state for a cluster at one tick.
/// Encoded as a compact u16 combining all four dimensions.
#[derive(Clone, Debug, PartialEq, Eq, Hash)]
pub struct BehaviorSignature(pub u16);

impl BehaviorSignature {
    /// Compute behavior signature from cluster observables.
    pub fn from_observables(vx: f32, vy: f32, particle_count: usize, pressure: f32) -> Self {
        // Direction bin: atan2 mapped to 0..DIR_BINS
        let angle = vy.atan2(vx); // -PI..PI
        let dir_bin = if vx == 0.0 && vy == 0.0 {
            0u8
        } else {
            let normalized = (angle + std::f32::consts::PI) / (2.0 * std::f32::consts::PI);
            (normalized * DIR_BINS as f32).floor() as u8 % DIR_BINS
        };

        // Speed bin: sqrt(vx^2 + vy^2) mapped to 0..SPEED_BINS
        let speed = (vx * vx + vy * vy).sqrt();
        let speed_bin = bin(speed, 0.0, 2.0, SPEED_BINS);

        // Density bin: particle count mapped to 0..DENSITY_BINS
        let density_bin = bin(particle_count as f32, 0.0, 50.0, DENSITY_BINS);

        // Pressure bin
        let pressure_bin = bin(pressure, 0.0, 0.5, PRESSURE_BINS);

        // Pack into single u16: dir(3 bits) | speed(2) | density(2) | pressure(2) = 9 bits
        let packed = (dir_bin as u16)
            | ((speed_bin as u16) << 3)
            | ((density_bin as u16) << 5)
            | ((pressure_bin as u16) << 7);

        BehaviorSignature(packed)
    }
}

/// Bin a value into n equal-width bins over [min, max).
fn bin(value: f32, min: f32, max: f32, n: u8) -> u8 {
    let t = ((value - min) / (max - min)).clamp(0.0, 1.0);
    (t * (n as f32 - 1.0)).round() as u8
}

// ── TEC Tracker ───────────────────────────────────────────────────────────────

/// Per-cluster rolling window of behavior signatures.
#[derive(Clone, Debug)]
pub struct ClusterTelemetry {
    pub cluster_id: u64,
    /// Rolling window of behavior symbols. Oldest at front, newest at back.
    pub history: Vec<BehaviorSignature>,
}

impl ClusterTelemetry {
    pub fn new(cluster_id: u64) -> Self {
        Self {
            cluster_id,
            history: Vec::with_capacity(TEC_WINDOW),
        }
    }

    /// Record one tick's behavior.
    pub fn record(&mut self, sig: BehaviorSignature) {
        if self.history.len() >= TEC_WINDOW {
            self.history.remove(0);
        }
        self.history.push(sig);
    }

    /// Compute Shannon entropy over the behavior history.
    /// Returns 0.0 if history is empty.
    /// Maximum entropy for TOTAL_STATES states = log2(TOTAL_STATES).
    pub fn entropy(&self) -> f32 {
        if self.history.len() < 2 {
            return 0.0;
        }

        let n = self.history.len() as f32;
        let mut counts = [0u32; TOTAL_STATES];

        for sig in &self.history {
            let idx = sig.0 as usize;
            if idx < TOTAL_STATES {
                counts[idx] += 1;
            }
        }

        let mut h = 0.0_f32;
        for &c in &counts {
            if c > 0 {
                let p = c as f32 / n;
                h -= p * p.log2();
            }
        }

        h
    }

    /// Number of distinct behavior states in the current window.
    pub fn unique_states(&self) -> usize {
        let mut seen = [false; TOTAL_STATES];
        let mut count = 0;
        for sig in &self.history {
            let idx = sig.0 as usize;
            if idx < TOTAL_STATES && !seen[idx] {
                seen[idx] = true;
                count += 1;
            }
        }
        count
    }
}

// ── System-Level TEC ──────────────────────────────────────────────────────────

/// Kernel-wide telemetry: tracks per-cluster behavior and system-level metrics.
pub struct TelemetrySystem {
    /// Per-cluster telemetry. Keyed by cluster ID.
    pub cluster_telemetry: BTreeMap<u64, ClusterTelemetry>,
    /// System-level TEC history (one value per tick).
    pub system_tec_history: Vec<f32>,
    /// Peak TEC observed so far (for relative rigidity detection).
    pub peak_tec: f32,
}

impl TelemetrySystem {
    pub fn new() -> Self {
        Self {
            cluster_telemetry: BTreeMap::new(),
            system_tec_history: Vec::with_capacity(1000),
            peak_tec: 0.0,
        }
    }

    /// Compute and record telemetry for one tick.
    /// This is a PURE MEASUREMENT — it does not modify kernel state.
    ///
    /// Inputs come from already-computed kernel state:
    ///   - clusters (for positions, sizes, energies)
    ///   - observations (for pressure, world motion)
    ///   - CF fields (for intent — used to derive effective velocity)
    pub fn record_tick(
        &mut self,
        clusters: &BTreeMap<u64, crate::kernel::coherence::CoherentCluster>,
        observations: &BTreeMap<u64, crate::kernel::observation::ObservationField>,
    ) {
        let mut tick_entropies = Vec::new();

        for (id, cluster) in clusters {
            // Only track clusters with CF-level stability
            if cluster.stability < 0.5 {
                continue;
            }

            let telem = self
                .cluster_telemetry
                .entry(*id)
                .or_insert_with(|| ClusterTelemetry::new(*id));

            // Derive behavioral observables
            // Use cluster center velocity approximation from particle positions
            // We approximate velocity from the world_motion_vector in observations
            // (which captures external forces) plus CF intent if available.
            // For a pure measurement, we use the observation's world_motion_vector
            // as a proxy for the cluster's experienced velocity.
            let (vx, vy, pressure) = if let Some(obs) = observations.get(id) {
                let pm = (obs.world_motion_vector[0].powi(2) + obs.world_motion_vector[1].powi(2))
                    .sqrt();
                (obs.world_motion_vector[0], obs.world_motion_vector[1], pm)
            } else {
                (0.0, 0.0, 0.0)
            };

            let sig =
                BehaviorSignature::from_observables(vx, vy, cluster.particle_ids.len(), pressure);

            telem.record(sig);

            // Only compute entropy once we have enough history
            if telem.history.len() >= 10 {
                tick_entropies.push(telem.entropy());
            }
        }

        // System-level TEC: average entropy across all tracked clusters
        let system_tec = if tick_entropies.is_empty() {
            0.0
        } else {
            tick_entropies.iter().sum::<f32>() / tick_entropies.len() as f32
        };

        if system_tec > self.peak_tec {
            self.peak_tec = system_tec;
        }

        // Keep system history bounded (last 1000 ticks)
        if self.system_tec_history.len() >= 1000 {
            self.system_tec_history.remove(0);
        }
        self.system_tec_history.push(system_tec);

        // Prune telemetry for clusters that no longer exist
        let active_ids: Vec<u64> = clusters.keys().copied().collect();
        self.cluster_telemetry
            .retain(|id, _| active_ids.contains(id));
    }

    /// Current system-level TEC.
    pub fn current_tec(&self) -> f32 {
        self.system_tec_history.last().copied().unwrap_or(0.0)
    }

    /// Rate of change of TEC over the last N ticks.
    /// Negative = system becoming more rigid. Positive = exploring more.
    pub fn tec_gradient(&self, window: usize) -> f32 {
        let n = self.system_tec_history.len();
        if n < window {
            return 0.0;
        }
        let recent: f32 = self.system_tec_history[n - window..].iter().sum::<f32>() / window as f32;
        let older_end = n - window;
        let older_start = older_end.saturating_sub(window);
        if older_start >= older_end {
            return 0.0;
        }
        let older: f32 = self.system_tec_history[older_start..older_end]
            .iter()
            .sum::<f32>()
            / (older_end - older_start) as f32;
        recent - older
    }

    /// Check if system is showing early rigidity warning.
    /// Returns true if TEC has dropped below 30% of peak AND still declining.
    pub fn rigidity_warning(&self) -> bool {
        if self.peak_tec < 0.01 {
            return false; // Never had meaningful entropy
        }
        let current = self.current_tec();
        let ratio = current / self.peak_tec;
        ratio < 0.3 && self.tec_gradient(50) < 0.0
    }
}
