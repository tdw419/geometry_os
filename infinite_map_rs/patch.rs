use infinite_map_rs::spatial::spatial_mmu::{MmuProgram, cell_index};
use infinite_map_rs::spatial::grid_runner::GridRunner;

#[tokio::main]
async fn main() {
    let base = cell_index(4, 30);
    let limit = base + 20;

    let mut program = MmuProgram::new_alloc(2, 2, 4, base, limit);
    program.add_allocated_region(4, 30, 3);

    let mut runner = GridRunner::new().await.expect("GPU init failed");
    runner
        .load_binary(&program.to_binary())
        .expect("load_binary failed");

    let mut cells = runner.tick().await.expect("tick failed");
    let request = &cells[program.request_index() as usize];
    println!("Tick 1: opcode: {}, active: {}, executing: {}, data: {}", request.opcode_or_type, request.is_active, request.executing, request.data_buffer);
}
