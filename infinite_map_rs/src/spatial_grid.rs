//! Spatial Grid Module - Phase 6.4.1: GPU Upload for Materialized Cells
//!
//! This module provides GPU buffer management for spatial routing grids,
//! enabling the NEURAL_GATE to upload LLM-generated circuits to the live grid.
//!
//! Architecture:
//! - The spatial routing system runs on GPU via spatial_compute.wgsl
//! - Overlay buffer (binding 3) stores structural cells (WALL, MEMBRANE, etc.)
//! - When materialized_cells is available, we upload it to the overlay buffer
//! - The shader merges overlay with main grid during execution
use bytemuck::{cast_slice, Pod, Zeroable};
use wgpu::{self, Buffer, BufferDescriptor, BufferUsages, Device, Queue};

#[cfg(feature = "larger_grid")]
pub const GRID_WIDTH: usize = 512;
#[cfg(feature = "larger_grid")]
pub const GRID_HEIGHT: usize = 256;

#[cfg(all(feature = "large_grid", not(feature = "larger_grid")))]
pub const GRID_WIDTH: usize = 256;
#[cfg(all(feature = "large_grid", not(feature = "larger_grid")))]
pub const GRID_HEIGHT: usize = 128;

#[cfg(not(any(feature = "larger_grid", feature = "large_grid")))]
pub const GRID_WIDTH: usize = 128;
#[cfg(not(any(feature = "larger_grid", feature = "large_grid")))]
pub const GRID_HEIGHT: usize = 64;

pub const TOTAL_CELLS: usize = GRID_WIDTH * GRID_HEIGHT;

// Re-export CellState from geoasm_materializer to maintain single source of truth
pub use crate::geoasm_materializer::CellState;

/// Create the overlay buffer for spatial routing
///
/// The overlay buffer stores structural cells that can modify the main grid
/// at runtime (WALL, MEMBRANE, DOOR, etc.). This allows dynamic materialization
/// of LLM-generated circuits.
///
/// # Arguments
/// * `device` - WGPU device for buffer creation
/// * `queue` - WGPU queue for buffer uploads
/// * `cells` - Optional slice of cells to upload (None = zero-initialized)
///
/// # Returns
/// A buffer ready for binding 3 (overlay) in spatial_compute.wgsl
pub fn create_overlay_buffer(
    device: &Device,
    queue: &Queue,
    cells: Option<&[CellState]>,
) -> Buffer {
    let buffer_size = (TOTAL_CELLS * std::mem::size_of::<CellState>()) as u64;

    let buffer = device.create_buffer(&BufferDescriptor {
        label: Some("Spatial Overlay Buffer"),
        size: buffer_size,
        usage: BufferUsages::STORAGE | BufferUsages::COPY_DST | BufferUsages::COPY_SRC,
        mapped_at_creation: false,
    });

    // Upload cells if provided, otherwise buffer remains zero-initialized
    if let Some(cell_data) = cells {
        if !cell_data.is_empty() {
            queue.write_buffer(&buffer, 0, cast_slice(cell_data));
        }
    }

    buffer
}

/// Zero-initialize the overlay buffer
///
/// Creates a buffer filled with NOP cells to serve as a clean overlay layer.
pub fn create_zeroed_overlay(device: &Device, queue: &Queue) -> Buffer {
    let zero_cells = vec![CellState::new(
        crate::geoasm_materializer::TYPE_NOP,
        0,
        0,
    ); TOTAL_CELLS];

    device.create_buffer(&BufferDescriptor {
        label: Some("Zeroed Overlay Buffer"),
        size: (TOTAL_CELLS * std::mem::size_of::<CellState>()) as u64,
        usage: BufferUsages::STORAGE | BufferUsages::COPY_DST | BufferUsages::COPY_SRC,
        mapped_at_creation: false,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_grid_constants_default() {
        #[cfg(feature = "large_grid")]
        {
            assert_eq!(GRID_WIDTH, 256);
            assert_eq!(GRID_HEIGHT, 128);
            assert_eq!(TOTAL_CELLS, 32768);
        }

        #[cfg(not(feature = "large_grid"))]
        {
            assert_eq!(GRID_WIDTH, 128);
            assert_eq!(GRID_HEIGHT, 64);
            assert_eq!(TOTAL_CELLS, 8192);
        }
    }

    #[test]
    fn test_overlay_buffer_creation() {
        pollster::block_on(async {
            let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
                backends: wgpu::Backends::all(),
                ..Default::default()
            });

            let adapter = instance
                .request_adapter(&wgpu::RequestAdapterOptions {
                    power_preference: wgpu::PowerPreference::HighPerformance,
                    compatible_surface: None,
                    force_fallback_adapter: false,
                })
                .await
                .expect("Failed to find an appropriate adapter");

            let (device, queue) = adapter
                .request_device(
                    &wgpu::DeviceDescriptor {
                        label: Some("Test Device"),
                        required_features: wgpu::Features::empty(),
                        required_limits: wgpu::Limits::default(),
                    },
                    None,
                )
                .await
                .expect("Failed to create device");

            // Test zeroed overlay
            let buffer = create_zeroed_overlay(&device, &queue);
            assert_eq!(
                buffer.size(),
                (TOTAL_CELLS * std::mem::size_of::<CellState>()) as u64
            );

            // Test overlay with data
            let test_cells = vec![
                CellState::new(crate::geoasm_materializer::TYPE_WALL, 0, 0),
                CellState::new(crate::geoasm_materializer::TYPE_NOP, 0, 0),
            ];

            let buffer = create_overlay_buffer(&device, &queue, Some(&test_cells));
            assert_eq!(
                buffer.size(),
                (TOTAL_CELLS * std::mem::size_of::<CellState>()) as u64
            );
        });
    }
}