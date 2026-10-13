//! Integration tests for Phase 6.7.1 (Spatial Weight Cell Architecture)
//!
//! Tests weight loading, grid placement, and integration with materialization system.

use geometry_os::spatial::weight_loader::{WeightError, WeightLayout, WeightLoader};
use geometry_os::geoasm_materializer::CellState;
use geometry_os::spatial::spatial_processor_grid::cells_to_grid_array;
use wgpu::util::DeviceExt;

/// Helper to create test grid
fn create_test_grid() -> Vec<CellState> {
    vec![CellState {
        opcode_or_type: 0, // TYPE_NOP
        is_active: 0,
        data_buffer: 0,
        executing: 0,
    }; 8192] // 128x64 grid
}

/// Helper to find weight cells in grid
fn find_weight_cells(grid: &[CellState], expected_count: usize) -> Vec<(usize, CellState)> {
    let mut weights = Vec::new();
    for (idx, cell) in grid.iter().enumerate() {
        if cell.data_buffer != 0 {
            weights.push((idx, *cell));
        }
    }
    weights
}

#[test]
fn test_mnist_weight_loading() {
    // MNIST-style weight matrix: 7x28x28 = 548 weights (flattened)
    let loader = WeightLoader::new(128, 64);

    // Create synthetic weights (28x28 matrix for one channel)
    let weights: Vec<f32> = (0..784)
        .map(|i| ((i % 28) as f32) / 28.0) // Gradient pattern
        .collect();

    let layout = WeightLayout::dense(28, 28, 10, 10);
    let cells = loader.load_dense_layer(&weights, &layout).expect("Should load weights");

    // Verify weight count
    assert_eq!(cells.len(), 784);

    // Extract and verify weights
    let extracted = loader.extract_weights(&cells, &layout);
    assert_eq!(extracted.len(), 784);

    // Verify first and last weights
    assert!((extracted[0] - 0.0).abs() < 1e-6);
    assert!((extracted[783] - 0.964).abs() < 0.01); // 27/28 ≈ 0.964

    println!("✓ MNIST weight loading test passed");
    println!("  - Loaded {} weights into {} cells", weights.len(), cells.len());
    println!("  - Weight range: {:.3} to {:.3}", extracted[0], extracted[783]);
}

#[test]
fn test_weight_grid_placement() {
    let loader = WeightLoader::new(128, 64);

    // Create 4x4 weight matrix
    let weights: Vec<f32> = vec![1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0];
    let layout = WeightLayout::dense(4, 4, 50, 20);

    let cells = loader.load_dense_layer(&weights, &layout).expect("Should load weights");

    // Create full grid and place weights
    let mut grid = create_test_grid();
    for (i, cell) in cells.iter().enumerate() {
        if let Some((x, y)) = layout.coord_for_index(i) {
            let idx = y * 128 + x;
            grid[idx] = *cell;
        }
    }

    // Verify weights placed at correct coordinates
    let placed_weights = find_weight_cells(&grid, 16);
    assert_eq!(placed_weights.len(), 16);

    // Verify weight values at specific coordinates
    let idx_0_0 = 20 * 128 + 50; // (x=50, y=0)
    let idx_1_1 = 21 * 128 + 51; // (x=51, y=1)
    assert_eq!(f32::from_bits(grid[idx_0_0].data_buffer), 1.0);
    assert_eq!(f32::from_bits(grid[idx_1_1].data_buffer), 6.0);

    println!("✓ Weight grid placement test passed");
    println!("  - Weights placed at ({}, {})", layout.coord_for_index(0).unwrap().0, layout.coord_for_index(0).unwrap().1);
}

#[test]
fn test_weight_layer_bounds_checking() {
    let loader = WeightLoader::new(128, 64);

    // Layer too large for grid
    let weights = vec![1.0_f32; 20000]; // 20000 > MAX_WEIGHTS_PER_LAYER (16384)
    let layout = WeightLayout::dense(100, 200, 0, 0);

    let result = loader.load_dense_layer(&weights, &layout);
    assert!(matches!(result, Err(WeightError::LayerTooLarge { .. })));

    // Layer out of bounds
    let weights = vec![1.0_f32; 100];
    let layout = WeightLayout::dense(20, 5, 120, 0); // x=120+20=140 > grid_width=128

    let result = loader.load_dense_layer(&weights, &layout);
    assert!(matches!(result, Err(WeightError::OutOfBounds { .. })));

    println!("✓ Weight layer bounds checking test passed");
}

#[test]
fn test_weight_nan_inf_rejection() {
    let loader = WeightLoader::new(128, 64);

    // Weights with NaN
    let weights_with_nan = vec![1.0, f32::NAN, 2.0];
    let layout = WeightLayout::dense(3, 1, 0, 0);

    let result = loader.load_dense_layer(&weights_with_nan, &layout);
    assert!(matches!(result, Err(WeightError::InvalidWeightValue)));

    // Weights with Inf
    let weights_with_inf = vec![1.0, f32::INFINITY, 2.0];
    let result = loader.load_dense_layer(&weights_with_inf, &layout);
    assert!(matches!(result, Err(WeightError::InvalidWeightValue)));

    println!("✓ Weight NaN/Inf rejection test passed");
}

#[test]
fn test_weight_extraction_roundtrip() {
    let loader = WeightLoader::new(128, 64);

    // Create test weights with negative and positive values
    let weights: Vec<f32> = vec![-1.5, -0.5, 0.0, 0.5, 1.5];
    let layout = WeightLayout::dense(5, 1, 10, 10);

    // Load weights into cells
    let cells = loader.load_dense_layer(&weights, &layout).expect("Should load weights");

    // Extract weights back
    let extracted = loader.extract_weights(&cells, &layout);

    // Verify roundtrip preserves values
    assert_eq!(extracted.len(), weights.len());
    for (original, extracted_value) in weights.iter().zip(extracted.iter()) {
        assert!((original - extracted_value).abs() < 1e-6);
    }

    println!("✓ Weight extraction roundtrip test passed");
}

#[test]
fn test_multi_layer_weight_placement() {
    let loader = WeightLoader::new(128, 64);

    // Create two layers: 64→32 → 16
    let layer1_weights: Vec<f32> = (0..2048).map(|i| i as f32).collect(); // 64×32 = 2048
    let layer2_weights: Vec<f32> = (0..512).map(|i| i as f32 / 10.0).collect(); // 32×16 = 512

    let layout1 = WeightLayout::dense(64, 32, 0, 0);
    let layout2 = WeightLayout::dense(32, 16, 0, 35); // y=35 (after layer1 ends at y=32)

    let cells1 = loader.load_dense_layer(&layer1_weights, &layout1).expect("Should load layer1");
    let cells2 = loader.load_dense_layer(&layer2_weights, &layout2).expect("Should load layer2");

    // Create grid and place both layers
    let mut grid = create_test_grid();

    for (i, cell) in cells1.iter().enumerate() {
        if let Some((x, y)) = layout1.coord_for_index(i) {
            grid[y * 128 + x] = *cell;
        }
    }

    for (i, cell) in cells2.iter().enumerate() {
        if let Some((x, y)) = layout2.coord_for_index(i) {
            grid[y * 128 + x] = *cell;
        }
    }

    // Verify both layers are present
    let placed_weights = find_weight_cells(&grid, 2560); // 2048 + 512
    assert_eq!(placed_weights.len(), 2560);

    // Verify layer1 weight at (0, 0)
    assert_eq!(f32::from_bits(grid[0].data_buffer), 0.0);

    // Verify layer2 weight at (0, 35)
    assert_eq!(f32::from_bits(grid[35 * 128 + 0].data_buffer), 0.0);

    println!("✓ Multi-layer weight placement test passed");
    println!("  - Layer 1: {} weights at (0, 0)", cells1.len());
    println!("  - Layer 2: {} weights at (0, 35)", cells2.len());
}

#[tokio::test]
async fn test_weight_cells_gpu_upload() {
    // Initialize GPU
    let instance = wgpu::Instance::default();
    let adapter = instance
        .request_adapter(&wgpu::RequestAdapterOptions::default())
        .await
        .expect("No GPU adapter found");

    let (device, queue) = adapter
        .request_device(
            &wgpu::DeviceDescriptor {
                label: Some("Weight Upload Test"),
                required_features: wgpu::Features::empty(),
                required_limits: wgpu::Limits::default(),
            },
            None,
        )
        .await
        .expect("Failed to create device");

    let loader = WeightLoader::new(128, 64);

    // Create test weights
    let weights: Vec<f32> = (0..100).map(|i| i as f32 / 100.0).collect();
    let layout = WeightLayout::dense(10, 10, 0, 0);

    let cells = loader.load_dense_layer(&weights, &layout).expect("Should load weights");

    // Convert to GPU array
    let grid_array = cells_to_grid_array(&cells, 128, 64, 10, 10);

    // Upload to GPU
    let buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
        label: Some("Weight Buffer"),
        contents: bytemuck::cast_slice(&grid_array),
        usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
    });

    // Verify buffer size
    let expected_size = 8192 * std::mem::size_of::<CellState>(); // Full grid
    assert_eq!(buffer.size(), expected_size);

    println!("✓ Weight cells GPU upload test passed");
    println!("  - Uploaded {} weight cells to GPU", cells.len());
    println!("  - Buffer size: {} bytes", buffer.size());
}

#[test]
fn test_coordinate_mapping_edge_cases() {
    let loader = WeightLoader::new(128, 64);

    // Single weight at origin
    let weights = vec![42.0_f32];
    let layout = WeightLayout::dense(1, 1, 0, 0);

    let cells = loader.load_dense_layer(&weights, &layout).expect("Should load weight");
    assert_eq!(cells.len(), 1);

    let extracted = loader.extract_weights(&cells, &layout);
    assert_eq!(extracted[0], 42.0);

    // Weight at grid edge (x=127, y=63)
    let weights = vec![99.0_f32];
    let layout = WeightLayout::dense(1, 1, 127, 63);

    let cells = loader.load_dense_layer(&weights, &layout).expect("Should load weight");
    assert_eq!(cells.len(), 1);

    let extracted = loader.extract_weights(&cells, &layout);
    assert_eq!(extracted[0], 99.0);

    println!("✓ Coordinate mapping edge cases test passed");
}

#[test]
fn test_weight_layout_sparse_coordinates() {
    // Test sparse layout coordinate calculation
    let indices = vec![(0, 0), (1, 2), (2, 1), (3, 3)];
    let layout = WeightLayout::Sparse {
        num_weights: 4,
        indices,
        x: 10,
        y: 5,
    };

    // Verify each index maps to correct coordinate
    let coord_0 = layout.coord_for_index(0).unwrap();
    assert_eq!(coord_0, (10, 5)); // (0, 0) + (10, 5)

    let coord_1 = layout.coord_for_index(1).unwrap();
    assert_eq!(coord_1, (12, 6)); // (1, 2) + (10, 5)

    let coord_2 = layout.coord_for_index(2).unwrap();
    assert_eq!(coord_2, (11, 7)); // (2, 1) + (10, 5)

    let coord_3 = layout.coord_for_index(3).unwrap();
    assert_eq!(coord_3, (13, 8)); // (3, 3) + (10, 5)

    println!("✓ Weight layout sparse coordinates test passed");
}

fn main() {
    println!("Running Phase 6.7.1 weight loading tests...");
    test_mnist_weight_loading();
    test_weight_grid_placement();
    test_weight_layer_bounds_checking();
    test_weight_nan_inf_rejection();
    test_weight_extraction_roundtrip();
    test_multi_layer_weight_placement();
    test_coordinate_mapping_edge_cases();
    test_weight_layout_sparse_coordinates();

    println!("\n✅ All Phase 6.7.1 tests passed!");
    println!("   - MNIST-style weight loading: ✓");
    println!("   - Grid placement: ✓");
    println!("   - Bounds checking: ✓");
    println!("   - NaN/Inf rejection: ✓");
    println!("   - Extraction roundtrip: ✓");
    println!("   - Multi-layer placement: ✓");
    println!("   - Coordinate edge cases: ✓");
    println!("   - Sparse coordinates: ✓");
}