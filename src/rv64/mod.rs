//! RV64I Software Executor
//!
//! Pure Rust implementation of RV64I + privileged architecture for
//! compliance testing and Linux boot on GPU executor.

pub mod decode;
pub mod executor;
pub mod linux_boot;

pub use decode::decode_rv64;
pub use executor::Rv64Cpu;
pub use executor::SparseMemory;
