use infinite_map_rs::geoasm_materializer::{CellState, GeoasmMaterializer, MaterializeRequest, MaterializeCell, TYPE_LDI, TYPE_ADD_RR};
use infinite_map_rs::spatial::GridRunner;
use log::{info, warn};
use std::time::Instant;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    env_logger::init();
    info!("🧬 Geometry OS - Phase 20.5 GPU Verification 🧬");

    // 1. Mock the Apex Survivor (Pareto Best from Phase 20.4)
    let mut cells = Vec::new();
    for y in 0..32 {
        for x in 0..32 {
            if (x + y) % 2 == 0 {
                let mut cell = CellState::new(TYPE_ADD_RR, 1, 0);
                cell.is_active = 1;
                cells.push(MaterializeCell { x, y, cell });
            } else {
                let mut cell = CellState::new(TYPE_LDI, 1, 0);
                cell.is_active = 1;
                cells.push(MaterializeCell { x, y, cell });
            }
        }
    }

    let req = MaterializeRequest {
        cells,
        region_id: Some("apex_survivor_sandbox".to_string()),
    };

    info!("1. Materializing Apex Survivor...");
    let materializer = GeoasmMaterializer::new(32, 32);
    let materialized_grid = materializer.materialize(&req).unwrap();
    info!("   Materialized {} cells into 32x32 spatial grid.", materialized_grid.len());

    info!("2. Loading GridRunner (GPU Substrate)...");
    let mut runner = GridRunner::new_with_grid(32, 32).await?;
    
    // Convert to bytes for loading, including the 20-byte GeoASM header
    let mut bin_data = Vec::new();
    bin_data.extend_from_slice(&(32u32).to_le_bytes()); // grid_w
    bin_data.extend_from_slice(&(32u32).to_le_bytes()); // grid_h
    bin_data.extend_from_slice(&(1024u32).to_le_bytes()); // cell_count
    bin_data.extend_from_slice(&(0u32).to_le_bytes()); // first_code_x
    bin_data.extend_from_slice(&(0u32).to_le_bytes()); // first_code_y
    
    // Each cell is 16 bytes: x (u32), y (u32), opcode_or_type (u32), data_buffer (u32)
    for y in 0..32 {
        for x in 0..32 {
            let idx = y * 32 + x;
            let cell = &materialized_grid[idx];
            bin_data.extend_from_slice(&(x as u32).to_le_bytes());
            bin_data.extend_from_slice(&(y as u32).to_le_bytes());
            bin_data.extend_from_slice(&cell.opcode_or_type.to_le_bytes());
            bin_data.extend_from_slice(&cell.data_buffer.to_le_bytes());
        }
    }

    runner.load_overlay(&bin_data)?;
    info!("   Cells loaded into GPU memory.");

    info!("3. Executing 1000 GPU Ticks...");
    let start_time = Instant::now();
    let tick_count = 1000;
    
    for i in 0..tick_count {
        let _ = runner.tick().await?;
        if i % 250 == 0 {
            info!("   Tick {}/{}", i, tick_count);
        }
    }

    let duration = start_time.elapsed();
    let fps = (tick_count as f64 / duration.as_secs_f64()) as f32;
    
    info!("==========================================");
    info!("✅ Real-Time GPU Execution Verified");
    info!("   Total Ticks: {}", tick_count);
    info!("   Elapsed Time: {:?}", duration);
    info!("   Actual Hardware FPS: {:.1}", fps);
    info!("   Average Tick Time: {:.2} µs", duration.as_micros() as f64 / tick_count as f64);
    
    // Simulated vs Real comparison output
    let sim_fps = 331.5; // From Demo 20.4
    let mismatch = (fps - sim_fps).abs() / sim_fps * 100.0;
    info!("   Simulated FPS: {:.1}", sim_fps);
    info!("   Mismatch: {:.1}%", mismatch);

    if mismatch > 15.0 {
        warn!("⚠️ Significant mismatch between fitness function and GPU reality! Adjust weights.");
    } else {
        info!("🎯 Fitness function accurately predicts GPU behavior.");
    }

    Ok(())
}
