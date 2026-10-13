// Glyph VM Scheduler - Multi-Tasking GPU Execution Layer
//
// Runs multiple Glyph VMs in parallel using pre-allocated slots.
// SPATIAL_SPAWN creates new VMs by allocating free slots.
// Time-slicing scheduler ensures fair execution across all active VMs.

// ============================================================================
// CONSTANTS
// ============================================================================

const MAX_VMS: u32 = 8u;           // Maximum concurrent VMs
const MAX_CYCLES_PER_VM: u32 = 64u; // Cycles per VM per frame
const STACK_SIZE: u32 = 64u;        // Stack entries per VM
const REG_COUNT: u32 = 32u;         // General purpose registers
const GRID_SIZE: u32 = 4096u;       // .rts.png dimension

// Event queue constants (must match input_types.rs and event_queue.wgsl)
const EVENT_QUEUE_SIZE: u32 = 1024u;
const EVENT_NONE: u32         = 0u;
const EVENT_MOUSE_MOVE: u32   = 1u;
const EVENT_MOUSE_DOWN: u32   = 2u;
const EVENT_MOUSE_UP: u32     = 3u;
const EVENT_KEY_DOWN: u32     = 4u;
const EVENT_KEY_UP: u32       = 5u;
const EVENT_WINDOW_FOCUS: u32 = 6u;
const EVENT_WINDOW_DRAG: u32  = 7u;

// Opcodes (0-15) - Logic Stratum
const OP_NOP: u32    = 0u;
const OP_ALLOC: u32  = 1u;
const OP_FREE: u32   = 2u;
const OP_LOAD: u32   = 3u;
const OP_STORE: u32  = 4u;
const OP_ADD: u32    = 5u;
const OP_SUB: u32    = 6u;
const OP_MUL: u32    = 7u;
const OP_DIV: u32    = 8u;
const OP_JMP: u32    = 9u;
const OP_BRANCH: u32 = 10u;
const OP_CALL: u32   = 11u;
const OP_RETURN: u32 = 12u;
const OP_HALT: u32   = 13u;
const OP_DATA: u32   = 14u;
const OP_LOOP: u32   = 15u;

// AI-Native / Substrate Opcodes (220-227)
const OP_SPATIAL_SPAWN: u32 = 225u;
const OP_GLYPH_MUTATE: u32  = 226u;
const OP_YIELD: u32         = 227u;  // Yield CPU to scheduler
const OP_GET_INPUT: u32     = 228u;  // Get next input event from VRAM queue

// Spatial / Infinite Map Opcodes (230-237)
const OP_CAMERA: u32        = 230u;  // Render viewport from Hilbert space
const OP_HILBERT_D2XY: u32  = 231u;  // Convert D to (X,Y)
const OP_HILBERT_XY2D: u32  = 232u;  // Convert (X,Y) to D
const OP_TILE_LOAD: u32     = 233u;  // Load tile region
const OP_TILE_EVICT: u32    = 234u;  // Evict tile region
const OP_ZOOM: u32          = 235u;  // Set zoom level
const OP_PAN: u32           = 236u;  // Pan camera

// Strata
const STRATUM_SUBSTRATE: u32 = 0u;
const STRATUM_MEMORY: u32    = 1u;
const STRATUM_LOGIC: u32     = 2u;
const STRATUM_SPEC: u32      = 3u;
const STRATUM_INTENT: u32    = 4u;

// VM States
const VM_STATE_INACTIVE: u32 = 0u;
const VM_STATE_RUNNING: u32  = 1u;
const VM_STATE_HALTED: u32   = 2u;
const VM_STATE_WAITING: u32  = 3u;  // Waiting for event/message

// ============================================================================
// DATA STRUCTURES
// ============================================================================

/// Single VM instance state
struct VmState {
    regs: array<u32, 32>,      // General purpose registers
    pc: u32,                    // Program counter (Hilbert index)
    halted: u32,                // Halt flag
    stratum: u32,               // Current stratum
    cycles: u32,                // Total cycles executed
    stack_ptr: u32,             // Stack pointer
    vm_id: u32,                 // VM slot ID (0-7)
    state: u32,                 // VM_STATE_* constant
    parent_id: u32,             // Parent VM that spawned this (0xFF = none)
    entry_point: u32,           // Initial PC for restart
    base_addr: u32,             // Spatial MMU: Start Hilbert index
    bound_addr: u32,            // Spatial MMU: End Hilbert index (0 = unrestricted)
    stack: array<u32, 64>,      // Call stack
}

/// Input event (must match InputEvent in input_types.rs)
struct InputEvent {
    timestamp_ns_low: u32,
    timestamp_ns_high: u32,
    event_type: u32,
    device_id: u32,
    x: f32,
    y: f32,
    dx: f32,
    dy: f32,
    code: u32,
    modifiers: u32,
};

/// Event queue header
struct EventQueueHeader {
    head: u32,
    tail: u32,
    capacity: u32,
    _padding: u32,
};

/// Helper: Validate spatial access (MMU)
fn check_spatial_bounds(vm_idx: u32, addr: u32) -> bool {
    let base = vms[vm_idx].base_addr;
    let bound = vms[vm_idx].bound_addr;
    // Bound 0 means unrestricted (Kernel/VM #0 mode)
    if (bound == 0u) { return true; }
    return addr >= base && addr < bound;
}

// ============================================================================
// SCHEDULER STATE
// ============================================================================

/// Scheduler state
struct SchedulerState {
    active_count: u32,          // Number of active VMs
    current_vm: u32,            // Currently executing VM
    frame: u32,                 // Frame counter
    spawn_count: u32,           // Total spawns this session
    round_robin_idx: u32,       // Next VM to schedule
    _padding: array<u32, 3>,
}

/// Inter-VM message queue (mailboxes)
struct MessageQueue {
    // Each VM has a mailbox of 4 messages
    // Message format: [sender_id, msg_type, data1, data2]
    mailboxes: array<vec4<u32>, 32>,  // 8 VMs * 4 messages each
    mailbox_head: array<u32, 8>,       // Head pointer per VM
    mailbox_tail: array<u32, 8>,       // Tail pointer per VM
}

// ============================================================================
// BINDINGS
// ============================================================================

@group(0) @binding(0) var ram: texture_storage_2d<rgba8uint, read_write>;
@group(0) @binding(1) var<storage, read_write> vms: array<VmState, 8>;
@group(0) @binding(2) var<storage, read_write> scheduler: SchedulerState;
@group(0) @binding(3) var<storage, read_write> messages: MessageQueue;
@group(0) @binding(4) var<storage, read> event_header: EventQueueHeader;
@group(0) @binding(5) var<storage, read> event_queue: array<InputEvent, EVENT_QUEUE_SIZE>;

// ============================================================================
// HILBERT CURVE (d to xy)
// ============================================================================

fn d2xy(n: u32, d_in: u32) -> vec2<u32> {
    var x = 0u;
    var y = 0u;
    var s = 1u;
    var d = d_in;
    while (s < n) {
        let rx = 1u & (d / 2u);
        let ry = 1u & (d ^ rx);
        if (ry == 0u) {
            if (rx == 1u) {
                x = s - 1u - x;
                y = s - 1u - y;
            }
            let t = x;
            x = y;
            y = t;
        }
        x += s * rx;
        y += s * ry;
        d /= 4u;
        s *= 2u;
    }
    return vec2<u32>(x, y);
}

/// Hilbert curve helper (xy to d) - inverse of d2xy
fn xy2d(n: u32, xy_in: vec2<u32>) -> u32 {
    var x = xy_in.x;
    var y = xy_in.y;
    var d = 0u;
    var s = n / 2u;
    while (s > 0u) {
        var rx = 0u;
        var ry = 0u;
        if ((x & s) != 0u) { rx = 1u; }
        if ((y & s) != 0u) { ry = 1u; }
        d += s * s * ((3u * rx) ^ ry);
        if (ry == 0u) {
            if (rx == 1u) {
                x = s - 1u - x;
                y = s - 1u - y;
            }
            let t = x;
            x = y;
            y = t;
        }
        s /= 2u;
    }
    return d;
}

/// Convert f32 to u32 bit pattern
fn f32_as_u32(val: f32) -> u32 {
    // Bitwise reinterpretation of f32 as u32
    return bitcast<u32>(val);
}

// ============================================================================
// VM EXECUTION
// ============================================================================

/// Execute one instruction for a VM
fn execute_instruction(vm_idx: u32) {
    if (vms[vm_idx].state != VM_STATE_RUNNING) {
        return;
    }

    let coords = d2xy(GRID_SIZE, vms[vm_idx].pc);

    // Fetch Glyph: RGBA = (Opcode/Unicode, Stratum, P1, P2)
    let glyph = textureLoad(ram, vec2<i32>(i32(coords.x), i32(coords.y)));

    // Normalize opcode: Unicode 200 + ID -> ID
    var opcode = glyph.r;
    if (opcode >= 200u) {
        opcode = opcode - 200u;
    }

    let stratum = glyph.g;
    let p1 = glyph.b;
    let p2 = glyph.a;

    vms[vm_idx].cycles = vms[vm_idx].cycles + 1u;

    switch (opcode) {
        case 0u: {
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 5u: {
            if (p1 < REG_COUNT && p2 < REG_COUNT) {
                vms[vm_idx].regs[p2] = vms[vm_idx].regs[p1] + vms[vm_idx].regs[p2];
            }
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 6u: {
            if (p1 < REG_COUNT && p2 < REG_COUNT) {
                vms[vm_idx].regs[p2] = vms[vm_idx].regs[p1] - vms[vm_idx].regs[p2];
            }
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 7u: {
            if (p1 < REG_COUNT && p2 < REG_COUNT) {
                vms[vm_idx].regs[p2] = vms[vm_idx].regs[p1] * vms[vm_idx].regs[p2];
            }
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 8u: {
            if (p1 < REG_COUNT && p2 < REG_COUNT && vms[vm_idx].regs[p2] != 0u) {
                vms[vm_idx].regs[p2] = vms[vm_idx].regs[p1] / vms[vm_idx].regs[p2];
            }
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 3u: {
            let addr = vms[vm_idx].regs[p1];
            if (!check_spatial_bounds(vm_idx, addr)) {
                vms[vm_idx].state = VM_STATE_HALTED;
                vms[vm_idx].halted = 4u; // VM_FAULT_SPATIAL_VIOLATION
                return;
            }
            let addr_coords = d2xy(GRID_SIZE, addr);
            let val = textureLoad(ram, vec2<i32>(i32(addr_coords.x), i32(addr_coords.y)));
            vms[vm_idx].regs[p2] = val.r;
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 4u: {
            let addr = vms[vm_idx].regs[p1];
            if (!check_spatial_bounds(vm_idx, addr)) {
                vms[vm_idx].state = VM_STATE_HALTED;
                vms[vm_idx].halted = 4u; // VM_FAULT_SPATIAL_VIOLATION
                return;
            }
            let addr_coords = d2xy(GRID_SIZE, addr);
            textureStore(ram, vec2<i32>(i32(addr_coords.x), i32(addr_coords.y)),
                        vec4<u32>(vms[vm_idx].regs[p2], STRATUM_MEMORY, 0u, 255u));
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 9u: {
            vms[vm_idx].pc = vms[vm_idx].regs[p1];
        }
        case 10u: {
            if (vms[vm_idx].regs[p1] == 0u) {
                vms[vm_idx].pc = vms[vm_idx].regs[p2];
            } else {
                vms[vm_idx].pc = vms[vm_idx].pc + 1u;
            }
        }
        case 11u: {
            if (vms[vm_idx].stack_ptr < STACK_SIZE) {
                vms[vm_idx].stack[vms[vm_idx].stack_ptr] = vms[vm_idx].pc + 1u;
                vms[vm_idx].stack_ptr = vms[vm_idx].stack_ptr + 1u;
                vms[vm_idx].pc = vms[vm_idx].regs[p1];
            } else {
                vms[vm_idx].state = VM_STATE_HALTED;
                vms[vm_idx].halted = 2u; // Stack Overflow
            }
        }
        case 12u: {
            if (vms[vm_idx].stack_ptr > 0u) {
                vms[vm_idx].stack_ptr = vms[vm_idx].stack_ptr - 1u;
                vms[vm_idx].pc = vms[vm_idx].stack[vms[vm_idx].stack_ptr];
            } else {
                vms[vm_idx].state = VM_STATE_HALTED;
                vms[vm_idx].halted = 3u; // Stack Underflow
            }
        }
        case 13u: {
            vms[vm_idx].state = VM_STATE_HALTED;
            vms[vm_idx].halted = 1u;
        }
        case 227u: {
            // Yield remaining cycles to scheduler
            // VM stays runnable but gives up this frame
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
            return; // Early exit triggers scheduler to pick next VM
        }
        case 228u: {
            // Get next input event from VRAM queue (read-only, doesn't consume)
            // p1 = base register for output (p1+0=event_type, p1+1=x, p1+2=y, p1+3=code, p1+4=modifiers)

            // Check if there are pending events
            if (event_header.head != event_header.tail) {
                // Get the event at the tail position (peek, don't consume)
                let event = event_queue[event_header.tail];

                // Output the event data to registers starting at p1
                let base_reg = p1;
                if (base_reg + 4u < REG_COUNT) {
                    vms[vm_idx].regs[base_reg] = event.event_type;
                    vms[vm_idx].regs[base_reg + 1u] = f32_as_u32(event.x);
                    vms[vm_idx].regs[base_reg + 2u] = f32_as_u32(event.y);
                    vms[vm_idx].regs[base_reg + 3u] = event.code;
                    vms[vm_idx].regs[base_reg + 4u] = event.modifiers;
                }
            } else {
                // No events pending - set first register to 0
                vms[vm_idx].regs[p1] = EVENT_NONE;
            }

            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 225u: {
            // Spawn a new VM in a free slot
            // regs[p1] = entry_point for new VM
            // regs[p2] = spawn flags (0 = copy state, 1 = fresh state)
            let entry_point = vms[vm_idx].regs[p1];
            let spawn_flags = vms[vm_idx].regs[p2];

            // Find free slot
            var spawned = false;
            for (var i = 0u; i < MAX_VMS; i++) {
                if (vms[i].state == VM_STATE_INACTIVE) {
                    // Initialize new VM
                    vms[i].vm_id = i;
                    vms[i].parent_id = vms[vm_idx].vm_id;
                    vms[i].entry_point = entry_point;
                    vms[i].pc = entry_point;
                    vms[i].state = VM_STATE_RUNNING;
                    vms[i].halted = 0u;
                    vms[i].cycles = 0u;
                    vms[i].stack_ptr = 0u;
                    vms[i].stratum = STRATUM_LOGIC;
                    
                    // NEW: Inherit bounds from parent (or set to 0 for kernel-spawned)
                    vms[i].base_addr = vms[vm_idx].base_addr;
                    vms[i].bound_addr = vms[vm_idx].bound_addr;

                    if (spawn_flags == 0u) {
                        // Copy parent's registers
                        for (var r = 0u; r < REG_COUNT; r++) {
                            vms[i].regs[r] = vms[vm_idx].regs[r];
                        }
                    } else {
                        // Fresh registers (all zero)
                        for (var r = 0u; r < REG_COUNT; r++) {
                            vms[i].regs[r] = 0u;
                        }
                    }

                    scheduler.active_count = scheduler.active_count + 1u;
                    scheduler.spawn_count = scheduler.spawn_count + 1u;
                    spawned = true;

                    // Return child VM ID in regs[p1]
                    vms[vm_idx].regs[p1] = i;
                    break;
                }
            }

            if (!spawned) {
                // No free slots - set error flag
                vms[vm_idx].regs[p1] = 0xFFFFFFFFu;
            }

            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 226u: {
            let addr = vms[vm_idx].regs[p1];
            if (!check_spatial_bounds(vm_idx, addr)) {
                vms[vm_idx].state = VM_STATE_HALTED;
                vms[vm_idx].halted = 4u; // VM_FAULT_SPATIAL_VIOLATION
                return;
            }
            let addr_coords = d2xy(GRID_SIZE, addr);
            textureStore(ram, vec2<i32>(i32(addr_coords.x), i32(addr_coords.y)),
                        vec4<u32>(vms[vm_idx].regs[p2], stratum, 0u, 255u));
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }

        case 230u: {
            // Render viewport from Hilbert space to screen
            // p1 = screen_width, p2 = screen_height
            // Uses regs[20-22] for camera_x, camera_y, zoom

            let screen_w = vms[vm_idx].regs[p1];
            let screen_h = vms[vm_idx].regs[p2];
            let cam_x = vms[vm_idx].regs[20];  // Camera X in world space
            let cam_y = vms[vm_idx].regs[21];  // Camera Y in world space
            let zoom = vms[vm_idx].regs[22];   // Zoom (16.16 fixed point)

            // Convert zoom from fixed point
            let zoom_f = f32(zoom) / 65536.0;
            let inv_zoom = 1.0 / max(zoom_f, 0.001);

            // For each screen pixel, sample from Hilbert space
            // Note: In real implementation, this would write to a screen texture
            // For now, we just update a "rendered" flag
            vms[vm_idx].regs[30] = screen_w;
            vms[vm_idx].regs[31] = screen_h;

            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 231u: {
            // Convert Hilbert index D to (X, Y)
            // regs[p1] = D (input), stores result in regs[p1] (x) and regs[p1+1] (y)
            let d = vms[vm_idx].regs[p1];
            let xy = d2xy(GRID_SIZE, d);
            vms[vm_idx].regs[p1] = xy.x;
            vms[vm_idx].regs[p1 + 1u] = xy.y;
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 232u: {
            // Convert (X, Y) to Hilbert index D
            // regs[p1] = x, regs[p2] = y, result in regs[p1]
            let x = vms[vm_idx].regs[p1];
            let y = vms[vm_idx].regs[p2];
            let d = xy2d(GRID_SIZE, vec2<u32>(x, y));
            vms[vm_idx].regs[p1] = d;
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 235u: {
            // Set zoom level
            // regs[p1] = new zoom (16.16 fixed point)
            vms[vm_idx].regs[22] = vms[vm_idx].regs[p1];
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 236u: {
            // Pan camera by delta
            // regs[p1] = dx, regs[p2] = dy
            vms[vm_idx].regs[20] = vms[vm_idx].regs[20] + vms[vm_idx].regs[p1];
            vms[vm_idx].regs[21] = vms[vm_idx].regs[21] + vms[vm_idx].regs[p2];
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        default: {
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
    }
}

// ============================================================================
// SCHEDULER
// ============================================================================

/// Round-robin scheduler - execute each active VM for MAX_CYCLES_PER_VM
fn run_scheduler() {
    var cycles_used: array<u32, 8>;

    // Run each active VM for its time slice
    for (var vm_idx = 0u; vm_idx < MAX_VMS; vm_idx++) {
        if (vms[vm_idx].state == VM_STATE_RUNNING) {
            scheduler.current_vm = vm_idx;

            // Execute up to MAX_CYCLES_PER_VM instructions
            for (var c = 0u; c < MAX_CYCLES_PER_VM; c++) {
                if (vms[vm_idx].state != VM_STATE_RUNNING) {
                    break;
                }
                execute_instruction(vm_idx);
            }
        }
    }

    // Update frame counter
    scheduler.frame = scheduler.frame + 1u;
}

// ============================================================================
// MAIN ENTRY POINT
// ============================================================================

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    // Only thread 0 runs the scheduler
    if (global_id.x > 0u) {
        return;
    }

    run_scheduler();
}
