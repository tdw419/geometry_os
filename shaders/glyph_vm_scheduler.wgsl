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

        // BNE - Branch if not equal: BNE r1, r2, offset
        // Note: Compiler emits BNE as [10, 1, r1, r2] followed by [offset]
        case 10u: {
            let offset = mem_read((pc + 1u) * 4u);
            if ((*vm).regs[p1] != (*vm).regs[p2]) {
                // offset is signed, but we store it as u32
                // We'll treat it as i32 for the jump
                let signed_offset = i32(offset);
                let new_pc = i32(pc) + signed_offset;
                (*vm).pc = u32(new_pc);
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

        // YIELD - Yield execution
        case 227u: {
            (*vm).state = VM_WAITING;
            return 2u;
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
