mod minimal_xv6_execution_test;

// Phase 99: Sound Mixer Daemon Tests
mod test_phase99_push_pop;
mod test_phase99_call_ret;
mod test_phase99_beep;
mod test_phase99_spawn;
mod test_phase99_sound_mixer;

/// Helper module for synthetic kernel generation
pub use minimal_synthetic_kernel::{build_test_elf, create_synthetic_kernel_small};