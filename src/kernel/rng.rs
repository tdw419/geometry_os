use rand::rngs::StdRng;
use rand::{Rng, SeedableRng};

/// Trait for all stochastic operations in the kernel.
/// Every subsystem takes this explicitly -- no global RNG, no hidden calls.
pub trait RngEngine {
    fn next_f32(&mut self) -> f32;
    fn next_u32(&mut self) -> u32;
    fn gen_range_f32(&mut self, min: f32, max: f32) -> f32;
}

/// Deterministic RNG backed by StdRng (ChaCha-based).
/// Same seed = identical universe replay.
pub struct KernelRng {
    rng: StdRng,
}

impl KernelRng {
    pub fn new(seed: u64) -> Self {
        Self {
            rng: StdRng::seed_from_u64(seed),
        }
    }

    /// Create with a random seed (for production runs where replay isn't needed).
    pub fn new_random() -> Self {
        Self {
            rng: StdRng::from_entropy(),
        }
    }
}

impl RngEngine for KernelRng {
    fn next_f32(&mut self) -> f32 {
        self.rng.gen::<f32>()
    }

    fn next_u32(&mut self) -> u32 {
        self.rng.gen()
    }

    fn gen_range_f32(&mut self, min: f32, max: f32) -> f32 {
        self.rng.gen_range(min..max)
    }
}
