//! Spatial routing library for Geometry OS
//!
//! This module provides reusable GPU-accelerated spatial routing logic
//! that can be used by both test runners and the infinite_map system.

pub mod control_unit;
pub mod glyph_bridge;
pub mod grid_runner;
pub mod hypervisor_bridge;
pub mod orchestration;
pub mod path_cache;
pub mod payload_loader;
pub mod payload_loader_linux;
pub mod png_boot_extractor;
pub mod process_scheduler;
pub mod riscv_core;
pub mod riscv_decoder;
pub mod self_boot_loader;
pub mod self_config;
pub mod self_modifying;
pub mod spatial_alu;
pub mod spatial_control_unit;
pub mod spatial_io;
pub mod spatial_memory;
pub mod spatial_mmu;
pub mod openspec_bridge;
pub mod lm_studio_bridge;
pub mod spatial_generator;
pub mod circuit_optimizer;
pub mod evolution_daemon;
pub mod layoutgan_saccade;
pub mod tournament_manager;
pub mod spatial_scheduler;
pub mod spatial_processor;
pub mod spatial_processor_grid;
pub mod spatial_ipc;
pub mod spatial_filesystem;
pub mod spatial_security;
pub mod types;
pub mod weight_loader;
pub mod attention_head;
pub mod tensor_gate;
pub mod riscv_transpiler;
pub mod riscv_cell;
pub mod tile_state;
pub mod tile_manager;
pub mod inter_tile_comm;
pub mod priority_scheduler;
pub mod png_boot;
pub mod spatial_process_coordinator;
pub mod kernel_decoder;
pub mod initramfs;
pub mod boot_params;
pub mod performance_metrics;
pub mod llm_weight_mapper;
pub mod spatial_attention;
pub mod vision_studio_bridge;
pub mod circuit_executor;
pub mod evolution_stream;
pub mod neural_prompter;
pub mod pattern_materializer;

pub use grid_runner::GridRunner;
pub use performance_metrics::{PerformanceMetrics, MetricsCollector};
pub use circuit_optimizer::{CircuitOptimizer, OptimizationConfig, OptimizationResult};
pub use evolution_daemon::{EvolutionDaemon, EvolutionConfig, EvolutionStats, FitnessMetrics};
pub use circuit_executor::{CircuitExecutor, ExecutionConfig, ExecutionResult};
pub use layoutgan_saccade::{LayoutGanSaccade, SaccadeConfig, SaccadeRegion, LayoutInefficiency};
pub use tournament_manager::{TournamentManager, TournamentConfig, SandboxRegion};
pub use process_scheduler::{ProcessScheduler, ProcessControlBlock, ProcessRegion};
pub use riscv_cell::RiscVCell;
pub use tile_state::TileState;
pub use tile_manager::{TileManager, TileManagerError, TileCoord, TileStateInfo};
pub use inter_tile_comm::{InterTileComm, CommError, ChannelConfig, ChannelType, ChannelDirection};
pub use priority_scheduler::{PriorityScheduler, PriorityTask, TaskResult, TaskPriority, TaskId, TaskStats, TileLoad};
pub use spatial_filesystem::{SpatialFilesystem, FileMetadata, FsErrors, FsStats, PERM_READ, PERM_WRITE, PERM_EXECUTE};
// Re-export CellState from geoasm_materializer (single source of truth)
pub use crate::geoasm_materializer::CellState;
pub use path_cache::{GRID_W, GRID_H, TOTAL_CELLS, PathCache, Segment};
pub use payload_loader::PayloadLoader;
pub use payload_loader_linux::LinuxPayloadLoader;
pub use self_boot_loader::{SelfBootLoader, BootConfig, BootState, BootStats, BootParams};
pub use spatial_processor_grid::{cells_to_grid_array, extract_output_from_grid};
pub use spatial_process_coordinator::{
    SpatialProcessCoordinator, SpatialProcessType, SpatialProcessState, SpatialProcessMetadata,
};
pub use spatial_security::{SecurityLevel, SpatialSecurity};
pub mod vcc_validate;
pub mod vnc_live_tile;

pub use vcc_validate::{VccValidator, VccViolation};
pub use vnc_live_tile::{VncLiveTile, VncLiveTileManager};
pub use llm_weight_mapper::{WeightMapper, WeightMapperConfig, TensorShape, WeightPattern};
pub use spatial_attention::SpatialAttention;
pub use evolution_stream::{EvolutionStreamServer, StreamConfig, CircuitSnapshot, GenerationUpdate};
pub mod memory_palace_circuit;
pub use neural_prompter::{NeuralPrompter, NeuralPrompt, NeuralPattern, NeuralConstraints, NeuralError};
pub use pattern_materializer::{PatternMaterializer, MaterializationError};

#[cfg(test)]
mod fitness_saturation_test;