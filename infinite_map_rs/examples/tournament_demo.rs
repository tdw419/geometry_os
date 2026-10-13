use infinite_map_rs::geoasm_materializer::CellState;
use infinite_map_rs::spatial::tournament_manager::{TournamentConfig, TournamentManager};

fn main() {
    println!("🧬 Geometry OS - Tournament Manager Demo 🧬\n");

    // Initialize the manager with a 512x512 grid and 32x32 sandboxes
    let config = TournamentConfig::default();
    println!("Grid Size: {}x{}", config.grid_width, config.grid_height);
    println!("Sandbox Size: {}x{}", config.sandbox_size, config.sandbox_size);
    
    let mut manager = TournamentManager::new(config);
    println!("Total Sandboxes Partitioned: {}\n", manager.sandboxes.len());

    // 1. Initialize the grid with boundary membranes
    let grid = manager.initialize_grid();
    println!("Grid initialized with {} cells.", grid.len());

    // 2. Allocate 4 sandboxes as a test
    for _ in 0..4 {
        if let Some(sandbox) = manager.allocate_sandbox() {
            println!(
                "Allocated Sandbox {} at ({}, {}) [{}x{}]",
                sandbox.id, sandbox.x, sandbox.y, sandbox.width, sandbox.height
            );
            
            // Mock a fitness score assignment
            sandbox.current_fitness = Some(0.85 + (sandbox.id as f32 * 0.01));
        }
    }

    // 3. Find the apex survivor
    if let Some(apex) = manager.get_apex_survivor() {
        println!(
            "\n🏆 Apex Survivor Identified: Sandbox {} with fitness score {}",
            apex.id, apex.current_fitness.unwrap()
        );
    }

    println!("\nTournament Manager validation complete.");
}
