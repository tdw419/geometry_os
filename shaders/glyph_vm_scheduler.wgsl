/// Glyph VM Scheduler - Multi-VM Compute Shader
///
/// Reads glyph instructions from RAM texture (binding 0).
/// Each pixel is one instruction: R=opcode, G=stratum, B=p1, A=p2
///
/// Bindings (must match daemon):
/// 0: RAM texture (rgba8uint, read_write) - Glyph program memory via Hilbert curve
/// 1: VM states array (storage, read_write) - 8 VmState structs
/// 2: Scheduler state (storage, read_write)
/// 3: Message queue (storage, read_write)
/// 4: Event queue header (storage, read_only)
/// 5: Event queue (storage, read_only)

const MAX_VMS: u32 = 8u;
const CYCLES_PER_FRAME: u32 = 1024u;

// VM state constants
const VM_INACTIVE: u32 = 0u;
const VM_RUNNING: u32 = 1u;
const VM_HALTED: u32 = 2u;
const VM_WAITING: u32 = 3u;
const VM_FAULT: u32 = 0xFFu;

// IPC message queue constants
const MSGQ_BASE: u32 = 0x00E00000u;
const MSGQ_MAX_DATA: u32 = 16u;
const MSGQ_DATA_BASE: u32 = MSGQ_BASE + MAX_VMS * 2u;
const MSG_HAS_MESSAGE: u32 = 1u;
const MSG_WAS_READ: u32 = 2u;

// Screen display region constants (must match lib.rs)
const SCREEN_BASE: u32 = 0x00F30000u;
const SCREEN_SIZE: u32 = 256u;

// Issue queue constants (must match lib.rs)
const ISSUEQ_BASE: u32 = 0x00E30000u;
const ISSUEQ_HEADER_SIZE: u32 = 4u;
const ISSUEQ_CAPACITY: u32 = 64u;
const ISSUEQ_SLOT_SIZE: u32 = 32u;
const ISSUEQ_SLOTS_BASE: u32 = ISSUEQ_BASE + ISSUEQ_HEADER_SIZE;
const ISSUE_STATUS_TODO: u32 = 0u;
const ISSUE_STATUS_IN_PROGRESS: u32 = 1u;
const ISSUE_STATUS_DONE: u32 = 2u;

struct VmState {
    regs: array<u32, 128>,    // 128 general-purpose registers (512 bytes)
    pc: u32,                   // Program counter (Hilbert pixel index) - offset 512
    halted: u32,               // Halted flag - offset 516
    stratum: u32,              // Current stratum - offset 520
    cycles: u32,               // Cycle counter - offset 524
    stack_ptr: u32,            // Stack pointer - offset 528
    vm_id: u32,                // VM ID - offset 532
    state: u32,                // VM state (RUNNING, HALTED, etc.) - offset 536
    parent_id: u32,            // Parent VM ID - offset 540
    entry_point: u32,          // Original entry point - offset 544
    base_addr: u32,            // Memory base address - offset 548
    bound_addr: u32,           // Memory bound address - offset 552
    eap_coord: u32,            // EAP mission context - offset 556
    generation: u32,           // VM generation - offset 560
    attention_mask: u32,       // AI focus mask / film strip frame_ptr - offset 564
    _pad: array<u32, 2>,       // _pad[0]=frame_count, _pad[1]=reserved - offset 568
    stack: array<u32, 64>,     // Call stack (256 bytes) - offset 576
    // Total: 576 + 256 = 832 bytes
}

struct SchedulerState {
    active_count: u32,
    frame: u32,
    spawn_count: u32,
    padding: u32,
}

@group(0) @binding(0) var ram_texture: texture_storage_2d<rgba8uint, read_write>;
@group(0) @binding(1) var<storage, read_write> vm_states: array<VmState>;
@group(0) @binding(2) var<storage, read_write> scheduler: SchedulerState;
@group(0) @binding(3) var<storage, read_write> messages: array<atomic<u32>>;
@group(0) @binding(4) var<storage, read> event_header: atomic<u32>;
@group(0) @binding(5) var<storage, read> event_queue: array<atomic<u32>>;

// Frame transition trace buffer (binding 6).
// Each FRAME opcode or HALT auto-advance writes one entry atomically.
// The daemon reads this back after dispatch to reconstruct the full
// transition path (since the GPU runs many cycles per dispatch).
struct GpuFrameTrace {
    vm_id: u32,
    from_frame: u32,
    to_frame: u32,
    pc_at_transition: u32,
    cause: u32,  // 0 = auto_advance, 1 = frame_opcode
}

const MAX_FRAME_TRACES: u32 = 256u;

@group(0) @binding(6) var<storage, read_write> frame_trace_buf: array<u32>;
@group(0) @binding(7) var<storage, read_write> frame_trace_cursor: atomic<u32>;

fn record_frame_trace(vm_id: u32, from_frame: u32, to_frame: u32, pc: u32, cause: u32) {
    let slot = atomicAdd(&frame_trace_cursor, 1u);
    if (slot < MAX_FRAME_TRACES) {
        let base = slot * 5u;
        frame_trace_buf[base + 0u] = vm_id;
        frame_trace_buf[base + 1u] = from_frame;
        frame_trace_buf[base + 2u] = to_frame;
        frame_trace_buf[base + 3u] = pc;
        frame_trace_buf[base + 4u] = cause;
    }
}

/// Convert Hilbert linear index to 2D coordinates
fn hilbert_d2xy(d: u32) -> vec2<u32> {
    var x = 0u;
    var y = 0u;
    var t = d;
    var s = 1u;

    while (s < 4096u) {
        let rx = (t >> 1u) & 1u;
        let ry = (t ^ rx) & 1u;

        if (ry == 0u) {
            if (rx == 1u) {
                x = s - 1u - x;
                y = s - 1u - y;
            }
            let tmp = x;
            x = y;
            y = tmp;
        }

        x += s * rx;
        y += s * ry;
        t >>= 2u;
        s <<= 1u;
    }

    return vec2<u32>(x, y);
}

/// Read a glyph instruction from RAM texture at Hilbert index
fn read_glyph(d: u32) -> vec4<u32> {
    let pos = hilbert_d2xy(d);
    return textureLoad(ram_texture, pos);
}

/// Write a glyph instruction to RAM texture at Hilbert index
fn write_glyph(d: u32, value: vec4<u32>) {
    let pos = hilbert_d2xy(d);
    textureStore(ram_texture, pos, value);
}

/// Read a 32-bit word from memory (addressed in bytes, mapped via Hilbert)
fn mem_read(addr: u32) -> u32 {
    let pixel_idx = addr / 4u;
    let glyph = read_glyph(pixel_idx);
    // RGBA as little-endian u32
    return glyph.r | (glyph.g << 8u) | (glyph.b << 16u) | (glyph.a << 24u);
}

/// Write a 32-bit word to memory (addressed in bytes, mapped via Hilbert)
fn mem_write(addr: u32, value: u32) {
    let pixel_idx = addr / 4u;
    let glyph = vec4<u32>(
        value & 0xFFu,
        (value >> 8u) & 0xFFu,
        (value >> 16u) & 0xFFu,
        (value >> 24u) & 0xFFu,
    );
    write_glyph(pixel_idx, glyph);
}

/// Execute one instruction for a VM
fn execute_instruction(vm: ptr<function, VmState>) -> u32 {
    let pc = (*vm).pc;
    let glyph = read_glyph(pc);

    let opcode = glyph.r;
    let stratum = glyph.g;
    let p1 = glyph.b; // Usually rd (destination register)
    let p2 = glyph.a; // Usually rs or immediate
    
    // Some instructions use a second word for immediate or extra params
    // We'll read it lazily if needed
    
    // Opcode dispatch (Aligned with SyntheticVram / geos_ascii_compiler)
    switch (opcode) {
        // NOP
        case 0u: { }

        // LDI - Load immediate: LDI rd, imm
        // Note: Compiler emits LDI as [1, 0, rd, 0] followed by [imm]
        case 1u: {
            let imm = mem_read((pc + 1u) * 4u);
            (*vm).regs[p1] = imm;
            (*vm).pc = pc + 1u; // Consume immediate word
        }

        // MOV - Move register: MOV rd, rs
        case 2u: {
            (*vm).regs[p1] = (*vm).regs[p2];
        }

        // LD - Load from memory: LD rd, [rs] (pixel-addressed)
        // rs contains a Hilbert pixel index, reads the 32-bit value at that pixel
        case 3u: {
            let pixel_idx = (*vm).regs[p2];
            let glyph = read_glyph(pixel_idx);
            (*vm).regs[p1] = glyph.r | (glyph.g << 8u) | (glyph.b << 16u) | (glyph.a << 24u);
        }

        // ST - Store to memory: ST [rd], rs (pixel-addressed)
        // rd contains a Hilbert pixel index, writes the 32-bit value from rs
        case 4u: {
            let pixel_idx = (*vm).regs[p1];
            let value = (*vm).regs[p2];
            write_glyph(pixel_idx, vec4<u32>(
                value & 0xFFu,
                (value >> 8u) & 0xFFu,
                (value >> 16u) & 0xFFu,
                (value >> 24u) & 0xFFu,
            ));
        }

        // ADD - Add register: ADD rd, rs
        case 5u: {
            (*vm).regs[p1] = (*vm).regs[p1] + (*vm).regs[p2];
        }

        // SUB - Subtract register: SUB rd, rs
        case 6u: {
            (*vm).regs[p1] = (*vm).regs[p1] - (*vm).regs[p2];
        }

        // MUL - Multiply register: MUL rd, rs
        case 7u: {
            (*vm).regs[p1] = (*vm).regs[p1] * (*vm).regs[p2];
        }

        // DIV - Divide register: DIV rd, rs (unsigned, divide-by-zero = 0)
        case 8u: {
            if ((*vm).regs[p2] != 0u) {
                (*vm).regs[p1] = (*vm).regs[p1] / (*vm).regs[p2];
            } else {
                (*vm).regs[p1] = 0u;
            }
        }

        // JMP - Unconditional jump: JMP offset
        // [9, 0, 0, 0] followed by [offset as i32]
        case 9u: {
            let offset = mem_read((pc + 1u) * 4u);
            let signed_offset = i32(offset);
            let new_pc = i32(pc) + signed_offset;
            (*vm).pc = u32(new_pc);
            return 1u; // Jumped
        }

        // BRANCH - Conditional branch: BRANCH cond, r1, r2, offset
        // cond (stratum): 0=BEQ, 1=BNE, 2=BLT(signed), 3=BGE(signed), 4=BLTU(unsigned), 5=BGEU(unsigned)
        case 10u: {
            let offset = mem_read((pc + 1u) * 4u);
            let a = (*vm).regs[p1];
            let b = (*vm).regs[p2];
            let take = false
                || (stratum == 0u && a == b)                                    // BEQ
                || (stratum == 1u && a != b)                                   // BNE
                || (stratum == 2u && bitcast<i32>(a) < bitcast<i32>(b))       // BLT (signed)
                || (stratum == 3u && bitcast<i32>(a) >= bitcast<i32>(b))      // BGE (signed)
                || (stratum == 4u && a < b)                                    // BLTU (unsigned)
                || (stratum == 5u && a >= b)                                   // BGEU (unsigned)
                || (stratum > 5u && a != b);                                   // fallback: BNE
            if (take) {
                let signed_offset = bitcast<i32>(offset);
                let new_pc = bitcast<i32>(pc) + signed_offset;
                (*vm).pc = bitcast<u32>(new_pc);
                return 1u; // Jumped
            }
            (*vm).pc = pc + 1u; // Skip offset word
        }

        // CALL - Call subroutine: CALL addr
        case 11u: {
            let sp = (*vm).stack_ptr;
            if (sp < 64u) {
                (*vm).stack[sp] = pc + 2u;  // Return past the DATA word
                (*vm).stack_ptr = sp + 1u;
                (*vm).pc = p1; // p1 is target address in some formats, or read from next word
                // For ASCII compiler, CALL is [11, 0, 0, 0] followed by [addr]
                let addr = mem_read((pc + 1u) * 4u);
                (*vm).pc = addr;
                return 1u;
            }
        }

        // RET - Return from subroutine
        case 12u: {
            let sp = (*vm).stack_ptr;
            if (sp > 0u) {
                (*vm).stack_ptr = sp - 1u;
                (*vm).pc = (*vm).stack[sp - 1u];
                return 1u;
            }
        }

        // HALT - or projector auto-advance if film strip has more frames
        case 13u: {
            let frame_count = (*vm)._pad[0];
            let frame_ptr = (*vm).attention_mask;
            if (frame_count > 0u && frame_ptr < frame_count - 1u) {
                let next_frame = frame_ptr + 1u;
                record_frame_trace((*vm).vm_id, frame_ptr, next_frame, pc, 0u);  // 0 = auto_advance
                (*vm).attention_mask = next_frame;
                let frame_size: u32 = 65536u; // 256 * 256
                (*vm).pc = (*vm).entry_point + next_frame * frame_size;
                // Stay RUNNING -- don't halt
            } else {
                (*vm).halted = 1u;
                (*vm).state = VM_HALTED;
            }
        }

        // ENTRY - Read entry_point into register: ENTRY rd
        case 14u: {
            (*vm).regs[p1] = (*vm).entry_point;
        }

        // CHAR - Blit character from font atlas to texture
        // CHAR r_ascii, r_dest
        // r_ascii (p1) = ASCII value of character
        // r_dest (p2) = Hilbert address where character bitmap rows will be written
        // Reads 8 rows from FONT_BASE + (ascii * 8) and writes them starting at r_dest.
        // After execution, r_dest contains the 8 row bitmasks of the character.
        // The caller can then read them back for rendering.
        case 15u: {
            let ascii_val = (*vm).regs[p1];
            let dest_addr = (*vm).regs[p2];
            let font_base = 0x00F00000u; // Must match font_atlas::FONT_BASE
            for (var row = 0u; row < 8u; row++) {
                let src_addr = font_base + ascii_val * 8u + row;
                let row_data = read_glyph(src_addr);
                // Store the row bitmask as a single u32 at dest_addr + row
                write_glyph(dest_addr + row, row_data);
            }
        }

        // BLIT - Copy N pixels from source to destination
        // BLIT r_src, r_dst  (followed by DATA count)
        // Copies `count` pixels from Hilbert address r_src to r_dst.
        case 16u: {
            let src = (*vm).regs[p1];
            let dst = (*vm).regs[p2];
            let count = mem_read((pc + 1u) * 4u);
            for (var i = 0u; i < count; i++) {
                let pixel = read_glyph(src + i);
                write_glyph(dst + i, pixel);
            }
            (*vm).pc = pc + 1u; // Consume count word
        }

        // SEND - Send message: SEND r_target_vm, r_data_addr (followed by DATA length)
        case 17u: {
            let target_vm = (*vm).regs[p1];
            let data_addr = (*vm).regs[p2];
            let length = mem_read((pc + 1u) * 4u);
            if (target_vm < MAX_VMS && length <= MSGQ_MAX_DATA) {
                let dest_base = MSGQ_DATA_BASE + target_vm * MSGQ_MAX_DATA;
                for (var i = 0u; i < length; i++) {
                    let pixel = read_glyph(data_addr + i);
                    write_glyph(dest_base + i, pixel);
                }
                write_glyph(MSGQ_BASE + target_vm, vec4<u32>(MSG_HAS_MESSAGE, (*vm).vm_id, length, 0u));
            }
            (*vm).pc = pc + 1u;
        }

        // RECV - Receive message: RECV r_dest_addr, r_status
        case 18u: {
            let dest_addr = (*vm).regs[p1];
            let header = read_glyph(MSGQ_BASE + (*vm).vm_id);
            if ((header.r & MSG_HAS_MESSAGE) != 0u) {
                let length = header.b;
                let src_base = MSGQ_DATA_BASE + (*vm).vm_id * MSGQ_MAX_DATA;
                for (var i = 0u; i < length; i++) {
                    let pixel = read_glyph(src_base + i);
                    write_glyph(dest_addr + i, pixel);
                }
                write_glyph(MSGQ_BASE + (*vm).vm_id, vec4<u32>(MSG_WAS_READ, header.g, header.b, 0u));
                (*vm).regs[p2] = 1u;
            } else {
                (*vm).regs[p2] = 0u;
            }
        }

        // SHR - Shift right: SHR rd, rs
        case 19u: {
            (*vm).regs[p1] = (*vm).regs[p1] >> (*vm).regs[p2];
        }

        // OR - Bitwise OR: OR rd, rs
        case 20u: {
            (*vm).regs[p1] = (*vm).regs[p1] | (*vm).regs[p2];
        }

        // CHAR_AT - Blit from arbitrary atlas: CHAR_AT r_ascii, r_target (atlas_base in stratum field)
        case 21u: {
            let ascii_val = (*vm).regs[p1];
            let dest_addr = (*vm).regs[p2];
            let atlas_base = (*vm).regs[stratum];
            for (var row = 0u; row < 8u; row++) {
                let src_addr = atlas_base + ascii_val * 8u + row;
                let row_data = read_glyph(src_addr);
                write_glyph(dest_addr + row, row_data);
            }
        }

        // GLYPH_DEF - Define live glyph: GLYPH_DEF r_charcode, r_bitmap_addr
        case 22u: {
            let charcode = (*vm).regs[p1];
            let bitmap_addr = (*vm).regs[p2];
            if (charcode >= 128u) {
                let live_base: u32 = 0x00F20000u;
                let offset = (charcode - 128u) * 8u;
                for (var row = 0u; row < 8u; row++) {
                    let row_data = read_glyph(bitmap_addr + row);
                    write_glyph(live_base + offset + row, row_data);
                }
            }
        }

        // PSET - Write pixel to screen: PSET r_x, r_y, r_color
        // Encoding: glyph(23, r_color, r_x, r_y)
        // stratum = color register, p1 = x register, p2 = y register
        case 23u: {
            let x = (*vm).regs[p1];
            let y = (*vm).regs[p2];
            let color = (*vm).regs[stratum];
            if (x < SCREEN_SIZE && y < SCREEN_SIZE) {
                let addr = SCREEN_BASE + y * SCREEN_SIZE + x;
                mem_write(addr * 4u, color);
            }
        }

        // PGET - Read pixel from screen: PGET r_dst, r_x, r_y
        // Encoding: glyph(24, r_y, r_dst, r_x)
        // stratum = y register, p1 = dst register, p2 = x register
        case 24u: {
            let x = (*vm).regs[p2];
            let y = (*vm).regs[stratum];
            if (x < SCREEN_SIZE && y < SCREEN_SIZE) {
                let addr = SCREEN_BASE + y * SCREEN_SIZE + x;
                (*vm).regs[p1] = mem_read(addr * 4u);
            } else {
                (*vm).regs[p1] = 0u;
            }
        }

        // AND - Bitwise AND: AND rd, rs (rd &= rs)
        case 25u: {
            (*vm).regs[p1] = (*vm).regs[p1] & (*vm).regs[p2];
        }

        // SHL - Shift left: SHL rd, rs (rd <<= rs)
        case 26u: {
            let shift = (*vm).regs[p2];
            (*vm).regs[p1] = (*vm).regs[p1] << shift;
        }

        // FRAME - Film strip frame jump: FRAME r_target
        // Sets frame_ptr (attention_mask) to r_target and jumps PC to start of that frame.
        // Each frame = 65536 pixels (256*256). Frame base = entry_point + frame_ptr * 65536.
        case 27u: {
            let target_frame = (*vm).regs[p1];
            let frame_count = (*vm)._pad[0];
            if (frame_count == 0u) {
                (*vm).halted = 1u;
                (*vm).state = VM_FAULT;
            } else if (target_frame >= frame_count) {
                (*vm).halted = 1u;
                (*vm).state = VM_FAULT;
            } else {
                record_frame_trace((*vm).vm_id, (*vm).attention_mask, target_frame, pc, 1u);  // 1 = frame_opcode
                (*vm).attention_mask = target_frame;
                let frame_size: u32 = 65536u; // 256 * 256
                (*vm).pc = (*vm).entry_point + target_frame * frame_size;
                return 1u; // Jumped
            }
        }

        // XOR - Bitwise XOR: XOR rd, rs (rd ^= rs)
        case 29u: {
            (*vm).regs[p1] = (*vm).regs[p1] ^ (*vm).regs[p2];
        }

        // NOT - Bitwise NOT: NOT rd (rd = !rd)
        case 30u: {
            (*vm).regs[p1] = (*vm).regs[p1] ^ 0xFFFFFFFFu;
        }

        // MOD - Modulo: MOD rd, rs (rd %= rs, div-by-zero = 0)
        case 31u: {
            let divisor = (*vm).regs[p2];
            if (divisor != 0u) {
                (*vm).regs[p1] = (*vm).regs[p1] % divisor;
            } else {
                (*vm).regs[p1] = 0u;
            }
        }

        // LDB - Load byte: LDB rd, [rs] (rd = byte at byte address rs)
        // byte_addr / 4 gives pixel index, byte_addr % 4 selects channel
        case 32u: {
            let byte_addr = (*vm).regs[p2];
            let pixel_idx = byte_addr / 4u;
            let byte_offset = byte_addr % 4u;
            let glyph = read_glyph(pixel_idx);
            // RGBA channels: byte 0=R, 1=G, 2=B, 3=A
            if (byte_offset == 0u) {
                (*vm).regs[p1] = glyph.r;
            } else if (byte_offset == 1u) {
                (*vm).regs[p1] = glyph.g;
            } else if (byte_offset == 2u) {
                (*vm).regs[p1] = glyph.b;
            } else {
                (*vm).regs[p1] = glyph.a;
            }
        }

        // STB - Store byte: STB [rd], rs (store low byte of rs to byte address rd)
        // Read-modify-write: load the pixel, replace one channel, write back
        case 33u: {
            let byte_addr = (*vm).regs[p1];
            let pixel_idx = byte_addr / 4u;
            let byte_offset = byte_addr % 4u;
            let byte_val = (*vm).regs[p2] & 0xFFu;
            let glyph = read_glyph(pixel_idx);
            if (byte_offset == 0u) {
                write_glyph(pixel_idx, vec4<u32>(byte_val, glyph.g, glyph.b, glyph.a));
            } else if (byte_offset == 1u) {
                write_glyph(pixel_idx, vec4<u32>(glyph.r, byte_val, glyph.b, glyph.a));
            } else if (byte_offset == 2u) {
                write_glyph(pixel_idx, vec4<u32>(glyph.r, glyph.g, byte_val, glyph.a));
            } else {
                write_glyph(pixel_idx, vec4<u32>(glyph.r, glyph.g, glyph.b, byte_val));
            }
        }

        // RECTF - Filled rectangle: RECTF r_x, r_y, packed_params
        // Encoding: glyph(34, r_x, r_y, 0) followed by [packed (w<<16|h)]
        // Color from r2 (R_COLOR convention)
        case 34u: {
            let x = (*vm).regs[p1];
            let y = (*vm).regs[p2];
            let data_word = mem_read((*vm).pc * 4u + 4u);
            let w = (data_word >> 16u) & 0xFFFFu;
            let h = data_word & 0xFFFFu;
            let color = (*vm).regs[2u];
            for (var dy = 0u; dy < h; dy = dy + 1u) {
                for (var dx = 0u; dx < w; dx = dx + 1u) {
                    let px = x + dx;
                    let py = y + dy;
                    if (px < SCREEN_SIZE && py < SCREEN_SIZE) {
                        let addr = SCREEN_BASE + py * SCREEN_SIZE + px;
                        mem_write(addr * 4u, color);
                    }
                }
            }
            (*vm).pc = (*vm).pc + 1u;
        }

        // LINE - Bresenham line: LINE r_x0, r_y0, packed_endpoints
        // Encoding: glyph(35, r_x0, r_y0, 0) followed by [packed (x1<<16)|(y1&0xFFFF)]
        // Color from r2 (R_COLOR convention)
        case 35u: {
            let x0_i = i32((*vm).regs[p1]);
            let y0_i = i32((*vm).regs[p2]);
            let data_word = mem_read((*vm).pc * 4u + 4u);
            let x1_i = i32(data_word >> 16u);
            let y1_i = i32(data_word & 0xFFFFu);
            let color = (*vm).regs[2u];
            var dx_b = select(-(x1_i - x0_i), x1_i - x0_i, x0_i < x1_i);
            var dy_b = select(-(y1_i - y0_i), y1_i - y0_i, y0_i < y1_i);
            if (dx_b < 0i) { dx_b = -dx_b; }
            if (dy_b > 0i) { dy_b = -dy_b; }
            var err = dx_b + dy_b;
            var cx = x0_i;
            var cy = y0_i;
            let sx = select(-1i, 1i, x0_i < x1_i);
            let sy = select(-1i, 1i, y0_i < y1_i);
            for (var steps = 0u; steps < 1024u; steps = steps + 1u) {
                let px = u32(cx);
                let py = u32(cy);
                if (px < SCREEN_SIZE && py < SCREEN_SIZE) {
                    let addr = SCREEN_BASE + py * SCREEN_SIZE + px;
                    mem_write(addr * 4u, color);
                }
                if (cx == x1_i && cy == y1_i) { break; }
                let e2 = 2i * err;
                if (e2 >= dy_b) { err = err + dy_b; cx = cx + sx; }
                if (e2 <= dx_b) { err = err + dx_b; cy = cy + sy; }
            }
            (*vm).pc = (*vm).pc + 1u;
        }

        // TEXT_STR - Draw null-terminated string: TEXT_STR r_addr, r_x, r_y
        // Reads a null-terminated string from address in r_addr,
        // renders via font atlas at screen position (r_x, r_y).
        // Color from r2 (R_COLOR convention). Max 64 chars.
        case 36u: {
            let base_addr = (*vm).regs[p1];
            var x_pos = (*vm).regs[p2];
            let y_pos = (*vm).regs[stratum];
            let color = (*vm).regs[2u];
            for (var offset = 0u; offset < 64u; offset = offset + 1u) {
                let ch = mem_read((base_addr + offset) * 4u);
                if (ch == 0u) { break; }
                let ascii = ch & 0xFFu;
                // Blit 8x8 glyph from font atlas at FONT_BASE + ascii * 8
                let FONT_BASE = 0x00F00000u;
                let glyph_base = FONT_BASE + ascii * 8u;
                for (var row = 0u; row < 8u; row = row + 1u) {
                    let font_byte = mem_read((glyph_base + row) * 4u) & 0xFFu;
                    for (var col = 0u; col < 8u; col = col + 1u) {
                        if ((font_byte & (0x80u >> col)) != 0u) {
                            let px = x_pos + col;
                            let py = y_pos + row;
                            if (px < SCREEN_SIZE && py < SCREEN_SIZE) {
                                let addr = SCREEN_BASE + py * SCREEN_SIZE + px;
                                mem_write(addr * 4u, color);
                            }
                        }
                    }
                }
                x_pos = x_pos + 8u;
            }
        }

        // CIRCLEF - Filled circle: CIRCLEF r_cx, r_cy, r_radius
        // Color from r2 (R_COLOR convention)
        case 37u: {
            let cx = i32((*vm).regs[p1]);
            let cy = i32((*vm).regs[p2]);
            let r = i32((*vm).regs[stratum]);
            let color = (*vm).regs[2u];
            if (r > 0i) {
                for (var dy = -r; dy <= r; dy = dy + 1i) {
                    for (var dx = -r; dx <= r; dx = dx + 1i) {
                        if (dx * dx + dy * dy <= r * r) {
                            let px = u32(cx + dx);
                            let py = u32(cy + dy);
                            if (px < SCREEN_SIZE && py < SCREEN_SIZE) {
                                let addr = SCREEN_BASE + py * SCREEN_SIZE + px;
                                mem_write(addr * 4u, color);
                            }
                        }
                    }
                }
            }
        }

        // ── AI-Native Opcodes (Phase 9 / Phase 14) ─────────────────────

        // BRANCH_PROB (220) - Probabilistic branch: BRANCH_PROB r_prob, offset
        // Coin flip: if (prob & 0xFFFF) > hash, branch by offset
        case 220u: {
            let prob = (*vm).regs[p1];
            let offset = mem_read((pc + 1u) * 4u);
            let threshold = prob & 0xFFFFu;
            // Deterministic PRNG from PC for reproducibility
            let hash = (pc * 2654435761u) & 0xFFFFu;
            if (threshold > hash) {
                let signed_offset = bitcast<i32>(offset);
                let new_pc = bitcast<i32>(pc) + signed_offset;
                (*vm).pc = bitcast<u32>(new_pc);
                return 1u; // Jumped
            }
            (*vm).pc = pc + 1u; // Skip offset word
        }

        // CONFIDENCE_MARK (221) - Mark confidence: CONFIDENCE_MARK r_block_id
        // Records confidence score for a code block
        case 221u: {
            let block_id = (*vm).regs[p1];
            let score = (block_id >> 16u) & 0xFFFFu;
            let id = block_id & 0xFFFFu;
            // Write to confidence memory region (must match software VM)
            let conf_addr = 0x00F00000u + id;
            mem_write(conf_addr * 4u, score);
        }

        // ALTERNATE_PATH (222) - Conditional path: ALTERNATE_PATH r_block_id, offset
        // Jump if confidence for block_id is below threshold
        case 222u: {
            let block_id = (*vm).regs[p1];
            let offset = mem_read((pc + 1u) * 4u);
            let id = block_id & 0xFFFFu;
            let threshold = (block_id >> 16u) & 0xFFFFu;
            let conf_addr = 0x00F00000u + id;
            let current_score = mem_read(conf_addr * 4u);
            if (current_score < threshold) {
                let signed_offset = bitcast<i32>(offset);
                let new_pc = bitcast<i32>(pc) + signed_offset;
                (*vm).pc = bitcast<u32>(new_pc);
                return 1u; // Jumped
            }
            (*vm).pc = pc + 1u; // Skip offset word
        }

        // GLYPH_MUTATE (224) - Transform glyph: GLYPH_MUTATE r_target_addr, r_new_opcode
        // Replaces the opcode byte (R channel) of the pixel at r_target_addr
        case 224u: {
            let target_pixel_idx = (*vm).regs[p1];
            let new_opcode = (*vm).regs[p2] & 0xFFu;
            let glyph = read_glyph(target_pixel_idx);
            write_glyph(target_pixel_idx, vec4<u32>(new_opcode, glyph.g, glyph.b, glyph.a));
            (*vm).regs[p1] = 1u; // success
        }

        // SPATIAL_SPAWN (225) - Copy N pixels: SPATIAL_SPAWN r_dest_addr, r_size, r_source_addr
        // Source address is packed in a second pixel (data word)
        case 225u: {
            let dest_addr = (*vm).regs[p1];
            let size = (*vm).regs[stratum]; // size from stratum register index
            let data_word = mem_read((pc + 1u) * 4u);
            let source_addr = (*vm).regs[data_word];
            for (var i = 0u; i < size; i++) {
                let pixel = read_glyph(source_addr + i);
                write_glyph(dest_addr + i, pixel);
            }
            (*vm).pc = pc + 1u; // Consume data word
            (*vm).regs[p1] = size; // return bytes copied
        }

        // SEMANTIC_MERGE (226) - Merge two clusters: SEMANTIC_MERGE r_cluster_a, r_cluster_b, r_dest
        // Dest register is in a second pixel (data word)
        case 226u: {
            let cluster_a = (*vm).regs[p1];
            let cluster_b = (*vm).regs[p2];
            let data_word = mem_read((pc + 1u) * 4u);
            let dest_addr = (*vm).regs[data_word];
            var merged_count = 0u;
            let max_merge = 256u;
            for (var i = 0u; i < max_merge; i++) {
                let pa = read_glyph(cluster_a + i);
                let pb = read_glyph(cluster_b + i);
                // Stop at double-zero
                if (pa.r == 0u && pa.g == 0u && pa.b == 0u && pa.a == 0u
                    && pb.r == 0u && pb.g == 0u && pb.b == 0u && pb.a == 0u) {
                    break;
                }
                // For identical pixels, write as-is. For differing, keep higher opcode
                var merged: vec4<u32>;
                if (pa.r == pb.r && pa.g == pb.g && pa.b == pb.b && pa.a == pb.a) {
                    merged = pa;
                } else if (pa.r >= pb.r) {
                    merged = pa;
                } else {
                    merged = pb;
                }
                write_glyph(dest_addr + i, merged);
                merged_count = merged_count + 1u;
            }
            (*vm).pc = pc + 1u; // Consume data word
            (*vm).regs[p1] = merged_count;
        }

        // SPAWN - Request child VM spawn: SPAWN r_base_addr, r_entry_offset
        // Returns child VM ID in r_base_addr, or 0xFF if no slot available.
        // Deferred: stores spawn params in parent's registers. Rust host
        // reads them after the frame and initializes the child VM.
        case 230u: {
            let child_base = (*vm).regs[p1];
            let child_entry_offset = (*vm).regs[p2];
            // Simple strategy: child = parent_id + 1 (max 7)
            let candidate = (*vm).vm_id + 1u;
            if (candidate < MAX_VMS) {
                (*vm).regs[125] = candidate;
                (*vm).regs[126] = child_base;
                (*vm).regs[127] = child_entry_offset;
                (*vm).regs[p1] = candidate;
            } else {
                (*vm).regs[p1] = 0xFFu;
            }
        }

        // YIELD - Yield execution (cooperative multitasking).
        // Advance PC so next frame resumes at the instruction after YIELD.
        case 227u: {
            (*vm).pc = pc + 1u;
            (*vm).state = VM_WAITING;
            return 2u;
        }

        // ── Issue Queue Opcodes (Phase 14 / GEO-218) ──────────────────

        // ISSUE_CREATE (240): Create a new issue in the queue.
        // Encoding: (240, assignee_id, r_title_addr, r_priority)
        // Reads title from pixel memory at r_title_addr (packed ASCII, null-terminated).
        // Returns: issue_id in r_title_addr register, or 0 on failure (queue full).
        case 240u: {
            let title_addr = (*vm).regs[p1];
            let priority = (*vm).regs[p2];
            let assignee_id = stratum;

            // Read queue header
            let head = mem_read(ISSUEQ_BASE * 4u);
            let tail = mem_read((ISSUEQ_BASE + 1u) * 4u);
            let count = mem_read((ISSUEQ_BASE + 2u) * 4u);

            if (count >= ISSUEQ_CAPACITY) {
                (*vm).regs[p1] = 0u; // queue full
            } else {
                let slot_idx = tail % ISSUEQ_CAPACITY;
                let slot_base = ISSUEQ_SLOTS_BASE + slot_idx * ISSUEQ_SLOT_SIZE;

                // Compute issue_id: tail + 1 (1-indexed, auto-incremented)
                let issue_id = tail + 1u;

                // Write metadata pixel: (status << 24) | (priority << 16) | (assignee_id)
                let issue_meta = (ISSUE_STATUS_TODO << 24u) | ((priority & 0xFFu) << 16u) | (assignee_id & 0xFFFFu);
                mem_write(slot_base * 4u, issue_meta);

                // Write issue_id pixel
                mem_write((slot_base + 1u) * 4u, issue_id);

                // Copy title from title_addr into slot pixels 2-25 (packed ASCII, 4 bytes per pixel)
                for (var i = 0u; i < 24u; i++) {
                    let src_word = mem_read((title_addr + i) * 4u);
                    mem_write((slot_base + 2u + i) * 4u, src_word);
                }

                // Update queue header: increment tail and count
                mem_write((ISSUEQ_BASE + 1u) * 4u, tail + 1u);
                mem_write((ISSUEQ_BASE + 2u) * 4u, count + 1u);
                // Initialize capacity if first issue
                if (count == 0u) {
                    mem_write((ISSUEQ_BASE + 3u) * 4u, ISSUEQ_CAPACITY);
                }

                (*vm).regs[p1] = issue_id;
            }
        }

        // ISSUE_PICK (241): Atomically claim the highest-priority todo issue.
        // Encoding: (241, agent_vm_id, r_out_addr, r_filter)
        // Scans all issues, finds the highest-priority todo issue matching filter,
        // sets its status to IN_PROGRESS and assignee to agent_vm_id.
        // Returns: issue_id in r_out_addr, or 0 if no match.
        // If r_filter == 0, picks any todo issue (highest priority first).
        // Copies issue slot data to r_out_addr (title, metadata, etc.).
        case 241u: {
            let agent_vm_id = stratum;
            let out_addr = (*vm).regs[p1];
            let priority_filter = (*vm).regs[p2];

            let count = mem_read((ISSUEQ_BASE + 2u) * 4u);

            var best_slot_base: u32 = 0u;
            var best_priority: u32 = 0u;
            var best_issue_id: u32 = 0u;
            var found = false;

            for (var i = 0u; i < ISSUEQ_CAPACITY; i++) {
                if (i >= count) {
                    break;
                }
                let slot_base = ISSUEQ_SLOTS_BASE + i * ISSUEQ_SLOT_SIZE;
                let issue_meta = mem_read(slot_base * 4u);
                let status = (issue_meta >> 24u) & 0xFFu;
                let priority = (issue_meta >> 16u) & 0xFFu;

                if (status != ISSUE_STATUS_TODO) {
                    continue;
                }
                if (priority_filter != 0u && priority != priority_filter) {
                    continue;
                }
                if (priority > best_priority) {
                    best_priority = priority;
                    best_slot_base = slot_base;
                    best_issue_id = mem_read((slot_base + 1u) * 4u);
                    found = true;
                }
            }

            if (found) {
                // Claim: set status to IN_PROGRESS and assignee to agent_vm_id
                let issue_meta = mem_read(best_slot_base * 4u);
                let priority = (issue_meta >> 16u) & 0xFFu;
                let new_issue_meta = (ISSUE_STATUS_IN_PROGRESS << 24u)
                    | (priority << 16u)
                    | (agent_vm_id & 0xFFFFu);
                mem_write(best_slot_base * 4u, new_issue_meta);

                // Copy issue data to output region (full slot = 32 pixels)
                for (var i = 0u; i < ISSUEQ_SLOT_SIZE; i++) {
                    let word = mem_read((best_slot_base + i) * 4u);
                    mem_write((out_addr + i) * 4u, word);
                }

                (*vm).regs[p1] = best_issue_id;
            } else {
                (*vm).regs[p1] = 0u; // no matching issue
            }
        }

        // ISSUE_UPDATE (242): Change status of an issue.
        // Encoding: (242, 0, r_issue_id, r_new_status)
        // Scans issues to find matching issue_id, updates status.
        // Returns: 1 in r_issue_id on success, 0 if not found.
        case 242u: {
            let target_id = (*vm).regs[p1];
            let new_status = (*vm).regs[p2];
            let count = mem_read((ISSUEQ_BASE + 2u) * 4u);

            var found = false;
            for (var i = 0u; i < ISSUEQ_CAPACITY; i++) {
                if (i >= count) {
                    break;
                }
                let slot_base = ISSUEQ_SLOTS_BASE + i * ISSUEQ_SLOT_SIZE;
                let issue_id = mem_read((slot_base + 1u) * 4u);
                if (issue_id == target_id) {
                    let issue_meta = mem_read(slot_base * 4u);
                    let priority = (issue_meta >> 16u) & 0xFFu;
                    let assignee = issue_meta & 0xFFFFu;
                    let new_issue_meta = ((new_status & 0xFFu) << 24u) | (priority << 16u) | assignee;
                    mem_write(slot_base * 4u, new_issue_meta);
                    found = true;
                    break;
                }
            }
            (*vm).regs[p1] = select(0u, 1u, found);
        }

        default: {
            // Unknown opcode - skip
        }
    }

    return 0u;  // No jump
}

@compute @workgroup_size(8, 1, 1)
fn main(@builtin(global_invocation_id) gid: vec3<u32>) {
    let vm_id = gid.x;

    if (vm_id >= MAX_VMS) {
        return;
    }

    var vm = vm_states[vm_id];

    // Auto-sandbox: VMs with uninitialized bounds get full user-space access
    if (vm.bound_addr == 0u) {
        vm.base_addr = 0u;
        vm.bound_addr = MSGQ_BASE; // 0x00E00000 -- everything below system area
    }

    // Only execute running VMs
    if (vm.state != VM_RUNNING || vm.halted != 0u) {
        return;
    }

    // Execute up to CYCLES_PER_FRAME instructions
    for (var i = 0u; i < CYCLES_PER_FRAME; i++) {
        if (vm.halted != 0u || vm.state != VM_RUNNING) {
            break;
        }

        let jumped = execute_instruction(&vm);

        // YIELD returns 2 -- exit frame early
        if (jumped == 2u) {
            break;
        }

        // Only increment PC if we didn't jump
        if (jumped == 0u) {
            vm.pc += 1u;
        }

        vm.cycles += 1u;
    }

    // Write back VM state
    vm_states[vm_id] = vm;
}
