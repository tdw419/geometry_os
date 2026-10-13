use infinite_map_rs::spatial::{PathCache, GRID_H, GRID_W, TOTAL_CELLS};
use infinite_map_rs::geoasm_materializer::{CellState, TYPE_WALL};

#[test]
fn test_path_cache_from_cells() {
    // Create grid with all active cells (no walls)
    let cells: Vec<CellState> = (0..TOTAL_CELLS).map(|_| CellState::new(0, 0, 0)).collect();

    let path_cache = PathCache::from_cells(&cells);

    // Verify basic structure
    assert_eq!(path_cache.get_horiz_counts().len(), GRID_H);
    assert_eq!(path_cache.get_vert_counts().len(), GRID_W);
    assert_eq!(path_cache.get_horiz_segments_gpu().len(), GRID_H * 64 * 2); // MAX_SEGMENTS * 2
    assert_eq!(path_cache.get_vert_segments_gpu().len(), GRID_W * 64 * 2);

    // Test path_clear for a simple horizontal path
    // From (0,0) to (1,0) - should be clear since they're adjacent
    assert!(path_cache.path_clear(0, 0, 1, 0));

    // From (0,0) to (2,0) - should be clear since there's a continuous segment
    assert!(path_cache.path_clear(0, 0, 2, 0));
}

#[test]
fn test_path_cache_with_wall() {
    let mut cells: Vec<CellState> = (0..TOTAL_CELLS).map(|_| CellState::new(0, 0, 0)).collect();

    // Place a wall blocking the path
    cells[0 * GRID_W + 1] = CellState {
        opcode_or_type: TYPE_WALL,
        is_active: 0,
        data_buffer: 0,
        executing: 0,
    };

    let path_cache = PathCache::from_cells(&cells);

    // Path that crosses the wall should be blocked
    assert!(!path_cache.path_clear(0, 0, 2, 0));

    // Path on same side of wall should be clear
    assert!(path_cache.path_clear(0, 0, 0, 1));
}

#[test]
fn test_path_cache_empty_grid() {
    let cells: Vec<CellState> = (0..TOTAL_CELLS).map(|_| CellState::new(0, 0, 0)).collect();
    let path_cache = PathCache::from_cells(&cells);

    // Empty grid (no walls) should have full segments
    let horiz_counts = path_cache.get_horiz_counts();
    let vert_counts = path_cache.get_vert_counts();

    // Each row should have 1 full segment (0 to GRID_W-1)
    for &count in horiz_counts.iter() {
        assert_eq!(count, 1, "Empty grid row should have 1 horizontal segment");
    }

    // Each column should have 1 full segment (0 to GRID_H-1)
    for &count in vert_counts.iter() {
        assert_eq!(count, 1, "Empty grid column should have 1 vertical segment");
    }
}

#[test]
fn test_path_cache_gpu_layout() {
    let cells: Vec<CellState> = (0..TOTAL_CELLS).map(|_| CellState::new(0, 0, 0)).collect();
    let path_cache = PathCache::from_cells(&cells);

    // Verify GPU buffers are properly aligned
    let horiz_gpu = path_cache.get_horiz_segments_gpu();
    let vert_gpu = path_cache.get_vert_segments_gpu();

    // Each row has max 64 segments, each segment is 2 u32s (start, end)
    assert_eq!(horiz_gpu.len(), GRID_H * 64 * 2);
    assert_eq!(vert_gpu.len(), GRID_W * 64 * 2);

    // First segment of each row should be the full row
    for y in 0..GRID_H {
        let idx = y * 64 * 2;
        assert_eq!(horiz_gpu[idx], 0, "Segment should start at 0");
        assert_eq!(horiz_gpu[idx + 1], GRID_W as u32, "Segment should span full width");
    }

    // First segment of each column should be the full column
    for x in 0..GRID_W {
        let idx = x * 64 * 2;
        assert_eq!(vert_gpu[idx], 0, "Segment should start at 0");
        assert_eq!(vert_gpu[idx + 1], GRID_H as u32, "Segment should span full height");
    }
}