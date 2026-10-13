//! Test to verify fitness metric doesn't saturate at arbitrary caps
//! This ensures neural pattern improvements can be accurately measured

use crate::geoasm_materializer::CellState;
use crate::spatial::circuit_executor::{CircuitExecutor, ExecutionConfig};

/// Helper to create an active cell (sets is_active = 1)
fn active_cell(opcode: u32, rel_x: i32, rel_y: i32) -> CellState {
    CellState {
        opcode_or_type: (opcode & 0xFF)
            | (((rel_x as u32) & 0xFFF) << 8)
            | (((rel_y as u32) & 0xFFF) << 20),
        is_active: 1,
        data_buffer: 0,
        executing: 0,
    }
}

#[test]
fn test_fitness_no_saturation_full_active_circuit() {
    // Create a 32x32 grid with all cells active
    let circuit: Vec<CellState> = (0..1024).map(|_| active_cell(3, 0, 0)).collect();

    let config = ExecutionConfig::default();
    let mut executor = CircuitExecutor::new(config);
    
    let result = executor.execute_and_measure(&circuit);

    // Verify fitness is NOT at an arbitrary cap like 20000004.0
    assert_ne!(result.fitness_score, 20000004.0, 
        "Fitness should not be capped at 20000004.0");
    
    // Verify fitness is within the expected 0-100 range
    assert!(result.fitness_score >= 0.0 && result.fitness_score <= 100.0,
        "Fitness {} should be in range [0, 100]", result.fitness_score);
    
    // For a fully active circuit, fitness should be reasonably high
    assert!(result.fitness_score > 50.0,
        "Fully active circuit should have fitness > 50, got {}", result.fitness_score);
}

#[test]
fn test_fitness_no_saturation_sparse_circuit() {
    // Create a 32x32 grid with sparse activity (10% active)
    let circuit: Vec<CellState> = (0..1024)
        .map(|i| if i % 10 == 0 { active_cell(3, 0, 0) } else { CellState::data(0) })
        .collect();

    let config = ExecutionConfig::default();
    let mut executor = CircuitExecutor::new(config);
    
    let result = executor.execute_and_measure(&circuit);

    // Verify fitness is NOT at an arbitrary cap
    assert_ne!(result.fitness_score, 20000004.0,
        "Sparse circuit fitness should not be capped at 20000004.0");
    
    // Verify fitness is within the expected 0-100 range
    assert!(result.fitness_score >= 0.0 && result.fitness_score <= 100.0,
        "Fitness {} should be in range [0, 100]", result.fitness_score);
    
    // Sparse circuit should have lower fitness than full circuit
    assert!(result.fitness_score < 80.0,
        "Sparse circuit should have fitness < 80, got {}", result.fitness_score);
}

#[test]
fn test_fitness_differentiates_circuit_complexity() {
    // Create three circuits with different activity levels
    // Low: 5% active
    let circuit_low: Vec<CellState> = (0..1024)
        .map(|i| {
            if i % 20 == 0 {
                active_cell(3, 0, 0)
            } else {
                CellState::data(0)
            }
        })
        .collect();

    // Medium: 25% active
    let circuit_med: Vec<CellState> = (0..1024)
        .map(|i| {
            if i % 4 == 0 {
                active_cell(3, 0, 0)
            } else {
                CellState::data(0)
            }
        })
        .collect();

    // High: 50% active
    let circuit_high: Vec<CellState> = (0..1024)
        .map(|i| {
            if i % 2 == 0 {
                active_cell(3, 0, 0)
            } else {
                CellState::data(0)
            }
        })
        .collect();

    let config = ExecutionConfig::default();
    let mut executor = CircuitExecutor::new(config);
    
    let result_low = executor.execute_and_measure(&circuit_low);
    let result_med = executor.execute_and_measure(&circuit_med);
    let result_high = executor.execute_and_measure(&circuit_high);

    // Save fitness scores before moving results into the loop
    let fitness_low = result_low.fitness_score;
    let fitness_med = result_med.fitness_score;
    let fitness_high = result_high.fitness_score;

    // All should be within range
    for (name, result) in [("low", result_low), ("med", result_med), ("high", result_high)] {
        assert!(result.fitness_score >= 0.0 && result.fitness_score <= 100.0,
            "{} circuit fitness {} should be in range [0, 100]", name, result.fitness_score);
        assert_ne!(result.fitness_score, 20000004.0,
            "{} circuit fitness should not be capped at 20000004.0", name);
    }
    
    // Higher activity should result in higher fitness
    assert!(fitness_high > fitness_med,
        "High activity circuit (fitness={}) should have higher fitness than medium (fitness={})",
        fitness_high, fitness_med);
    assert!(fitness_med > fitness_low,
        "Medium activity circuit (fitness={}) should have higher fitness than low (fitness={})",
        fitness_med, fitness_low);
}

#[test]
fn test_fitness_evolution_progression() {
    // Simulate evolution by gradually improving a circuit
    let mut circuit = vec![CellState::data(0); 1024];
    
    let config = ExecutionConfig::default();
    let mut executor = CircuitExecutor::new(config);
    
    let mut previous_fitness = 0.0;
    
    // Start with minimal activity and add cells progressively
    for iteration in 0..10 {
        let active_count = (iteration + 1) * 50; // 50, 100, 150, ... 500 cells
        for (i, cell) in circuit.iter_mut().enumerate() {
            if i < active_count {
                *cell = CellState::new(3, 0, 0);
            } else {
                *cell = CellState::data(0);
            }
        }
        
        let result = executor.execute_and_measure(&circuit);
        
        // Verify no saturation at arbitrary cap
        assert_ne!(result.fitness_score, 20000004.0,
            "Fitness at iteration {} should not be capped at 20000004.0", iteration);
        
        // Verify within range
        assert!(result.fitness_score >= 0.0 && result.fitness_score <= 100.0,
            "Fitness at iteration {} should be in range [0, 100]", iteration);
        
        // Fitness should generally increase as we add active cells
        // (allowing for some variance due to measurement randomness)
        assert!(result.fitness_score >= previous_fitness - 10.0,
            "Fitness should not significantly decrease when adding cells: {} -> {}",
            previous_fitness, result.fitness_score);
        
        previous_fitness = result.fitness_score;
    }
    
    // Final fitness should be reasonably high after adding 500 active cells
    assert!(previous_fitness > 20.0,
        "After adding 500 active cells, fitness should be > 20, got {}", previous_fitness);
}