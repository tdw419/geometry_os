//! Integration test for Glyph → Spatial routing bridge (Phase 5.1)

use infinite_map_rs::spatial::glyph_bridge::{compile_glyph_to_grid, GlyphProgram, GridLayout};
use std::path::Path;

#[test]
fn test_compile_glyph_json_file() {
    // Create test JSON file
    let json_content = r#"{
        "program": [[128, 0, 100.0, 0.0, 1], [142, 0, 1.0, 0.0, 1], [141, 0, 0.0, 0.0, 0]],
        "memory": [42.0, 0.0, 0.0, 0.0]
    }"#;

    let test_path = Path::new("/tmp/test_glyph_program.json");
    std::fs::write(&test_path, json_content).expect("Failed to write test file");

    // Compile to grid
    let layout = compile_glyph_to_grid(&test_path).expect("Compilation failed");

    // Verify grid dimensions
    assert_eq!(layout.grid_width, 128);
    assert_eq!(layout.grid_height, 64);
    assert_eq!(layout.cells.len(), 128 * 64);

    // Verify instructions placed correctly
    assert_eq!(layout.cells[0].opcode(), 3); // TYPE_LDI
    assert_eq!(layout.cells[1].opcode(), 4); // TYPE_ADD_RR
    assert_eq!(layout.cells[2].opcode(), 10); // TYPE_HALT

    // Verify memory placement
    assert_eq!(layout.cells[3].data_buffer, 42);

    // Cleanup
    std::fs::remove_file(&test_path).ok();
}

#[test]
fn test_glyph_program_from_json() {
    let json = r#"{
        "program": [[128, 0, 100.0, 0.0, 1]],
        "memory": [10.0, 20.0]
    }"#;

    let program = GlyphProgram::from_json(json).expect("Parse failed");
    assert_eq!(program.instructions.len(), 1);
    assert_eq!(program.memory.len(), 2);
    assert_eq!(program.instructions[0][0], 128.0);
    assert_eq!(program.memory[0], 10.0);
}

#[test]
fn test_grid_layout_from_program() {
    let json = r#"{
        "program": [[141, 0, 0.0, 0.0, 0]],
        "memory": [123.0]
    }"#;

    let program = GlyphProgram::from_json(json).expect("Parse failed");
    let layout = GridLayout::from_glyph_program(&program);

    // HALT instruction at (0,0)
    assert_eq!(layout.cells[0].opcode(), 10);
    // Memory at (1,0)
    assert_eq!(layout.cells[1].data_buffer, 123);
}