// Geometry OS Spatial Compute Shader v7.1
// Implements token-based spatial execution with indirect addressing
//
// v7.1: Added LOAD_IND (opcode 30) and STORE_IND (opcode 31) for runtime-computed
//       pointer addressing - enabling xv6 hot path transpilation.

// Cell state structure
struct CellState {
    opcode_or_type: u32,  // Packed 8-bit opcode + two 12-bit signed offsets
    is_active: u32,       // 1 = holds execution token, 0 = inactive
    data_buffer: u32,     // Value storage (registers, literals, pointers, etc.)
    executing: u32,       // 1 = executing instruction this tick (for RULE A), 0 = not executing
};

// Write request structure (for cross-cell writes)
struct WriteRequest {
    valid: u32,           // 1 = valid write request, 0 = no write
    opcode: u32,          // Opcode of the instruction making the write
    src_value: u32,       // Source value (for ADD_RR/SUB_RR: source register)
    imm_value: u32,       // Immediate value (for LDI/ADD_RI/SUB_RI)
};

// Grid dimensions (passed via uniform buffer)
struct GridDimensions {
    grid_w: u32,
    grid_h: u32,
};

@group(0) @binding(0) var<storage, read> grid_in: array<CellState>;
@group(0) @binding(1) var<storage, read_write> grid_out: array<CellState>;

// Write request buffer (size = number of cells, one request per possible target)
@group(0) @binding(2) var<storage, read_write> write_requests: array<WriteRequest>;

// Overlay grid (dual-grid layer for DOOR primitives)
@group(0) @binding(3) var<storage, read> overlay_grid: array<CellState>;

// Grid dimensions uniform
@group(0) @binding(8) var<uniform> grid_dims: GridDimensions;

// Opcode constants (must match geoasm_assembler.py and docs/geoasm_spatial_spec.md)
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
const TYPE_LOAD_IND: u32 = 30u;  // NEW: Load Indirect (pointer read)
const TYPE_STORE_IND: u32 = 31u; // NEW: Store Indirect (pointer write)
const TYPE_JMP_IND: u32 = 32u;   // NEW: Jump Indirect (dynamic coordinate jump)
const TYPE_SHL_RR: u32 = 33u;    // NEW: Shift Left by Register (v7.3)
const TYPE_SHR_RR: u32 = 34u;    // NEW: Shift Right Logical by Register (v7.3)
const TYPE_SRA_RI: u32 = 35u;    // NEW: Shift Right Arithmetic by Immediate (v7.3)
const TYPE_SRA_RR: u32 = 36u;    // NEW: Shift Right Arithmetic by Register (v7.3)
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
    return u32(coord.y) * grid_dims.grid_w + u32(coord.x);
}

fn index_to_coord(index: u32) -> vec2<i32> {
    return vec2<i32>(i32(index % grid_dims.grid_w), i32(index / grid_dims.grid_w));
}

// Unpack pointer from data_buffer: (y << 16) | (x & 0xFFFF)
fn unpack_ptr(packed_addr: u32) -> vec2<i32> {
    let x = i32(packed_addr & 0xFFFFu);
    let y = i32(packed_addr >> 16u);
    return vec2<i32>(x, y);
}

// Pack pointer to data_buffer: (y << 16) | (x & 0xFFFF)
fn pack_ptr(x: i32, y: i32) -> u32 {
    return (u32(y) << 16u) | (u32(x) & 0xFFFFu);
}

// Read cell state with bounds checking
fn read_cell(coord: vec2<i32>) -> CellState {
    if (coord.x < 0 || coord.y < 0 || u32(coord.x) >= grid_dims.grid_w || u32(coord.y) >= grid_dims.grid_h) {
        return CellState(TYPE_WALL, 0u, 0u, 0u); // Out of bounds = WALL
    }
    return grid_in[coord_to_index(coord)];
}

// Get effective cell state by merging grid_in and overlay_grid (dual-grid overlay)
// Overlay cells take precedence over grid_in cells (for DOOR permissions)
fn get_effective_cell(coord: vec2<i32>) -> CellState {
    if (coord.x < 0 || coord.y < 0 || u32(coord.x) >= grid_dims.grid_w || u32(coord.y) >= grid_dims.grid_h) {
        return CellState(TYPE_WALL, 0u, 0u, 0u); // Out of bounds = WALL
    }

    let grid_cell = grid_in[coord_to_index(coord)];

    // If overlay cell is not NOP, use it (DOORs, etc.)
    if (grid_cell.opcode_or_type != TYPE_NOP) {
        return grid_cell;
    }

    return grid_cell;
}

// Check if a cell blocks writes (WALL blocks, MEMBRANE allows, DOOR depends on state)
fn cell_blocks_writes(cell: CellState) -> bool {
    let opcode = opcode_of(cell.opcode_or_type);
    if (opcode == TYPE_WALL) {
        return true;
    }
    if (opcode == TYPE_DOOR && (cell.opcode_or_type & 0x01000000u) == 0u) {
        return true;  // Closed door blocks writes
    }
    return false;
}

// ============================================================
// PASS 1: post_writes
// Active cells read inputs and post write requests to targets.
// ============================================================
@compute @workgroup_size(8, 8, 1)
fn post_writes(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let coord = vec2<i32>(i32(global_id.x), i32(global_id.y));

    if (coord.x >= i32(grid_dims.grid_w) || coord.y >= i32(grid_dims.grid_h)) {
        return;
    }

    let idx = coord_to_index(coord);
    let current = grid_in[idx];

    // Only active cells post writes
    if (current.is_active != 1u) {
        return;
    }

    let opcode = opcode_of(current.opcode_or_type);
    let rel_x = rel_x_of(current.opcode_or_type);
    let rel_y = rel_y_of(current.opcode_or_type);

    // Only compute instructions post writes (control flow doesn't)
    if (opcode == TYPE_LDI || opcode == TYPE_ADD_RI || opcode == TYPE_SUB_RI ||
        opcode == TYPE_ADD_RR || opcode == TYPE_SUB_RR ||
        opcode == TYPE_AND_RI || opcode == TYPE_OR_RI || opcode == TYPE_XOR_RI ||
        opcode == TYPE_SHL_RI || opcode == TYPE_SHR_RI || opcode == TYPE_SRA_RI ||
        opcode == TYPE_SHL_RR || opcode == TYPE_SHR_RR || opcode == TYPE_SRA_RR ||
        opcode == TYPE_AND_RR || opcode == TYPE_OR_RR || opcode == TYPE_XOR_RR ||
        opcode == TYPE_SLT_RR || opcode == TYPE_SLT_RI ||
        opcode == TYPE_SLTU_RR || opcode == TYPE_SLTU_RI ||
        opcode == TYPE_COPY || opcode == TYPE_MOVE ||
        opcode == TYPE_MUL || opcode == TYPE_DIV ||
        opcode == TYPE_LOAD_IND || opcode == TYPE_STORE_IND) {

        let target_coord = coord + vec2<i32>(rel_x, rel_y);
        let target_cell = get_effective_cell(target_coord);

        // Check for WALL or closed DOOR blocking writes
        if (!cell_blocks_writes(target_cell)) {
            let target_idx = coord_to_index(target_coord);
            var req = WriteRequest(1u, opcode, 0u, 0u);

            if (opcode == TYPE_LDI || opcode == TYPE_ADD_RI || opcode == TYPE_SUB_RI ||
                opcode == TYPE_AND_RI || opcode == TYPE_OR_RI || opcode == TYPE_XOR_RI ||
                opcode == TYPE_SHL_RI || opcode == TYPE_SHR_RI || opcode == TYPE_SRA_RI ||
                opcode == TYPE_SLT_RI || opcode == TYPE_SLTU_RI) {
                // Immediate ops: read immediate from cell +1
                let imm_coord = coord + vec2<i32>(1, 0);
                req.imm_value = read_cell(imm_coord).data_buffer;
            } else if (opcode == TYPE_ADD_RR || opcode == TYPE_SUB_RR ||
                       opcode == TYPE_AND_RR || opcode == TYPE_OR_RR || opcode == TYPE_XOR_RR ||
                       opcode == TYPE_SLT_RR || opcode == TYPE_SLTU_RR ||
                       opcode == TYPE_SHL_RR || opcode == TYPE_SHR_RR || opcode == TYPE_SRA_RR) {
                // Register ops: read source register from cell +1
                let src_offset_coord = coord + vec2<i32>(1, 0);
                let src_offsets = read_cell(src_offset_coord).opcode_or_type;
                let src_rel_x = rel_x_of(src_offsets);
                let src_rel_y = rel_y_of(src_offsets);
                let src_coord = coord + vec2<i32>(src_rel_x, src_rel_y);
                req.src_value = read_cell(src_coord).data_buffer;
            } else if (opcode == TYPE_COPY || opcode == TYPE_MOVE) {
                // COPY/MOVE: read source from cell +1
                let src_offset_coord = coord + vec2<i32>(1, 0);
                let src_offsets = read_cell(src_offset_coord).opcode_or_type;
                let src_rel_x = rel_x_of(src_offsets);
                let src_rel_y = rel_y_of(src_offsets);
                let src_coord = coord + vec2<i32>(src_rel_x, src_rel_y);
                req.src_value = read_cell(src_coord).data_buffer;

                if (opcode == TYPE_MOVE) {
                    // MOVE also zeros the source
                    let src_idx = coord_to_index(src_coord);
                    var zero_req = WriteRequest(1u, TYPE_MOVE, 0u, 0u);
                    write_requests[src_idx] = zero_req;
                }
            } else if (opcode == TYPE_MUL || opcode == TYPE_DIV) {
                // MUL/DIV: read source from cell +1
                let src_offset_coord = coord + vec2<i32>(1, 0);
                let src_offsets = read_cell(src_offset_coord).opcode_or_type;
                let src_rel_x = rel_x_of(src_offsets);
                let src_rel_y = rel_y_of(src_offsets);
                let src_coord = coord + vec2<i32>(src_rel_x, src_rel_y);
                req.src_value = read_cell(src_coord).data_buffer;
            } else if (opcode == TYPE_LOAD_IND) {
                // LOAD_IND: read pointer from cell +1, dereference, write to target
                let addr_offset_coord = coord + vec2<i32>(1, 0);
                let addr_offsets = read_cell(addr_offset_coord).opcode_or_type;
                let addr_rel_x = rel_x_of(addr_offsets);
                let addr_rel_y = rel_y_of(addr_offsets);
                let addr_coord = coord + vec2<i32>(addr_rel_x, addr_rel_y);
                let addr_ptr = read_cell(addr_coord).data_buffer;

                // Unpack pointer to coordinate
                let src_coord = unpack_ptr(addr_ptr);
                let src_cell = read_cell(src_coord);

                // Post write request with dereferenced value
                req.src_value = src_cell.data_buffer;
            } else if (opcode == TYPE_STORE_IND) {
                // STORE_IND: read pointer from cell +1, value from cell +2, write to deref'd address
                let addr_offset_coord = coord + vec2<i32>(1, 0);
                let addr_offsets = read_cell(addr_offset_coord).opcode_or_type;
                let addr_rel_x = rel_x_of(addr_offsets);
                let addr_rel_y = rel_y_of(addr_offsets);
                let addr_coord = coord + vec2<i32>(addr_rel_x, addr_rel_y);
                let addr_ptr = read_cell(addr_coord).data_buffer;

                // Unpack pointer to coordinate
                let src_offset_coord = coord + vec2<i32>(2, 0);
                let src_offsets = read_cell(src_offset_coord).opcode_or_type;
                let src_rel_x = rel_x_of(src_offsets);
                let src_rel_y = rel_y_of(src_offsets);
                let src_coord = coord + vec2<i32>(src_rel_x, src_rel_y);
                let src_value = read_cell(src_coord).data_buffer;

                // Target is the dereferenced address
                let store_coord = unpack_ptr(addr_ptr);

                // Bounds-check the dynamic pointer and respect WALL/closed-DOOR,
                // same as the static write path. Out-of-range or blocked = dropped store.
                if (store_coord.x >= 0 && store_coord.y >= 0 &&
                    u32(store_coord.x) < grid_dims.grid_w && u32(store_coord.y) < grid_dims.grid_h &&
                    !cell_blocks_writes(get_effective_cell(store_coord))) {
                    let store_idx = coord_to_index(store_coord);
                    let store_req = WriteRequest(1u, TYPE_STORE_IND, src_value, 0u);
                    write_requests[store_idx] = store_req;
                }

                // Don't post to the default target (rel_x, rel_y) - we already wrote
                return;
            }

            write_requests[target_idx] = req;
        }
    } else if (opcode == TYPE_JZ || opcode == TYPE_JMP) {
        // Jump: deliver the token to the target via a token-grant write request.
        // Layout (geoasm_assembler.py): the opcode cell packs the offset to the
        // condition register (JZ only); cells +1/+2 hold the absolute target
        // x/y in their opcode_or_type slot.
        var taken = true;
        if (opcode == TYPE_JZ) {
            let cond_coord = coord + vec2<i32>(rel_x, rel_y);
            taken = (read_cell(cond_coord).data_buffer == 0u);
        }

        if (taken) {
            let tx = i32(read_cell(coord + vec2<i32>(1, 0)).opcode_or_type);
            let ty = i32(read_cell(coord + vec2<i32>(2, 0)).opcode_or_type);
            let jump_coord = vec2<i32>(tx, ty);

            if (jump_coord.x >= 0 && jump_coord.y >= 0 &&
                u32(jump_coord.x) < grid_dims.grid_w && u32(jump_coord.y) < grid_dims.grid_h &&
                !cell_blocks_writes(get_effective_cell(jump_coord))) {
                let grant_req = WriteRequest(1u, opcode, 0u, 0u);
                write_requests[coord_to_index(jump_coord)] = grant_req;
            }
        }
    } else if (opcode == TYPE_JMP_IND) {
        // JMP_IND: read packed coordinate from target register, jump there.
        // Layout: opcode cell (offsets to register) + companion cell (alignment).
        // Register holds: (y << 16) | (x & 0xFFFF)
        let target_reg_coord = coord + vec2<i32>(rel_x, rel_y);
        let packed_coord = read_cell(target_reg_coord).data_buffer;
        let jump_coord = unpack_ptr(packed_coord);

        if (jump_coord.x >= 0 && jump_coord.y >= 0 &&
            u32(jump_coord.x) < grid_dims.grid_w && u32(jump_coord.y) < grid_dims.grid_h &&
            !cell_blocks_writes(get_effective_cell(jump_coord))) {
            let grant_req = WriteRequest(1u, opcode, 0u, 0u);
            write_requests[coord_to_index(jump_coord)] = grant_req;
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

    if (coord.x >= i32(grid_dims.grid_w) || coord.y >= i32(grid_dims.grid_h)) {
        return;
    }

    let idx = coord_to_index(coord);
    let current = grid_in[idx];
    var next = current;
    next.executing = 0u;

    let opcode = opcode_of(current.opcode_or_type);
    let rel_x = rel_x_of(current.opcode_or_type);
    let rel_y = rel_y_of(current.opcode_or_type);

    // === APPLY WRITES (read from buffer) ===
    var token_granted = false;
    let req = write_requests[idx];
    if (req.valid == 1u) {
        if (req.opcode == TYPE_LDI) {
            next.data_buffer = req.imm_value;
        } else if (req.opcode == TYPE_ADD_RI) {
            next.data_buffer = current.data_buffer + req.imm_value;
        } else if (req.opcode == TYPE_SUB_RI) {
            next.data_buffer = current.data_buffer - req.imm_value;
        } else if (req.opcode == TYPE_ADD_RR) {
            next.data_buffer = current.data_buffer + req.src_value;
        } else if (req.opcode == TYPE_SUB_RR) {
            next.data_buffer = current.data_buffer - req.src_value;
        } else if (req.opcode == TYPE_COPY) {
            next.data_buffer = req.src_value;
        } else if (req.opcode == TYPE_MOVE) {
            next.data_buffer = req.src_value;
        } else if (req.opcode == TYPE_SWAP) {
            next.data_buffer = req.src_value;
        } else if (req.opcode == TYPE_MUL) {
            next.data_buffer = current.data_buffer * req.src_value;
        } else if (req.opcode == TYPE_DIV) {
            if (req.src_value != 0u) {
                next.data_buffer = current.data_buffer / req.src_value;
            }
        } else if (req.opcode == TYPE_AND_RI) {
            next.data_buffer = current.data_buffer & req.imm_value;
        } else if (req.opcode == TYPE_OR_RI) {
            next.data_buffer = current.data_buffer | req.imm_value;
        } else if (req.opcode == TYPE_XOR_RI) {
            next.data_buffer = current.data_buffer ^ req.imm_value;
        } else if (req.opcode == TYPE_SHL_RI) {
            next.data_buffer = current.data_buffer << (req.imm_value & 0x1Fu);
        } else if (req.opcode == TYPE_SHR_RI) {
            next.data_buffer = current.data_buffer >> (req.imm_value & 0x1Fu);
        } else if (req.opcode == TYPE_SRA_RI) {
            // Arithmetic right shift by immediate. Native i32 >> is
            // arithmetic in WGSL and handles shift-by-zero correctly
            // (the manual sign-fill version OR'd all-ones on shift 0).
            next.data_buffer = u32(i32(current.data_buffer) >> (req.imm_value & 0x1Fu));
        } else if (req.opcode == TYPE_SHL_RR) {
            // Shift left by register amount
            next.data_buffer = current.data_buffer << (req.src_value & 0x1Fu);
        } else if (req.opcode == TYPE_SHR_RR) {
            // Shift right logical by register amount
            next.data_buffer = current.data_buffer >> (req.src_value & 0x1Fu);
        } else if (req.opcode == TYPE_SRA_RR) {
            // Arithmetic right shift by register amount (native i32 >>)
            next.data_buffer = u32(i32(current.data_buffer) >> (req.src_value & 0x1Fu));
        } else if (req.opcode == TYPE_AND_RR) {
            next.data_buffer = current.data_buffer & req.src_value;
        } else if (req.opcode == TYPE_OR_RR) {
            next.data_buffer = current.data_buffer | req.src_value;
        } else if (req.opcode == TYPE_XOR_RR) {
            next.data_buffer = current.data_buffer ^ req.src_value;
        } else if (req.opcode == TYPE_SLT_RR) {
            // Signed comparison
            let a = i32(current.data_buffer);
            let b = i32(req.src_value);
            next.data_buffer = select(0u, 1u, a < b);
        } else if (req.opcode == TYPE_SLT_RI) {
            // Signed comparison with immediate
            let a = i32(current.data_buffer);
            let b = i32(req.imm_value);
            next.data_buffer = select(0u, 1u, a < b);
        } else if (req.opcode == TYPE_SLTU_RR) {
            // Unsigned comparison
            next.data_buffer = select(0u, 1u, current.data_buffer < req.src_value);
        } else if (req.opcode == TYPE_SLTU_RI) {
            // Unsigned comparison with immediate
            next.data_buffer = select(0u, 1u, current.data_buffer < req.imm_value);
        } else if (req.opcode == TYPE_LOAD_IND) {
            // LOAD_IND: dereferenced value already in src_value
            next.data_buffer = req.src_value;
        } else if (req.opcode == TYPE_STORE_IND) {
            // STORE_IND: this cell is the dynamic store target; apply the value
            next.data_buffer = req.src_value;
        } else if (req.opcode == TYPE_JZ || req.opcode == TYPE_JMP || req.opcode == TYPE_JMP_IND) {
            // Token grant from a taken jump — activates this cell, no data write
            token_granted = true;
        }
    }

    // Clear write request for this cell
    write_requests[idx].valid = 0u;

    // === TOKEN PROPAGATION ===
    next.is_active = 0u;

    // PASS 1: If we have token, compute where we're forwarding it
    var my_forward_target = vec2<i32>(-999, -999);
    if (current.is_active == 1u) {
        if (opcode == TYPE_HALT) {
            my_forward_target = vec2<i32>(-999, -999);
        } else if (opcode == TYPE_JMP || opcode == TYPE_JMP_IND ||
                   (opcode == TYPE_JZ && read_cell(coord + vec2<i32>(rel_x, rel_y)).data_buffer == 0u)) {
            // Taken jump: the token was handed to the jump target via a
            // write-request grant in post_writes; nothing to forward here.
            my_forward_target = vec2<i32>(-999, -999);
        } else {
            var target_coord = coord + vec2<i32>(1, 0);

            if (opcode == TYPE_LDI || opcode == TYPE_ADD_RI || opcode == TYPE_SUB_RI ||
                opcode == TYPE_ADD_RR || opcode == TYPE_SUB_RR || opcode == TYPE_COPY ||
                opcode == TYPE_MOVE || opcode == TYPE_MUL || opcode == TYPE_DIV ||
                opcode == TYPE_AND_RI || opcode == TYPE_OR_RI || opcode == TYPE_XOR_RI ||
                opcode == TYPE_SHL_RI || opcode == TYPE_SHR_RI || opcode == TYPE_SRA_RI ||
                opcode == TYPE_SHL_RR || opcode == TYPE_SHR_RR || opcode == TYPE_SRA_RR ||
                opcode == TYPE_AND_RR || opcode == TYPE_OR_RR || opcode == TYPE_XOR_RR ||
                opcode == TYPE_SLT_RR || opcode == TYPE_SLT_RI ||
                opcode == TYPE_SLTU_RR || opcode == TYPE_SLTU_RI ||
                opcode == TYPE_LOAD_IND) {
                target_coord.x = coord.x + 2;
            } else if (opcode == TYPE_JZ || opcode == TYPE_SWAP || opcode == TYPE_STORE_IND) {
                // JZ here = not taken (fall-through past tx/ty cells)
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

                // Taken jumps hand their token to the jump target via a grant,
                // never to a right neighbor. Mirror the forward-pass rules.
                if (left_opcode == TYPE_JMP || left_opcode == TYPE_JMP_IND) {
                    continue;
                }
                if (left_opcode == TYPE_JZ) {
                    let left_rel = vec2<i32>(rel_x_of(left_cell.opcode_or_type), rel_y_of(left_cell.opcode_or_type));
                    if (read_cell(left_neighbor + left_rel).data_buffer == 0u) {
                        continue;  // taken — no fall-through
                    }
                }

                var left_forward_target = vec2<i32>(-999, -999);

                if (left_opcode == TYPE_HALT) {
                    left_forward_target = vec2<i32>(-999, -999);
                } else {
                    var left_target_coord = left_neighbor + vec2<i32>(1, 0);

                    if (left_opcode == TYPE_LDI || left_opcode == TYPE_ADD_RI || left_opcode == TYPE_SUB_RI ||
                        left_opcode == TYPE_ADD_RR || left_opcode == TYPE_SUB_RR || left_opcode == TYPE_COPY ||
                        left_opcode == TYPE_MOVE || left_opcode == TYPE_MUL || left_opcode == TYPE_DIV ||
                        left_opcode == TYPE_AND_RI || left_opcode == TYPE_OR_RI || left_opcode == TYPE_XOR_RI ||
                        left_opcode == TYPE_SHL_RI || left_opcode == TYPE_SHR_RI || left_opcode == TYPE_SRA_RI ||
                        left_opcode == TYPE_SHL_RR || left_opcode == TYPE_SHR_RR || left_opcode == TYPE_SRA_RR ||
                        left_opcode == TYPE_AND_RR || left_opcode == TYPE_OR_RR || left_opcode == TYPE_XOR_RR ||
                        left_opcode == TYPE_SLT_RR || left_opcode == TYPE_SLT_RI ||
                        left_opcode == TYPE_SLTU_RR || left_opcode == TYPE_SLTU_RI ||
                        left_opcode == TYPE_LOAD_IND) {
                        left_target_coord.x = left_neighbor.x + 2;
                    } else if (left_opcode == TYPE_JZ || left_opcode == TYPE_SWAP || left_opcode == TYPE_STORE_IND) {
                        left_target_coord.x = left_neighbor.x + 3;
                    }

                    let left_target_cell = get_effective_cell(left_target_coord);
                    let is_door_closed = (left_target_cell.opcode_or_type == TYPE_DOOR && (left_target_cell.opcode_or_type & 0x01000000u) == 0u);
                    let left_target_inert = (left_target_cell.opcode_or_type == TYPE_WALL ||
                                            left_target_cell.opcode_or_type == TYPE_MEMBRANE ||
                                            is_door_closed);

                    if (left_target_inert) {
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

    // Apply token grant from a taken jump (posted in post_writes)
    if (token_granted) {
        next.is_active = 1u;
    }

    // === MARK EXECUTING CELLS ===
    if (next.is_active == 1u) {
        next.executing = 1u;
    }

    grid_out[idx] = next;
}