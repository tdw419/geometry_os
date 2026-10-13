// Geometry OS Spatial Compute Shader v5
// Implements token-based spatial execution on a 2D cellular automaton grid
// Uses write buffer for cross-cell mutations (solves distance problem)
//
// Two-phase design (fixes cross-workgroup data race in v4):
//   Pass 1 (post_writes): active cells post write requests to target slots
//   Pass 2 (apply_and_step): cells apply pending writes, propagate tokens
//   Between passes, WGPU guarantees global visibility (compute pass barrier)

// Cell state structure
struct CellState {
    opcode_or_type: u32,  // Packed 8-bit opcode + two 12-bit signed offsets
    is_active: u32,       // 1 = holds execution token, 0 = inactive
    data_buffer: u32,     // Value storage (registers, literals, etc.)
    executing: u32,       // 1 = executing instruction this tick (for RULE A), 0 = not executing
};

// Write request structure (for cross-cell writes)
struct WriteRequest {
    valid: u32,           // 1 = valid write request, 0 = no write
    opcode: u32,          // Opcode of the instruction making the write
    src_value: u32,       // Source value (for ADD_RR/SUB_RR: source register)
    imm_value: u32,       // Immediate value (for LDI/ADD_RI/SUB_RI)
};

// Double-buffered grid
@group(0) @binding(0) var<storage, read> grid_in: array<CellState>;
@group(0) @binding(1) var<storage, read_write> grid_out: array<CellState>;

// Write request buffer (size = number of cells, one request per possible target)
@group(0) @binding(2) var<storage, read_write> write_requests: array<WriteRequest>;

// Overlay grid (dual-grid layer for DOOR primitives)
@group(0) @binding(3) var<storage, read> overlay_grid: array<CellState>;

// Grid dimensions
const MAX_GRID_X: u32 = 128u;
const MAX_GRID_Y: u32 = 64u;

// Opcode constants (must match geoasm_assembler.py)
const TYPE_NOP: u32 = 0u;
const TYPE_WALL: u32 = 1u;
const TYPE_MEMBRANE: u32 = 2u;
const TYPE_LDI: u32 = 3u;
const TYPE_ADD_RR: u32 = 4u;
const TYPE_SUB_RR: u32 = 5u;
const TYPE_ADD_RI: u32 = 6u;
const TYPE_SUB_RI: u32 = 7u;
const TYPE_JZ: u32 = 8u;
const TYPE_JMP: u32 = 9u;
const TYPE_HALT: u32 = 10u;
const TYPE_COPY: u32 = 11u;
const TYPE_MOVE: u32 = 12u;
const TYPE_SWAP: u32 = 13u;
const TYPE_MUL: u32 = 14u;
const TYPE_DIV: u32 = 15u;
const TYPE_DOOR: u32 = 16u;
const TYPE_AND_RI: u32 = 18u;
const TYPE_OR_RI: u32 = 19u;
const TYPE_XOR_RI: u32 = 20u;
const TYPE_SHL_RI: u32 = 21u;
const TYPE_SHR_RI: u32 = 22u;
const TYPE_AND_RR: u32 = 23u;
const TYPE_OR_RR: u32 = 24u;
const TYPE_XOR_RR: u32 = 25u;
const TYPE_SLT_RR: u32 = 26u;
const TYPE_SLT_RI: u32 = 27u;
const TYPE_SLTU_RR: u32 = 28u;
const TYPE_SLTU_RI: u32 = 29u;
const TYPE_FAULTED: u32 = 255u;

// Helper: extract packed values
fn opcode_of(packed: u32) -> u32 {
    return packed & 0xFFu;
}

fn rel_x_of(packed: u32) -> i32 {
    let val = (packed >> 8u) & 0xFFFu;
    if (val >= 0x800u) {
        return i32(val) - 0x1000;
    }
    return i32(val);
}

fn rel_y_of(packed: u32) -> i32 {
    let val = (packed >> 20u) & 0xFFFu;
    if (val >= 0x800u) {
        return i32(val) - 0x1000;
    }
    return i32(val);
}

// Coordinate helpers
fn coord_to_index(coord: vec2<i32>) -> u32 {
    return u32(coord.y) * MAX_GRID_X + u32(coord.x);
}

fn index_to_coord(index: u32) -> vec2<i32> {
    return vec2<i32>(i32(index % MAX_GRID_X), i32(index / MAX_GRID_X));
}

// Read cell state with bounds checking
fn read_cell(coord: vec2<i32>) -> CellState {
    if (coord.x < 0 || coord.y < 0 || u32(coord.x) >= MAX_GRID_X || u32(coord.y) >= MAX_GRID_Y) {
        return CellState(TYPE_WALL, 0u, 0u, 0u); // Out of bounds = WALL
    }
    return grid_in[coord_to_index(coord)];
}

// Get effective cell state by merging grid_in and overlay_grid (dual-grid overlay)
// Overlay cells take precedence over grid_in cells (for DOOR permissions)
fn get_effective_cell(coord: vec2<i32>) -> CellState {
    if (coord.x < 0 || coord.y < 0 || u32(coord.x) >= MAX_GRID_X || u32(coord.y) >= MAX_GRID_Y) {
        return CellState(TYPE_WALL, 0u, 0u, 0u); // Out of bounds = WALL
    }

    let idx = coord_to_index(coord);
    let grid_cell = grid_in[idx];
    let overlay_cell = overlay_grid[idx];

    // Overlay takes precedence: if overlay has a non-NOP type, use it
    if (overlay_cell.opcode_or_type != TYPE_NOP) {
        return overlay_cell;
    }

    // Otherwise use the base grid
    return grid_cell;
}

// Check if a single cell blocks memory writes (WALL blocks, MEMBRANE is porous)
fn cell_blocks_writes(cell: CellState) -> bool {
    let op = cell.opcode_or_type;
    // WALL blocks writes. MEMBRANE allows writes (porous barrier).
    // DOOR blocks writes when closed (bit 24 clear).
    if (op == TYPE_WALL) {
        return true;
    }
    if (op == TYPE_DOOR && (op & 0x01000000u) == 0u) {
        return true;
    }
    return false;
}

// Check if a Manhattan path between two points is clear for writes.
// Single fixed route: vertical drop to target row, then horizontal to target column.
// This makes isolation predictable: WALLs on the register row between regions
// block cross-region writes while allowing in-region writes.
// Does NOT check the endpoints themselves (only intermediate cells).
fn path_clear_for_writes(src: vec2<i32>, dst: vec2<i32>) -> bool {
    let dx = dst.x - src.x;
    let dy = dst.y - src.y;

    // Same cell or adjacent — no intermediate cells to check
    if (abs(dx) + abs(dy) <= 1) {
        return true;
    }

    // Step 1: vertical from src.y to dst.y on column src.x
    if (dy != 0) {
        var step: i32 = 1;
        if (dy < 0) { step = -1; }
        for (var y = src.y + step; y != dst.y; y += step) {
            if (cell_blocks_writes(get_effective_cell(vec2<i32>(src.x, y)))) {
                return false;
            }
        }
    }

    // Step 2: horizontal from src.x to dst.x on row dst.y
    if (dx != 0) {
        var step: i32 = 1;
        if (dx < 0) { step = -1; }
        for (var x = src.x + step; x != dst.x; x += step) {
            if (cell_blocks_writes(get_effective_cell(vec2<i32>(x, dst.y)))) {
                return false;
            }
        }
    }

    return true;
}

// ============================================================
// PASS 1: post_writes
// Active cells compute their write targets and post write requests.
// No clears, no reads from write_requests. Just posts.
// ============================================================
@compute @workgroup_size(8, 8, 1)
fn post_writes(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let coord = vec2<i32>(i32(global_id.x), i32(global_id.y));

    if (coord.x >= i32(MAX_GRID_X) || coord.y >= i32(MAX_GRID_Y)) {
        return;
    }

    let idx = coord_to_index(coord);
    let current = grid_in[idx];
    let opcode = opcode_of(current.opcode_or_type);
    let rel_x = rel_x_of(current.opcode_or_type);
    let rel_y = rel_y_of(current.opcode_or_type);

    // Passthrough copy to grid_out (ensures bind group layout matches apply_and_step)
    grid_out[idx] = current;

    // Only active cells with write-capable opcodes post writes
    if (current.is_active != 1u) {
        return;
    }
    // Write instructions
    if (opcode == TYPE_LDI || opcode == TYPE_ADD_RI || opcode == TYPE_SUB_RI ||
        opcode == TYPE_ADD_RR || opcode == TYPE_SUB_RR || opcode == TYPE_COPY ||
        opcode == TYPE_MOVE || opcode == TYPE_MUL || opcode == TYPE_DIV ||
        opcode == TYPE_AND_RI || opcode == TYPE_OR_RI || opcode == TYPE_XOR_RI ||
        opcode == TYPE_SHL_RI || opcode == TYPE_SHR_RI ||
        opcode == TYPE_AND_RR || opcode == TYPE_OR_RR || opcode == TYPE_XOR_RR ||
        opcode == TYPE_SLT_RR || opcode == TYPE_SLT_RI ||
        opcode == TYPE_SLTU_RR || opcode == TYPE_SLTU_RI) {

        let write_target = coord + vec2<i32>(rel_x, rel_y);

        if (write_target.x >= 0 && write_target.y >= 0 &&
            u32(write_target.x) < MAX_GRID_X && u32(write_target.y) < MAX_GRID_Y) {

            let target_idx = coord_to_index(write_target);
            let target_cell = get_effective_cell(write_target);
            let target_opcode = opcode_of(target_cell.opcode_or_type);

            // Path validation: check Manhattan route from instruction to target.
            // WALL on path blocks writes. MEMBRANE is porous (allows writes through).
            // Also check target cell itself is not a WALL.
            let path_clear = path_clear_for_writes(coord, write_target);
            let target_writable = (target_opcode != TYPE_WALL &&
                                   !(target_opcode == TYPE_DOOR && (target_cell.opcode_or_type & 0x01000000u) == 0u));

            if (path_clear && target_writable) {
                var req = WriteRequest(1u, opcode, 0u, 0u);

                if (opcode == TYPE_LDI) {
                    let imm_coord = coord + vec2<i32>(1, 0);
                    req.imm_value = read_cell(imm_coord).data_buffer;
                } else if (opcode == TYPE_ADD_RI || opcode == TYPE_SUB_RI ||
                           opcode == TYPE_AND_RI || opcode == TYPE_OR_RI || opcode == TYPE_XOR_RI ||
                           opcode == TYPE_SHL_RI || opcode == TYPE_SHR_RI ||
                           opcode == TYPE_SLT_RI || opcode == TYPE_SLTU_RI) {
                    let imm_coord = coord + vec2<i32>(1, 0);
                    req.imm_value = read_cell(imm_coord).data_buffer;
                } else if (opcode == TYPE_ADD_RR || opcode == TYPE_SUB_RR ||
                           opcode == TYPE_AND_RR || opcode == TYPE_OR_RR || opcode == TYPE_XOR_RR ||
                           opcode == TYPE_SLT_RR || opcode == TYPE_SLTU_RR) {
                    let src_offset_coord = coord + vec2<i32>(1, 0);
                    let src_offsets = read_cell(src_offset_coord).opcode_or_type;
                    let src_rel_x = rel_x_of(src_offsets);
                    let src_rel_y = rel_y_of(src_offsets);
                    let src_coord = coord + vec2<i32>(src_rel_x, src_rel_y);
                    req.src_value = read_cell(src_coord).data_buffer;
                } else if (opcode == TYPE_COPY || opcode == TYPE_MOVE) {
                    let src_offset_coord = coord + vec2<i32>(1, 0);
                    let src_offsets = read_cell(src_offset_coord).opcode_or_type;
                    let src_rel_x = rel_x_of(src_offsets);
                    let src_rel_y = rel_y_of(src_offsets);
                    let src_coord = coord + vec2<i32>(src_rel_x, src_rel_y);
                    req.src_value = read_cell(src_coord).data_buffer;

                    if (opcode == TYPE_MOVE) {
                        let src_idx = coord_to_index(src_coord);
                        var zero_req = WriteRequest(1u, TYPE_MOVE, 0u, 0u);
                        write_requests[src_idx] = zero_req;
                    }
                } else if (opcode == TYPE_MUL || opcode == TYPE_DIV) {
                    let src_offset_coord = coord + vec2<i32>(1, 0);
                    let src_offsets = read_cell(src_offset_coord).opcode_or_type;
                    let src_rel_x = rel_x_of(src_offsets);
                    let src_rel_y = rel_y_of(src_offsets);
                    let src_coord = coord + vec2<i32>(src_rel_x, src_rel_y);
                    req.src_value = read_cell(src_coord).data_buffer;
                }

                write_requests[target_idx] = req;
            }
        }
    } else if (opcode == TYPE_SWAP) {
        // SWAP: read both registers and post writes to both
        let reg1_offset_coord = coord + vec2<i32>(1, 0);
        let reg1_offsets = read_cell(reg1_offset_coord).opcode_or_type;
        let reg1_rel_x = rel_x_of(reg1_offsets);
        let reg1_rel_y = rel_y_of(reg1_offsets);
        let reg1_coord = coord + vec2<i32>(reg1_rel_x, reg1_rel_y);
        let reg1_value = read_cell(reg1_coord).data_buffer;

        let reg2_offset_coord = coord + vec2<i32>(2, 0);
        let reg2_offsets = read_cell(reg2_offset_coord).opcode_or_type;
        let reg2_rel_x = rel_x_of(reg2_offsets);
        let reg2_rel_y = rel_y_of(reg2_offsets);
        let reg2_coord = coord + vec2<i32>(reg2_rel_x, reg2_rel_y);
        let reg2_value = read_cell(reg2_coord).data_buffer;

        // Post write to register 1 (gets reg2's value)
        let req1 = WriteRequest(1u, TYPE_SWAP, reg2_value, 0u);
        write_requests[coord_to_index(reg1_coord)] = req1;

        // Post write to register 2 (gets reg1's value)
        let req2 = WriteRequest(1u, TYPE_SWAP, reg1_value, 0u);
        write_requests[coord_to_index(reg2_coord)] = req2;
    }
}

// ============================================================
// PASS 2: apply_and_step
// Each cell reads its own write request, applies it, and propagates tokens.
// Clears the write request after reading.
// ============================================================
@compute @workgroup_size(8, 8, 1)
fn apply_and_step(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let coord = vec2<i32>(i32(global_id.x), i32(global_id.y));

    if (coord.x >= i32(MAX_GRID_X) || coord.y >= i32(MAX_GRID_Y)) {
        return;
    }

    let idx = coord_to_index(coord);
    let current = grid_in[idx];
    var next = current;
    next.executing = 0u;

    let opcode = opcode_of(current.opcode_or_type);

    // === APPLY WRITES (read from buffer) ===
    let req = write_requests[idx];
    if (req.valid == 1u) {
        if (req.opcode == TYPE_LDI) {
            next.data_buffer = req.imm_value;
        } else if (req.opcode == TYPE_ADD_RI) {
            next.data_buffer = current.data_buffer + req.imm_value;
        } else if (req.opcode == TYPE_SUB_RI) {
            next.data_buffer = current.data_buffer - req.imm_value;
        } else if (req.opcode == TYPE_AND_RI) {
            next.data_buffer = current.data_buffer & req.imm_value;
        } else if (req.opcode == TYPE_OR_RI) {
            next.data_buffer = current.data_buffer | req.imm_value;
        } else if (req.opcode == TYPE_XOR_RI) {
            next.data_buffer = current.data_buffer ^ req.imm_value;
        } else if (req.opcode == TYPE_SHL_RI) {
            next.data_buffer = current.data_buffer << (req.imm_value & 31u);
        } else if (req.opcode == TYPE_SHR_RI) {
            next.data_buffer = current.data_buffer >> (req.imm_value & 31u);
        } else if (req.opcode == TYPE_ADD_RR) {
            next.data_buffer = current.data_buffer + req.src_value;
        } else if (req.opcode == TYPE_SUB_RR) {
            next.data_buffer = current.data_buffer - req.src_value;
        } else if (req.opcode == TYPE_AND_RR) {
            next.data_buffer = current.data_buffer & req.src_value;
        } else if (req.opcode == TYPE_OR_RR) {
            next.data_buffer = current.data_buffer | req.src_value;
        } else if (req.opcode == TYPE_XOR_RR) {
            next.data_buffer = current.data_buffer ^ req.src_value;
        } else if (req.opcode == TYPE_SLT_RR) {
            let lhs_signed = bitcast<i32>(current.data_buffer);
            let rhs_signed = bitcast<i32>(req.src_value);
            next.data_buffer = select(1u, 0u, lhs_signed < rhs_signed);
        } else if (req.opcode == TYPE_SLT_RI) {
            let lhs_signed = bitcast<i32>(current.data_buffer);
            let rhs_signed = bitcast<i32>(req.imm_value);
            next.data_buffer = select(1u, 0u, lhs_signed < rhs_signed);
        } else if (req.opcode == TYPE_SLTU_RR) {
            next.data_buffer = select(1u, 0u, current.data_buffer < req.src_value);
        } else if (req.opcode == TYPE_SLTU_RI) {
            next.data_buffer = select(1u, 0u, current.data_buffer < req.imm_value);
        } else if (req.opcode == TYPE_COPY) {
            next.data_buffer = req.src_value;
        } else if (req.opcode == TYPE_MOVE) {
            if (req.src_value != 0u) {
                next.data_buffer = req.src_value;
            } else {
                next.data_buffer = 0u;
            }
        } else if (req.opcode == TYPE_SWAP) {
            next.data_buffer = req.src_value;
        } else if (req.opcode == TYPE_MUL) {
            next.data_buffer = current.data_buffer * req.src_value;
        } else if (req.opcode == TYPE_DIV) {
            if (req.src_value != 0u) {
                next.data_buffer = current.data_buffer / req.src_value;
            }
        }
    }

    // Clear write request for this cell (safe now — all posts from pass 1 are visible)
    write_requests[idx].valid = 0u;

    // === TOKEN PROPAGATION ===
    next.is_active = 0u;

    // PASS 1: If we have token, compute where we're forwarding it
    var my_forward_target = vec2<i32>(-999, -999);
    if (current.is_active == 1u) {
        if (opcode == TYPE_HALT) {
            my_forward_target = vec2<i32>(-999, -999);
        } else {
            var target_coord = coord + vec2<i32>(1, 0);
            // Write instructions
            if (opcode == TYPE_LDI || opcode == TYPE_ADD_RI || opcode == TYPE_SUB_RI ||
                opcode == TYPE_ADD_RR || opcode == TYPE_SUB_RR || opcode == TYPE_COPY ||
                opcode == TYPE_MOVE || opcode == TYPE_MUL || opcode == TYPE_DIV ||
                opcode == TYPE_AND_RI || opcode == TYPE_OR_RI || opcode == TYPE_XOR_RI ||
                opcode == TYPE_SHL_RI || opcode == TYPE_SHR_RI ||
                opcode == TYPE_AND_RR || opcode == TYPE_OR_RR || opcode == TYPE_XOR_RR ||
                opcode == TYPE_SLT_RR || opcode == TYPE_SLT_RI ||
                opcode == TYPE_SLTU_RR || opcode == TYPE_SLTU_RI) {
                target_coord.x = coord.x + 2;
            } else if (opcode == TYPE_JZ || opcode == TYPE_JMP || opcode == TYPE_SWAP) {
                target_coord.x = coord.x + 3;
            }

            let target_cell = get_effective_cell(target_coord);
            let is_door_closed_token = (target_cell.opcode_or_type == TYPE_DOOR && (target_cell.opcode_or_type & 0x01000000u) == 0u);
            let target_is_inert = (target_cell.opcode_or_type == TYPE_WALL ||
                                   target_cell.opcode_or_type == TYPE_MEMBRANE ||
                                   is_door_closed_token);

            if (target_is_inert) {
                next.is_active = 1u;
                my_forward_target = vec2<i32>(-999, -999);
            } else {
                my_forward_target = target_coord;
            }
        }
    }

    // PASS 2: Collect incoming tokens from left neighbors
    let can_acquire = (opcode != TYPE_WALL && opcode != TYPE_MEMBRANE && opcode != TYPE_NOP && opcode != TYPE_DOOR);

    if (can_acquire) {
        for (var i = 1; i <= 3; i++) {
            let left_neighbor = coord + vec2<i32>(-i, 0);
            let left_cell = read_cell(left_neighbor);

            if (left_cell.is_active == 1u) {
                let left_opcode = opcode_of(left_cell.opcode_or_type);

                var left_forward_target = vec2<i32>(-999, -999);

                if (left_opcode == TYPE_HALT) {
                    left_forward_target = vec2<i32>(-999, -999);
                } else {
                    var left_target_coord = left_neighbor + vec2<i32>(1, 0);
                    // Write instructions
                    if (left_opcode == TYPE_LDI || left_opcode == TYPE_ADD_RI || left_opcode == TYPE_SUB_RI ||
                        left_opcode == TYPE_ADD_RR || left_opcode == TYPE_SUB_RR || left_opcode == TYPE_COPY ||
                        left_opcode == TYPE_MOVE || left_opcode == TYPE_MUL || left_opcode == TYPE_DIV ||
                        left_opcode == TYPE_AND_RI || left_opcode == TYPE_OR_RI || left_opcode == TYPE_XOR_RI ||
                        left_opcode == TYPE_SHL_RI || left_opcode == TYPE_SHR_RI ||
                        left_opcode == TYPE_AND_RR || left_opcode == TYPE_OR_RR || left_opcode == TYPE_XOR_RR ||
                        left_opcode == TYPE_SLT_RR || left_opcode == TYPE_SLT_RI ||
                        left_opcode == TYPE_SLTU_RR || left_opcode == TYPE_SLTU_RI) {
                        left_target_coord.x = left_neighbor.x + 2;
                    } else if (left_opcode == TYPE_JZ || left_opcode == TYPE_JMP || left_opcode == TYPE_SWAP) {
                        left_target_coord.x = left_neighbor.x + 3;
                    }

                    let left_target_cell = get_effective_cell(left_target_coord);
                    let left_target_is_inert = (left_target_cell.opcode_or_type == TYPE_WALL ||
                                               left_target_cell.opcode_or_type == TYPE_MEMBRANE ||
                                               left_target_cell.opcode_or_type == TYPE_DOOR);

                    if (left_target_is_inert) {
                        left_forward_target = vec2<i32>(-999, -999);
                    } else {
                        left_forward_target = left_target_coord;
                    }
                }

                if (all(left_forward_target == coord)) {
                    next.is_active = 1u;
                    break;
                }
            }
        }
    }

    // === MARK EXECUTING CELLS ===
    if (current.is_active == 1u || next.is_active == 1u) {
        next.executing = 1u;
    }

    grid_out[idx] = next;
}
