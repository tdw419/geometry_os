//! E2E Test for GeoASM Materialization Pipeline (Phase 6.4.1)
//!
//! Tests the complete flow:
//! 1. LLM generates spatial circuit (simulated)
//! 2. GeoASM materializer parses cells
//! 3. Cells uploaded to GPU overlay buffer
//! 4. Verify buffer contains expected data

use crate::geoasm_materializer::{CellState, GeoasmMaterializer, MaterializeRequest};
use crate::spatial_grid;

#[tokio::test]
async fn test_materialization_pipeline_e2e() {
    // ── Step 1: Simulate LLM response with GeoASM circuit ───────────────────
    let llm_response = r#"
# Simple counter circuit
DATA 0 0 100    # Register 0 at (0,0) with value 100
DATA 1 1 50     # Register 1 at (1,1) with value 50
LDI 2 1 0 0    # Load immediate to (2,1) with rel offsets
ADD_RR 3 1 1 0 # Add register at (3,1) with rel offsets
HALT 4 2
"#;

    // ── Step 2: Parse and materialize cells ───────────────────────────────
    let materializer = GeoasmMaterializer::new(128, 64);

    let cells = GeoasmMaterializer::parse_rx_buffer(
        llm_response.as_bytes(),
        llm_response.len(),
    )
    .expect("Should parse GeoASM ASCII");

    assert_eq!(cells.len(), 5, "Should parse 5 cells");

    let req = MaterializeRequest {
        cells: cells.clone(),
        region_id: None,
    };

    let grid = materializer
        .materialize(&req)
        .expect("Should materialize grid");

    // DEBUG: Check grid at parsed positions
    eprintln!("DEBUG: Checking grid positions from parsed cells:");
    for cell in &cells {
        let idx = cell.y * 128 + cell.x;
        eprintln!("  cell at ({},{}): idx={}, opcode={}, data_buffer={}",
            cell.x, cell.y, idx, grid[idx].opcode(), grid[idx].data_buffer);
    }

    // Count non-zero cells (active instructions)
    let active_cells: Vec<&CellState> = grid.iter().filter(|c| c.opcode() != 0 || c.data_buffer != 0).collect();
    eprintln!("DEBUG: Total active cells: {}", active_cells.len());
    
    assert_eq!(active_cells.len(), 5, "Should have 5 materialized cells");

    // ── Step 3: Upload to GPU overlay buffer ────────────────────────────
    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
        backends: wgpu::Backends::all(),
        ..Default::default()
    });

    let adapter = pollster::block_on(instance.request_adapter(
        &wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::HighPerformance,
            compatible_surface: None,
            force_fallback_adapter: false,
        },
    ))
    .expect("Should find adapter");

    let (device, queue) = pollster::block_on(adapter.request_device(
        &wgpu::DeviceDescriptor {
            label: Some("Test Device"),
            required_features: wgpu::Features::empty(),
            required_limits: wgpu::Limits::default(),
        },
        None,
    ))
    .expect("Should create device");

    // Create overlay buffer with materialized cells
    let overlay_buffer = spatial_grid::create_overlay_buffer(&device, &queue, Some(&grid));

    assert_eq!(
        overlay_buffer.size(),
        131072, // 8192 cells * 16 bytes
        "Overlay buffer should be 128KB"
    );

    // ── Step 4: Verify buffer contains correct data ───────────────────────
    // Create staging buffer to read back
    let staging_buffer = device.create_buffer(&wgpu::BufferDescriptor {
        label: Some("Staging Buffer"),
        size: overlay_buffer.size(),
        usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
        mapped_at_creation: false,
    });

    let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
        label: Some("Readback"),
    });

    encoder.copy_buffer_to_buffer(&overlay_buffer, 0, &staging_buffer, 0, overlay_buffer.size());

    queue.submit(Some(encoder.finish()));

    let buffer_slice = staging_buffer.slice(..);
    let (tx, rx) = flume::bounded(1);
    buffer_slice.map_async(wgpu::MapMode::Read, move |res| tx.send(res).unwrap());
    device.poll(wgpu::MaintainBase::Wait);
    rx.recv_async().await.unwrap();

    let mapped = buffer_slice.get_mapped_range();
    let gpu_cells: &[CellState] = bytemuck::cast_slice(&mapped);

    // Verify first few cells (positions where we placed instructions)
    assert_eq!(gpu_cells[0].opcode(), 0, "Cell (0,0) should be DATA (NOP opcode)");
    assert_eq!(gpu_cells[0].data_buffer, 100, "Cell (0,0) should have data=100");
    assert_eq!(gpu_cells[129].data_buffer, 50, "Cell (1,1) should have data=50");
    assert_eq!(gpu_cells[130].opcode(), 3, "Cell (2,1) should be LDI");
    assert_eq!(gpu_cells[131].opcode(), 4, "Cell (3,1) should be ADD_RR");
    assert_eq!(gpu_cells[260].opcode(), 10, "Cell (4,2) should be HALT");

    drop(mapped);
    staging_buffer.unmap();

    // ── Success ──────────────────────────────────────────────────────────
    println!("✅ E2E Materialization Pipeline Test PASSED");
    println!("   - Parsed 5 cells from LLM response");
    println!("   - Uploaded to GPU overlay buffer");
    println!("   - Verified GPU contains correct data");
}

#[tokio::test]
async fn test_materialization_empty_grid() {
    // Test uploading empty materialized cells
    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
        backends: wgpu::Backends::all(),
        ..Default::default()
    });

    let adapter = pollster::block_on(instance.request_adapter(
        &wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::HighPerformance,
            compatible_surface: None,
            force_fallback_adapter: false,
        },
    ))
    .expect("Should find adapter");

    let (device, queue) = pollster::block_on(adapter.request_device(
        &wgpu::DeviceDescriptor {
            label: Some("Test Device"),
            required_features: wgpu::Features::empty(),
            required_limits: wgpu::Limits::default(),
        },
        None,
    ))
    .expect("Should create device");

    // Create overlay buffer with no cells
    let overlay_buffer = spatial_grid::create_overlay_buffer(&device, &queue, None::<&[CellState]>);

    assert_eq!(overlay_buffer.size(), 131072);
    println!("✅ Empty grid upload test PASSED");
}

#[test]
fn test_neural_gate_take_materialized_cells() {
    let mut gate = crate::neural_gate::NeuralGate::new(crate::neural_gate::NeuralGateConfig::default());
    let gate_id = gate.register_gate(0x03000000);

    // Manually set materialized cells (simulating LLM response)
    let test_cells = vec![CellState::new(3, 0, 0); 5]; // 5 LDI cells
    gate.gates[gate_id as usize].materialized_cells = Some(test_cells.clone());

    // Take cells from gate
    let taken = gate.take_materialized_cells(gate_id);
    assert!(taken.is_some());
    assert_eq!(taken.unwrap().len(), 5);

    // Verify cells are gone (consuming once)
    let taken_again = gate.take_materialized_cells(gate_id);
    assert!(taken_again.is_none());

    println!("✅ NeuralGate take_materialized_cells test PASSED");
}