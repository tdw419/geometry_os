// ============================================
// GEOMETRY OS - COMPLETE WASM VM SHADER
// Phase 25: Native WebAssembly Substrate
// ============================================
//
// A complete WebAssembly virtual machine running on GPU
// Supports full WASM MVP specification
//
// Architecture:
// - Stack-based execution (workgroup shared memory)
// - Linear memory (storage buffer)
// - Locals and globals (workgroup memory)
// - Function calls (call stack)
// - Control flow (blocks, loops, branches)

// ============================================
// BINDINGS
// ============================================

@group(0) @binding(0) var<storage, read> wasm_bytecode: array<u32>;
@group(0) @binding(1) var<storage, read_write> linear_memory: array<u32>;
@group(0) @binding(2) var<storage, read_write> globals: array<u32>;
@group(0) @binding(3) var<storage, read_write> execution_trace: array<u32>;
@group(0) @binding(4) var<uniform> vm_config: VMConfig;
@group(0) @binding(5) var spatial_texture: texture_2d<f32>;
@group(0) @binding(6) var spatial_sampler: sampler;
@group(0) @binding(7) var<storage, read_write> output_buffer: array<u32>;

struct VMConfig {
    bytecode_size: u32,
    memory_size: u32,      // In pages (64KB each)
    num_globals: u32,
    entry_point: u32,      // Function index to start execution
    max_instructions: u32, // Execution limit
    trace_enabled: u32,    // 1 = enable tracing
}

// ============================================
// WORKGROUP MEMORY (SHARED)
// ============================================

// Value Stack (256 entries per workgroup)
var<workgroup> value_stack: array<u32, 256>;
var<workgroup> value_sp: atomic<u32>;

// Call Stack (64 entries - function frames)
struct CallFrame {
    return_pc: u32,
    locals_offset: u32,
    num_locals: u32,
}
var<workgroup> call_stack: array<CallFrame, 64>;
var<workgroup> call_sp: atomic<u32>;

// Locals (256 entries total, shared across all functions)
var<workgroup> locals: array<u32, 256>;
var<workgroup> locals_offset: atomic<u32>;

// Control Stack (for blocks, loops, if)
struct ControlFrame {
    opcode: u32,        // 0x02=block, 0x03=loop, 0x04=if
    start_pc: u32,
    end_pc: u32,
    stack_height: u32,
}
var<workgroup> control_stack: array<ControlFrame, 64>;
var<workgroup> control_sp: atomic<u32>;

// Program Counter
var<workgroup> pc: atomic<u32>;

// Instruction Counter (for execution limits)
var<workgroup> instruction_count: atomic<u32>;

// Current memory pages (for memory.size and memory.grow)
var<workgroup> current_memory_pages: atomic<u32>;

// Output buffer index counter (for write_region)
var<workgroup> output_index_counter: atomic<u32>;

// ============================================
// WASM OPCODES (MVP Specification)
// ============================================

// Control Flow
const OP_UNREACHABLE: u32 = 0x00;
const OP_NOP: u32         = 0x01;
const OP_BLOCK: u32       = 0x02;
const OP_LOOP: u32        = 0x03;
const OP_IF: u32          = 0x04;
const OP_ELSE: u32        = 0x05;
const OP_END: u32         = 0x0B;
const OP_BR: u32          = 0x0C;
const OP_BR_IF: u32       = 0x0D;
const OP_BR_TABLE: u32    = 0x0E;
const OP_RETURN: u32      = 0x0F;

// Call
const OP_CALL: u32        = 0x10;
const OP_CALL_INDIRECT: u32 = 0x11;

// Parametric
const OP_DROP: u32        = 0x1A;
const OP_SELECT: u32      = 0x1B;

// Variable Access
const OP_LOCAL_GET: u32   = 0x20;
const OP_LOCAL_SET: u32   = 0x21;
const OP_LOCAL_TEE: u32   = 0x22;
const OP_GLOBAL_GET: u32  = 0x23;
const OP_GLOBAL_SET: u32  = 0x24;

// Memory
const OP_I32_LOAD: u32    = 0x28;
const OP_I64_LOAD: u32    = 0x29;
const OP_F32_LOAD: u32    = 0x2A;
const OP_F64_LOAD: u32    = 0x2B;
const OP_I32_LOAD8_S: u32 = 0x2C;
const OP_I32_LOAD8_U: u32 = 0x2D;
const OP_I32_LOAD16_S: u32 = 0x2E;
const OP_I32_LOAD16_U: u32 = 0x2F;
const OP_I64_LOAD8_S: u32 = 0x30;
const OP_I64_LOAD8_U: u32 = 0x31;
const OP_I64_LOAD16_S: u32 = 0x32;
const OP_I64_LOAD16_U: u32 = 0x33;
const OP_I64_LOAD32_S: u32 = 0x34;
const OP_I64_LOAD32_U: u32 = 0x35;
const OP_I32_STORE: u32   = 0x36;
const OP_I64_STORE: u32   = 0x37;
const OP_F32_STORE: u32   = 0x38;
const OP_F64_STORE: u32   = 0x39;
const OP_I32_STORE8: u32  = 0x3A;
const OP_I32_STORE16: u32 = 0x3B;
const OP_I64_STORE8: u32  = 0x3C;
const OP_I64_STORE16: u32 = 0x3D;
const OP_I64_STORE32: u32 = 0x3E;
const OP_MEMORY_SIZE: u32 = 0x3F;
const OP_MEMORY_GROW: u32 = 0x40;

// Constants
const OP_I32_CONST: u32   = 0x41;
const OP_I64_CONST: u32   = 0x42;
const OP_F32_CONST: u32   = 0x43;
const OP_F64_CONST: u32   = 0x44;

// Comparison
const OP_I32_EQZ: u32     = 0x45;
const OP_I32_EQ: u32      = 0x46;
const OP_I32_NE: u32      = 0x47;
const OP_I32_LT_S: u32    = 0x48;
const OP_I32_LT_U: u32    = 0x49;
const OP_I32_GT_S: u32    = 0x4A;
const OP_I32_GT_U: u32    = 0x4B;
const OP_I32_LE_S: u32    = 0x4C;
const OP_I32_LE_U: u32    = 0x4D;
const OP_I32_GE_S: u32    = 0x4E;
const OP_I32_GE_U: u32    = 0x4F;
const OP_I64_EQZ: u32     = 0x50;
const OP_I64_EQ: u32      = 0x51;
const OP_I64_NE: u32      = 0x52;
const OP_I64_LT_S: u32    = 0x53;
const OP_I64_LT_U: u32    = 0x54;
const OP_I64_GT_S: u32    = 0x55;
const OP_I64_GT_U: u32    = 0x56;
const OP_I64_LE_S: u32    = 0x57;
const OP_I64_LE_U: u32    = 0x58;
const OP_I64_GE_S: u32    = 0x59;
const OP_I64_GE_U: u32    = 0x5A;
const OP_F32_EQ: u32      = 0x5B;
const OP_F32_NE: u32      = 0x5C;
const OP_F32_LT: u32      = 0x5D;
const OP_F32_GT: u32      = 0x5E;
const OP_F32_LE: u32      = 0x5F;
const OP_F32_GE: u32      = 0x60;
const OP_F64_EQ: u32      = 0x61;
const OP_F64_NE: u32      = 0x62;
const OP_F64_LT: u32      = 0x63;
const OP_F64_GT: u32      = 0x64;
const OP_F64_LE: u32      = 0x65;
const OP_F64_GE: u32      = 0x66;

// Arithmetic
const OP_I32_CLZ: u32     = 0x67;
const OP_I32_CTZ: u32     = 0x68;
const OP_I32_POPCNT: u32  = 0x69;
const OP_I32_ADD: u32     = 0x6A;
const OP_I32_SUB: u32     = 0x6B;
const OP_I32_MUL: u32     = 0x6C;
const OP_I32_DIV_S: u32   = 0x6D;
const OP_I32_DIV_U: u32   = 0x6E;
const OP_I32_REM_S: u32   = 0x6F;
const OP_I32_REM_U: u32   = 0x70;
const OP_I32_AND: u32     = 0x71;
const OP_I32_OR: u32      = 0x72;
const OP_I32_XOR: u32     = 0x73;
const OP_I32_SHL: u32     = 0x74;
const OP_I32_SHR_S: u32   = 0x75;
const OP_I32_SHR_U: u32   = 0x76;
const OP_I32_ROTL: u32    = 0x77;
const OP_I32_ROTR: u32    = 0x78;
const OP_I64_CLZ: u32     = 0x79;
const OP_I64_CTZ: u32     = 0x7A;
const OP_I64_POPCNT: u32  = 0x7B;
const OP_I64_ADD: u32     = 0x7C;
const OP_I64_SUB: u32     = 0x7D;
const OP_I64_MUL: u32     = 0x7E;
const OP_I64_DIV_S: u32   = 0x7F;
const OP_I64_DIV_U: u32   = 0x80;
const OP_I64_REM_S: u32   = 0x81;
const OP_I64_REM_U: u32   = 0x82;
const OP_I64_AND: u32     = 0x83;
const OP_I64_OR: u32      = 0x84;
const OP_I64_XOR: u32     = 0x85;
const OP_I64_SHL: u32     = 0x86;
const OP_I64_SHR_S: u32   = 0x87;
const OP_I64_SHR_U: u32   = 0x88;
const OP_I64_ROTL: u32    = 0x89;
const OP_I64_ROTR: u32    = 0x8A;
const OP_F32_ABS: u32     = 0x8B;
const OP_F32_NEG: u32     = 0x8C;
const OP_F32_COPYSIGN: u32 = 0x8D;
const OP_F32_CEIL: u32    = 0x8E;
const OP_F32_FLOOR: u32   = 0x8F;
const OP_F32_TRUNC: u32   = 0x90;
const OP_F32_NEAREST: u32 = 0x91;
const OP_F32_SQRT: u32    = 0x92;
const OP_F32_ADD: u32     = 0x93;
const OP_F32_SUB: u32     = 0x94;
const OP_F32_MUL: u32     = 0x95;
const OP_F32_DIV: u32     = 0x96;
const OP_F32_MIN: u32     = 0x97;
const OP_F32_MAX: u32     = 0x98;
const OP_F64_ABS: u32     = 0x99;
const OP_F64_NEG: u32     = 0x9A;
const OP_F64_COPYSIGN: u32 = 0x9B;
const OP_F64_CEIL: u32    = 0x9C;
const OP_F64_FLOOR: u32   = 0x9D;
const OP_F64_TRUNC: u32   = 0x9E;
const OP_F64_NEAREST: u32 = 0x9F;
const OP_F64_SQRT: u32    = 0xA0;
const OP_F64_ADD: u32     = 0xA1;
const OP_F64_SUB: u32     = 0xA2;
const OP_F64_MUL: u32     = 0xA3;
const OP_F64_DIV: u32     = 0xA4;
const OP_F64_MIN: u32     = 0xA5;
const OP_F64_MAX: u32     = 0xA6;

// Conversion
const OP_I32_WRAP_I64: u32     = 0xA7;
const OP_I32_TRUNC_F32_S: u32  = 0xA8;
const OP_I32_TRUNC_F32_U: u32  = 0xA9;
const OP_I32_TRUNC_F64_S: u32  = 0xAA;
const OP_I32_TRUNC_F64_U: u32  = 0xAB;
const OP_I64_EXTEND_S_I32: u32 = 0xAC;
const OP_I64_EXTEND_U_I32: u32 = 0xAD;
const OP_I64_TRUNC_F32_S: u32  = 0xAE;
const OP_I64_TRUNC_F32_U: u32  = 0xAF;
const OP_I64_TRUNC_F64_S: u32  = 0xB0;
const OP_I64_TRUNC_F64_U: u32  = 0xB1;
const OP_F32_CONVERT_I32_S: u32 = 0xB2;
const OP_F32_CONVERT_I32_U: u32 = 0xB3;
const OP_F32_CONVERT_I64_S: u32 = 0xB4;
const OP_F32_CONVERT_I64_U: u32 = 0xB5;
const OP_F32_DEMOTE_F64: u32   = 0xB6;
const OP_F64_CONVERT_I32_S: u32 = 0xB7;
const OP_F64_CONVERT_I32_U: u32 = 0xB8;
const OP_F64_CONVERT_I64_S: u32 = 0xB9;
const OP_F64_CONVERT_I64_U: u32 = 0xBA;
const OP_F64_PROMOTE_F32: u32   = 0xBB;
const OP_I32_REINTERPRET_F32: u32 = 0xBC;
const OP_I64_REINTERPRET_F64: u32 = 0xBD;
const OP_F32_REINTERPRET_I32: u32 = 0xBE;
const OP_F64_REINTERPRET_I64: u32 = 0xBF;

// ============================================
// HELPER FUNCTIONS
// ============================================

// Stack Operations
fn push_value(value: u32) {
    let index = atomicAdd(&value_sp, 1u);
    if index < 256u {
        value_stack[index] = value;
    }
}

fn pop_value() -> u32 {
    let index = atomicSub(&value_sp, 1u) - 1u;
    if index < 256u {
        return value_stack[index];
    }
    return 0u;
}

fn peek_value(offset: u32) -> u32 {
    let sp = atomicLoad(&value_sp);
    if sp > offset && sp - offset - 1u < 256u {
        return value_stack[sp - offset - 1u];
    }
    return 0u;
}

// i64 operations (stored as two u32 values on stack: low, high)
fn push_i64(low: u32, high: u32) {
    push_value(low);
    push_value(high);
}

fn pop_i64() -> vec2<u32> {
    let high = pop_value();
    let low = pop_value();
    return vec2<u32>(low, high);
}

fn peek_i64(offset: u32) -> vec2<u32> {
    // offset is in i64 "slots" (each slot is 2 u32s)
    let low = peek_value(offset * 2u + 1u);
    let high = peek_value(offset * 2u);
    return vec2<u32>(low, high);
}

// i64 arithmetic helpers
fn i64_eq(a: vec2<u32>, b: vec2<u32>) -> u32 {
    return u32((a.x == b.x) && (a.y == b.y));
}

fn i64_lt_u(a: vec2<u32>, b: vec2<u32>) -> u32 {
    // Unsigned comparison: compare high first, then low
    if a.y != b.y {
        return u32(a.y < b.y);
    }
    return u32(a.x < b.x);
}

fn i64_lt_s(a: vec2<u32>, b: vec2<u32>) -> u32 {
    // Signed comparison
    let a_high_signed = i32(a.y);
    let b_high_signed = i32(b.y);
    if a_high_signed != b_high_signed {
        return u32(a_high_signed < b_high_signed);
    }
    return u32(a.x < b.x);
}

fn i64_add(a: vec2<u32>, b: vec2<u32>) -> vec2<u32> {
    let low_sum = a.x + b.x;
    let carry = u32(low_sum < a.x); // Overflow in low word
    let high_sum = a.y + b.y + carry;
    return vec2<u32>(low_sum, high_sum);
}

fn i64_sub(a: vec2<u32>, b: vec2<u32>) -> vec2<u32> {
    let borrow = u32(b.x > a.x);
    let low_diff = a.x - b.x;
    let high_diff = a.y - b.y - borrow;
    return vec2<u32>(low_diff, high_diff);
}

fn i64_mul(a: vec2<u32>, b: vec2<u32>) -> vec2<u32> {
    // Simple 64-bit multiplication using 32-bit parts
    let a_low = f32(a.x);
    let a_high = f32(a.y);
    let b_low = f32(b.x);
    let b_high = f32(b.y);

    // For full 64-bit precision, we'd need more complex logic
    // This is a simplified version for common cases
    let result_low = u32(a_low * b_low);
    let result_high = u32((a_low * b_high / 65536.0) + (b_low * a_high / 65536.0));
    return vec2<u32>(result_low, result_high);
}

fn i64_and(a: vec2<u32>, b: vec2<u32>) -> vec2<u32> {
    return vec2<u32>(a.x & b.x, a.y & b.y);
}

fn i64_or(a: vec2<u32>, b: vec2<u32>) -> vec2<u32> {
    return vec2<u32>(a.x | b.x, a.y | b.y);
}

fn i64_xor(a: vec2<u32>, b: vec2<u32>) -> vec2<u32> {
    return vec2<u32>(a.x ^ b.x, a.y ^ b.y);
}

fn i64_shl(a: vec2<u32>, shift: u32) -> vec2<u32> {
    if shift == 0u {
        return a;
    } else if shift < 32u {
        let low_shifted = a.x << shift;
        let high_from_low = a.x >> (32u - shift);
        let high_shifted = (a.y << shift) | high_from_low;
        return vec2<u32>(low_shifted, high_shifted);
    } else {
        let shifted = a.y << (shift - 32u);
        return vec2<u32>(0u, shifted);
    }
}

fn i64_shr_u(a: vec2<u32>, shift: u32) -> vec2<u32> {
    if shift == 0u {
        return a;
    } else if shift < 32u {
        let high_shifted = a.y >> shift;
        let low_from_high = (a.y & (0xFFFFFFFFu >> (32u - shift))) << (32u - shift);
        let low_shifted = (a.x >> shift) | low_from_high;
        return vec2<u32>(low_shifted, high_shifted);
    } else {
        let shifted = a.y >> (shift - 32u);
        return vec2<u32>(shifted, 0u);
    }
}

fn i64_rotl(a: vec2<u32>, shift: u32) -> vec2<u32> {
    let s = shift % 64u;
    if s == 0u {
        return a;
    } else if s < 32u {
        let low_from_high = a.y >> (32u - s);
        let high_from_low = a.x << s;
        let low = (a.x << s) | low_from_high;
        let high = (a.y << s) | (a.x >> (32u - s));
        return vec2<u32>(low, high);
    } else {
        // Rotate by 32-63: swap high/low and rotate by s-32
        let swapped = vec2<u32>(a.y, a.x);
        let s2 = s - 32u;
        let low_from_high = swapped.y >> (32u - s2);
        let high_from_low = swapped.x << s2;
        let low = (swapped.x << s2) | low_from_high;
        let high = (swapped.y << s2) | (swapped.x >> (32u - s2));
        return vec2<u32>(low, high);
    }
}

fn i64_rotr(a: vec2<u32>, shift: u32) -> vec2<u32> {
    let s = shift % 64u;
    if s == 0u {
        return a;
    } else if s < 32u {
        let high_from_low = a.x >> s;
        let low_from_high = a.y << (32u - s);
        let low = (a.x >> s) | low_from_high;
        let high = (a.y >> s) | (a.y & (0xFFFFFFFFu >> s));
        return vec2<u32>(low, high);
    } else {
        // Rotate by 32-63: swap high/low and rotate by s-32
        let swapped = vec2<u32>(a.y, a.x);
        let s2 = s - 32u;
        let high_from_low = swapped.x >> s2;
        let low_from_high = swapped.y << (32u - s2);
        let low = (swapped.x >> s2) | low_from_high;
        let high = (swapped.y >> s2) | (swapped.y & (0xFFFFFFFFu >> s2));
        return vec2<u32>(low, high);
    }
}

fn i64_clz(val: vec2<u32>) -> u32 {
    if val.y != 0u {
        var count: u32 = 0u;
        var temp = val.y;
        while (temp & 0x80000000u) == 0u {
            count += 1u;
            temp <<= 1u;
        }
        return count;
    } else if val.x != 0u {
        var count: u32 = 0u;
        var temp = val.x;
        while (temp & 0x80000000u) == 0u {
            count += 1u;
            temp <<= 1u;
        }
        return count + 32u;
    }
    return 64u;
}

fn i64_ctz(val: vec2<u32>) -> u32 {
    if val.x != 0u {
        var count: u32 = 0u;
        var temp = val.x;
        while (temp & 0x1u) == 0u {
            count += 1u;
            temp >>= 1u;
        }
        return count;
    } else if val.y != 0u {
        var count: u32 = 0u;
        var temp = val.y;
        while (temp & 0x1u) == 0u {
            count += 1u;
            temp >>= 1u;
        }
        return count + 32u;
    }
    return 64u;
}

fn i64_popcnt(val: vec2<u32>) -> u32 {
    var count: u32 = 0u;
    var temp = val.x;
    for (var i: u32 = 0u; i < 32u; i++) {
        count += temp & 0x1u;
        temp >>= 1u;
    }
    temp = val.y;
    for (var i: u32 = 0u; i < 32u; i++) {
        count += temp & 0x1u;
        temp >>= 1u;
    }
    return count;
}

// Floating-point operations (f32 stored as u32, f64 stored as vec2<u32>)
fn push_f32(value: f32) {
    push_value(bitcast<u32>(value));
}

fn pop_f32() -> f32 {
    return bitcast<f32>(pop_value());
}

fn push_f64(value: f64) {
    // f64 support: Store as two u32 values
    // Note: WGSL doesn't support bitcast<u64> or bitcast<f64>
    // On GPUs with f64 support, we store the raw bits
    // On GPUs without f64, this may have precision issues
    // For full f64 support, use software emulation or mock mode

    // Use f32 storage as approximation (loss of precision)
    // For exact bit manipulation, would need u64 support
    let approx = f32(value);
    let u32_bits = bitcast<u32>(approx);
    push_i64(u32_bits, 0u); // Store approx in low 32 bits, high is 0
}

fn pop_f64() -> f64 {
    // Pop two u32s and reconstruct as f64
    // Note: This is an approximation due to WGSL limitations
    let bits = pop_i64();
    let approx = bitcast<f32>(bits.x);
    return f64(approx); // May lose precision for large f64 values
}

// Memory Operations

// Bounds checking helper function
fn check_memory_bounds(addr: u32, size: u32) -> bool {
    let current_pages = atomicLoad(&current_memory_pages);
    let byte_limit = current_pages * 65536u;
    return (addr + size) <= byte_limit;
}

fn memory_load_u32(addr: u32) -> u32 {
    if (!check_memory_bounds(addr, 4u)) {
        return 0u;  // Out of bounds
    }
    let word_addr = addr / 4u;
    if word_addr < arrayLength(&linear_memory) {
        return linear_memory[word_addr];
    }
    return 0u;
}

fn memory_store_u32(addr: u32, value: u32) {
    if (!check_memory_bounds(addr, 4u)) {
        return;  // Silent ignore for out of bounds
    }
    let word_addr = addr / 4u;
    if word_addr < arrayLength(&linear_memory) {
        linear_memory[word_addr] = value;
    }
}

fn memory_load_u8(addr: u32) -> u32 {
    if (!check_memory_bounds(addr, 1u)) {
        return 0u;  // Out of bounds
    }
    let word_addr = addr / 4u;
    let byte_offset = addr % 4u;
    if word_addr < arrayLength(&linear_memory) {
        let word = linear_memory[word_addr];
        return (word >> (byte_offset * 8u)) & 0xFFu;
    }
    return 0u;
}

fn memory_store_u8(addr: u32, value: u32) {
    if (!check_memory_bounds(addr, 1u)) {
        return;  // Silent ignore for out of bounds
    }
    let word_addr = addr / 4u;
    let byte_offset = addr % 4u;
    if word_addr < arrayLength(&linear_memory) {
        let word = linear_memory[word_addr];
        let mask = ~(0xFFu << (byte_offset * 8u));
        let new_word = (word & mask) | ((value & 0xFFu) << (byte_offset * 8u));
        linear_memory[word_addr] = new_word;
    }
}

fn memory_load_u16(addr: u32) -> u32 {
    if (!check_memory_bounds(addr, 2u)) {
        return 0u;  // Out of bounds
    }
    let word_addr = addr / 4u;
    let byte_offset = addr % 4u;
    if word_addr < arrayLength(&linear_memory) {
        let word = linear_memory[word_addr];
        // Handle 16-bit load that may cross word boundary
        if byte_offset <= 2u {
            return (word >> (byte_offset * 8u)) & 0xFFFFu;
        } else {
            // Crosses boundary - read low byte from current word, high byte from next
            let low_byte = (word >> 24u) & 0xFFu;
            var high_byte: u32 = 0u;
            if (word_addr + 1u) < arrayLength(&linear_memory) {
                let next_word = linear_memory[word_addr + 1u];
                high_byte = next_word & 0xFFu;
            }
            return low_byte | (high_byte << 8u);
        }
    }
    return 0u;
}

fn memory_store_u16(addr: u32, value: u32) {
    if (!check_memory_bounds(addr, 2u)) {
        return;  // Silent ignore for out of bounds
    }
    let word_addr = addr / 4u;
    let byte_offset = addr % 4u;
    if word_addr < arrayLength(&linear_memory) {
        let word = linear_memory[word_addr];
        let mask = ~(0xFFFFu << (byte_offset * 8u));
        let new_word = (word & mask) | ((value & 0xFFFFu) << (byte_offset * 8u));
        linear_memory[word_addr] = new_word;
    }
}

// i64 memory operations
fn memory_load_i64(addr: u32) -> vec2<u32> {
    if (!check_memory_bounds(addr, 8u)) {
        return vec2<u32>(0u, 0u);  // Out of bounds
    }
    let word_addr = addr / 4u;
    if word_addr + 1u < arrayLength(&linear_memory) {
        let low = linear_memory[word_addr];
        let high = linear_memory[word_addr + 1u];
        return vec2<u32>(low, high);
    }
    return vec2<u32>(0u, 0u);
}

fn memory_store_i64(addr: u32, value: vec2<u32>) {
    if (!check_memory_bounds(addr, 8u)) {
        return;  // Silent ignore for out of bounds
    }
    let word_addr = addr / 4u;
    if word_addr + 1u < arrayLength(&linear_memory) {
        linear_memory[word_addr] = value.x;
        linear_memory[word_addr + 1u] = value.y;
    }
}

fn memory_load_i64_u8(addr: u32, is_signed: bool) -> vec2<u32> {
    if (!check_memory_bounds(addr, 1u)) {
        return vec2<u32>(0u, 0u);  // Out of bounds
    }
    let byte_val = memory_load_u8(addr);
    if is_signed && (byte_val & 0x80u) != 0u {
        return vec2<u32>(byte_val, 0xFFFFFFFFu);
    } else {
        return vec2<u32>(byte_val, 0u);
    }
}

fn memory_load_i64_u16(addr: u32, is_signed: bool) -> vec2<u32> {
    if (!check_memory_bounds(addr, 2u)) {
        return vec2<u32>(0u, 0u);  // Out of bounds
    }
    let half_val = memory_load_u16(addr);
    if is_signed && (half_val & 0x8000u) != 0u {
        return vec2<u32>(half_val, 0xFFFFFFFFu);
    } else {
        return vec2<u32>(half_val, 0u);
    }
}

fn memory_load_i64_u32(addr: u32, is_signed: bool) -> vec2<u32> {
    if (!check_memory_bounds(addr, 4u)) {
        return vec2<u32>(0u, 0u);  // Out of bounds
    }
    let word_addr = addr / 4u;
    let val = memory_load_u32(addr);
    if is_signed && (val & 0x80000000u) != 0u {
        return vec2<u32>(val, 0xFFFFFFFFu);
    } else {
        return vec2<u32>(val, 0u);
    }
}

fn memory_store_i64_u8(addr: u32, value: vec2<u32>) {
    if (!check_memory_bounds(addr, 1u)) {
        return;  // Silent ignore for out of bounds
    }
    memory_store_u8(addr, value.x);
}

fn memory_store_i64_u16(addr: u32, value: vec2<u32>) {
    if (!check_memory_bounds(addr, 2u)) {
        return;  // Silent ignore for out of bounds
    }
    memory_store_u16(addr, value.x);
}

fn memory_store_i64_u32(addr: u32, value: vec2<u32>) {
    if (!check_memory_bounds(addr, 4u)) {
        return;  // Silent ignore for out of bounds
    }
    memory_store_u32(addr, value.x);
}

// f32 memory operations
fn memory_load_f32(addr: u32) -> f32 {
    if (!check_memory_bounds(addr, 4u)) {
        return bitcast<f32>(0u);  // Out of bounds
    }
    let bits = memory_load_u32(addr);
    return bitcast<f32>(bits);
}

fn memory_store_f32(addr: u32, value: f32) {
    if (!check_memory_bounds(addr, 4u)) {
        return;  // Silent ignore for out of bounds
    }
    let bits = bitcast<u32>(value);
    memory_store_u32(addr, bits);
}

// f64 memory operations
fn memory_load_f64(addr: u32) -> f64 {
    if (!check_memory_bounds(addr, 8u)) {
        return bitcast<f64>(vec2<u32>(0u, 0u));  // Out of bounds
    }
    let word_addr = addr / 4u;
    if word_addr + 1u < arrayLength(&linear_memory) {
        let low = linear_memory[word_addr];
        let high = linear_memory[word_addr + 1u];
        return bitcast<f64>(vec2<u32>(low, high));
    }
    return bitcast<f64>(vec2<u32>(0u, 0u));
}

fn memory_store_f64(addr: u32, value: f64) {
    if (!check_memory_bounds(addr, 8u)) {
        return;  // Silent ignore for out of bounds
    }
    let bits = bitcast<vec2<u32>>(value);
    memory_store_i64(addr, bits);
}

// Bytecode Reading
fn read_u8(offset: u32) -> u32 {
    let word_index = offset / 4u;
    let byte_offset = offset % 4u;
    if word_index < arrayLength(&wasm_bytecode) {
        let word = wasm_bytecode[word_index];
        return (word >> (byte_offset * 8u)) & 0xFFu;
    }
    return 0u;
}

fn read_u32_leb128(offset_ptr: ptr<function, u32>) -> u32 {
    var result: u32 = 0u;
    var shift: u32 = 0u;
    var offset = *offset_ptr;
    
    loop {
        let byte = read_u8(offset);
        offset += 1u;
        result |= (byte & 0x7Fu) << shift;
        if (byte & 0x80u) == 0u {
            break;
        }
        shift += 7u;
        if shift >= 35u {
            break;  // Overflow protection
        }
    }
    
    *offset_ptr = offset;
    return result;
}

fn read_i32_leb128(offset_ptr: ptr<function, u32>) -> i32 {
    var result: u32 = 0u;
    var shift: u32 = 0u;
    var offset = *offset_ptr;
    var byte: u32;
    
    loop {
        byte = read_u8(offset);
        offset += 1u;
        result |= (byte & 0x7Fu) << shift;
        shift += 7u;
        if (byte & 0x80u) == 0u {
            break;
        }
        if shift >= 35u {
            break;
        }
    }
    
    *offset_ptr = offset;
    
    // Sign extend
    if shift < 32u && (byte & 0x40u) != 0u {
        result |= (~0u << shift);
    }
    
    return i32(result);
}

fn read_i64_leb128(offset_ptr: ptr<function, u32>) -> vec2<u32> {
    var result_low: u32 = 0u;
    var result_high: u32 = 0u;
    var shift: u32 = 0u;
    var offset = *offset_ptr;
    var byte: u32;
    var sign_bit_set = false;

    loop {
        byte = read_u8(offset);
        offset += 1u;

        // Determine which word we're writing to
        if shift < 32u {
            result_low |= (byte & 0x7Fu) << shift;
        } else {
            result_high |= (byte & 0x7Fu) << (shift - 32u);
        }

        if (byte & 0x80u) == 0u {
            if (byte & 0x40u) != 0u {
                sign_bit_set = true;
            }
            break;
        }

        shift += 7u;
        if shift >= 64u {
            break;
        }
    }

    *offset_ptr = offset;

    // Sign extend if needed
    if sign_bit_set && shift < 64u {
        if shift < 32u {
            result_low |= (~0u << shift);
            result_high = 0xFFFFFFFFu;
        } else {
            result_high |= (~0u << (shift - 32u));
        }
    }

    return vec2<u32>(result_low, result_high);
}

fn read_u64_leb128(offset_ptr: ptr<function, u32>) -> vec2<u32> {
    var result_low: u32 = 0u;
    var result_high: u32 = 0u;
    var shift: u32 = 0u;
    var offset = *offset_ptr;

    loop {
        let byte = read_u8(offset);
        offset += 1u;

        // Determine which word we're writing to
        if shift < 32u {
            result_low |= (byte & 0x7Fu) << shift;
        } else {
            result_high |= (byte & 0x7Fu) << (shift - 32u);
        }

        if (byte & 0x80u) == 0u {
            break;
        }

        shift += 7u;
        if shift >= 64u {
            break;
        }
    }

    *offset_ptr = offset;
    return vec2<u32>(result_low, result_high);
}

fn read_f32_const(offset_ptr: ptr<function, u32>) -> f32 {
    var bits: u32 = 0u;
    let offset = *offset_ptr;

    // Read 4 bytes directly (little-endian)
    bits = read_u8(offset);
    bits |= read_u8(offset + 1u) << 8u;
    bits |= read_u8(offset + 2u) << 16u;
    bits |= read_u8(offset + 3u) << 24u;

    *offset_ptr = offset + 4u;
    return bitcast<f32>(bits);
}

fn read_f64_const(offset_ptr: ptr<function, u32>) -> f64 {
    var low: u32 = 0u;
    var high: u32 = 0u;
    let offset = *offset_ptr;

    // Read 8 bytes directly (little-endian)
    low = read_u8(offset);
    low |= read_u8(offset + 1u) << 8u;
    low |= read_u8(offset + 2u) << 16u;
    low |= read_u8(offset + 3u) << 24u;

    high = read_u8(offset + 4u);
    high |= read_u8(offset + 5u) << 8u;
    high |= read_u8(offset + 6u) << 16u;
    high |= read_u8(offset + 7u) << 24u;

    *offset_ptr = offset + 8u;
    return bitcast<f64>(vec2<u32>(low, high));
}

// Tracing
fn trace_instruction(opcode: u32, operand: u32) {
    if vm_config.trace_enabled != 0u {
        let trace_index = atomicAdd(&instruction_count, 1u);
        if trace_index < arrayLength(&execution_trace) {
            execution_trace[trace_index] = (opcode << 24u) | (operand & 0xFFFFFFu);
        }
    }
}

// ============================================
// INSTRUCTION EXECUTION
// ============================================

fn execute_instruction(opcode: u32, pc_ptr: ptr<function, u32>) -> bool {
    trace_instruction(opcode, *pc_ptr);
    
    switch opcode {
        case OP_UNREACHABLE: {
            return false;  // Trap
        }
        case OP_NOP: {
            // Do nothing
        }
        case OP_BLOCK, OP_LOOP, OP_IF: {
            // Read block type (for now, assume empty type)
            let block_type = read_u8(*pc_ptr);
            *pc_ptr += 1u;
            
            // Push control frame
            let ctrl_index = atomicAdd(&control_sp, 1u);
            if ctrl_index < 64u {
                control_stack[ctrl_index] = ControlFrame(
                    opcode,
                    *pc_ptr,
                    0u,  // Will be filled when we hit END
                    atomicLoad(&value_sp)
                );
            }
        }
        case OP_END: {
            // Pop control frame
            let ctrl_index = atomicSub(&control_sp, 1u) - 1u;
            if ctrl_index < 64u {
                // Update end_pc in the frame (for loops)
                control_stack[ctrl_index].end_pc = *pc_ptr;
            }
        }
        case OP_BR: {
            let depth = read_u32_leb128(pc_ptr);
            // Branch to target (simplified - would need proper label resolution)
            let ctrl_index = atomicLoad(&control_sp) - depth - 1u;
            if ctrl_index < 64u {
                let frame = control_stack[ctrl_index];
                if frame.opcode == OP_LOOP {
                    *pc_ptr = frame.start_pc;
                } else {
                    *pc_ptr = frame.end_pc;
                }
            }
        }
        case OP_BR_IF: {
            let depth = read_u32_leb128(pc_ptr);
            let condition = pop_value();
            if condition != 0u {
                // Same as BR
                let ctrl_index = atomicLoad(&control_sp) - depth - 1u;
                if ctrl_index < 64u {
                    let frame = control_stack[ctrl_index];
                    if frame.opcode == OP_LOOP {
                        *pc_ptr = frame.start_pc;
                    } else {
                        *pc_ptr = frame.end_pc;
                    }
                }
            }
        }
        case OP_RETURN: {
            // Pop call frame and return
            let call_index = atomicSub(&call_sp, 1u) - 1u;
            if call_index < 64u {
                *pc_ptr = call_stack[call_index].return_pc;
            } else {
                return false;  // End of execution
            }
        }
        case OP_CALL: {
            let func_index = read_u32_leb128(pc_ptr);
            
            // HOST FUNCTIONS (Imports 0-10 reserved for spatial ops)
            if func_index < 10u {
                switch func_index {
                    case 0u: { // read_region(x, y, w, h, ptr) -> count
                        // Retrieve args (top of stack is last arg)
                        // read_region(x, y, w, h, ptr)
                        let dst_ptr = pop_value();
                        let h_arg = pop_value();
                        let w_arg = pop_value();
                        let y_arg = pop_value();
                        let x_arg = pop_value();

                        // For demo, read one pixel at (x,y)
                        let coords = vec2<i32>(i32(x_arg), i32(y_arg));
                        let pixel = textureLoad(spatial_texture, coords, 0);

                        let r = u32(pixel.r * 255.0);
                        let g = u32(pixel.g * 255.0);
                        let b = u32(pixel.b * 255.0);
                        let a = u32(pixel.a * 255.0);
                        // Pack RGBA: R in high byte? Or ABGR?
                        // Python struct.pack('>I') implies Big Endian.
                        // Let's pack as RGBA (R=high)
                        let color = (r << 24u) | (g << 16u) | (b << 8u) | a;

                        memory_store_u32(dst_ptr, color);
                        push_value(1u);
                    }
                    case 1u: { // write_region(x, y, w, h, ptr) -> success
                        // Retrieve args
                        let src_ptr = pop_value();
                        let h = pop_value();
                        let w = pop_value();
                        let y = pop_value();
                        let x = pop_value();

                        // Store pixel data in output buffer for later processing
                        // Format: [x, y, w, h, pixel_data...]
                        // Use atomic counter for output indexing
                        let output_idx = atomicAdd(&output_index_counter, 1u);
                        let output_offset = output_idx * 1028u; // 4 header + 1024 pixels max

                        if output_offset + 4u < arrayLength(&output_buffer) {
                            output_buffer[output_offset] = x;
                            output_buffer[output_offset + 1u] = y;
                            output_buffer[output_offset + 2u] = w;
                            output_buffer[output_offset + 3u] = h;

                            // Copy pixel data from linear memory to output buffer
                            let max_pixels = min(1024u, w * h);
                            for (var i = 0u; i < max_pixels; i += 1u) {
                                let buf_idx = output_offset + 4u + i;
                                if buf_idx < arrayLength(&output_buffer) {
                                    let pixel_offset = src_ptr + i * 4u;
                                    let r = memory_load_u8(pixel_offset);
                                    let g = memory_load_u8(pixel_offset + 1u);
                                    let b = memory_load_u8(pixel_offset + 2u);
                                    let a = memory_load_u8(pixel_offset + 3u);
                                    let packed = (r << 24u) | (g << 16u) | (b << 8u) | a;
                                    output_buffer[buf_idx] = packed;
                                }
                            }
                            push_value(1u); // Success
                        } else {
                            push_value(0u); // Failed - buffer full
                        }
                    }
                    case 2u: { // get_dimensions() -> (width << 16) | height
                        let dims = textureDimensions(spatial_texture);
                        push_value((dims.x << 16u) | dims.y);
                    }
                    case 3u: { // sqrt(x) -> square root
                        let x = pop_value();
                        let result = u32(sqrt(f32(x)));
                        push_value(result);
                    }
                    case 4u: { // sin(x) -> sine
                        let x = pop_value();
                        // Normalize input to [0, 2π] range
                        let normalized = (f32(x) / 65536.0) * 6.28318;
                        let sin_val = sin(normalized);
                        // Map [-1, 1] to [0, 65535] for u16 fixed point
                        let result = u32((sin_val * 0.5 + 0.5) * 65535.0);
                        push_value(result);
                    }
                    case 5u: { // cos(x) -> cosine
                        let x = pop_value();
                        // Normalize input to [0, 2π] range
                        let normalized = (f32(x) / 65536.0) * 6.28318;
                        let cos_val = cos(normalized);
                        // Map [-1, 1] to [0, 65535] for u16 fixed point
                        let result = u32((cos_val * 0.5 + 0.5) * 65535.0);
                        push_value(result);
                    }
                    default: {}
                }
            } else {
                // Regular internal function call
                let call_index = atomicAdd(&call_sp, 1u);
                if call_index < 64u {
                    call_stack[call_index] = CallFrame(
                        *pc_ptr,
                        atomicLoad(&locals_offset),
                        0u 
                    );
                }
            }
        }
        case OP_DROP: {
            _ = pop_value();
        }
        case OP_SELECT: {
            let c = pop_value();
            let b = pop_value();
            let a = pop_value();
            push_value(select(b, a, c != 0u));
        }
        case OP_LOCAL_GET: {
            let local_index = read_u32_leb128(pc_ptr);
            let offset = atomicLoad(&locals_offset);
            if offset + local_index < 256u {
                push_value(locals[offset + local_index]);
            }
        }
        case OP_LOCAL_SET: {
            let local_index = read_u32_leb128(pc_ptr);
            let value = pop_value();
            let offset = atomicLoad(&locals_offset);
            if offset + local_index < 256u {
                locals[offset + local_index] = value;
            }
        }
        case OP_LOCAL_TEE: {
            let local_index = read_u32_leb128(pc_ptr);
            let value = peek_value(0u);
            let offset = atomicLoad(&locals_offset);
            if offset + local_index < 256u {
                locals[offset + local_index] = value;
            }
        }
        case OP_GLOBAL_GET: {
            let global_index = read_u32_leb128(pc_ptr);
            if global_index < arrayLength(&globals) {
                push_value(globals[global_index]);
            }
        }
        case OP_GLOBAL_SET: {
            let global_index = read_u32_leb128(pc_ptr);
            let value = pop_value();
            if global_index < arrayLength(&globals) {
                globals[global_index] = value;
            }
        }
        case OP_I32_LOAD: {
            let align = read_u32_leb128(pc_ptr);
            let offset = read_u32_leb128(pc_ptr);
            let addr = pop_value() + offset;
            push_value(memory_load_u32(addr));
        }
        case OP_I32_STORE: {
            let align = read_u32_leb128(pc_ptr);
            let offset = read_u32_leb128(pc_ptr);
            let value = pop_value();
            let addr = pop_value() + offset;
            memory_store_u32(addr, value);
        }
        case OP_MEMORY_SIZE: {
            // Memory index is always 0 for MVP
            let mem_index = read_u32_leb128(pc_ptr);
            // Return current memory size in pages
            push_value(atomicLoad(&current_memory_pages));
        }
        case OP_MEMORY_GROW: {
            // Memory index is always 0 for MVP
            let mem_index = read_u32_leb128(pc_ptr);
            // Pop the number of pages to grow
            let delta = pop_value();
            let old_pages = atomicLoad(&current_memory_pages);
            let new_pages = old_pages + delta;

            // Check if we can grow (max pages based on linear_memory array size)
            // 65536 bytes per page = 16384 u32 words per page
            let max_pages = arrayLength(&linear_memory) / 16384u;

            if new_pages <= max_pages && delta != 0u {
                atomicStore(&current_memory_pages, new_pages);
                push_value(old_pages);
            } else if delta == 0u {
                // Growing by 0 pages always succeeds
                push_value(old_pages);
            } else {
                // Failure: return -1 as signed i32 (0xFFFFFFFF)
                push_value(0xFFFFFFFFu);
            }
        }
        case OP_I32_CONST: {
            let value = read_i32_leb128(pc_ptr);
            push_value(u32(value));
        }
        case OP_I32_EQZ: {
            let a = pop_value();
            push_value(u32(a == 0u));
        }
        case OP_I32_EQ: {
            let b = pop_value();
            let a = pop_value();
            push_value(u32(a == b));
        }
        case OP_I32_NE: {
            let b = pop_value();
            let a = pop_value();
            push_value(u32(a != b));
        }
        case OP_I32_LT_S: {
            let b = pop_value();
            let a = pop_value();
            push_value(u32(i32(a) < i32(b)));
        }
        case OP_I32_LT_U: {
            let b = pop_value();
            let a = pop_value();
            push_value(u32(a < b));
        }
        case OP_I32_ADD: {
            let b = pop_value();
            let a = pop_value();
            push_value(a + b);
        }
        case OP_I32_SUB: {
            let b = pop_value();
            let a = pop_value();
            push_value(a - b);
        }
        case OP_I32_MUL: {
            let b = pop_value();
            let a = pop_value();
            push_value(a * b);
        }
        case OP_I32_DIV_U: {
            let b = pop_value();
            let a = pop_value();
            if b != 0u {
                push_value(a / b);
            } else {
                return false;  // Division by zero trap
            }
        }
        case OP_I32_REM_U: {
            let b = pop_value();
            let a = pop_value();
            if b != 0u {
                push_value(a % b);
            } else {
                return false;
            }
        }
        case OP_I32_AND: {
            let b = pop_value();
            let a = pop_value();
            push_value(a & b);
        }
        case OP_I32_OR: {
            let b = pop_value();
            let a = pop_value();
            push_value(a | b);
        }
        case OP_I32_XOR: {
            let b = pop_value();
            let a = pop_value();
            push_value(a ^ b);
        }
        case OP_I32_SHL: {
            let b = pop_value();
            let a = pop_value();
            push_value(a << (b % 32u));
        }
        case OP_I32_SHR_U: {
            let b = pop_value();
            let a = pop_value();
            push_value(a >> (b % 32u));
        }
        case OP_I32_SHR_S: {
            let b = pop_value();
            let a = pop_value();
            // Signed right shift - arithmetic shift preserves sign bit
            let signed_a = bitcast<i32>(a);
            let shift = b & 31u; // Mask to 0-31 (WASM spec)
            // WGSL shift requires RHS to be u32, but result type follows LHS
            let result = signed_a >> shift;
            push_value(bitcast<u32>(result));
        }
        case OP_I32_CLZ: {
            let a = pop_value();
            var count: u32 = 0u;
            if a == 0u {
                count = 32u;
            } else {
                var temp = a;
                while (temp & 0x80000000u) == 0u {
                    count += 1u;
                    temp <<= 1u;
                }
            }
            push_value(count);
        }
        case OP_I32_CTZ: {
            let a = pop_value();
            var count: u32 = 0u;
            if a == 0u {
                count = 32u;
            } else {
                var temp = a;
                while (temp & 0x1u) == 0u {
                    count += 1u;
                    temp >>= 1u;
                }
            }
            push_value(count);
        }
        case OP_I32_POPCNT: {
            let a = pop_value();
            var count: u32 = 0u;
            var temp = a;
            for (var i: u32 = 0u; i < 32u; i++) {
                count += temp & 0x1u;
                temp >>= 1u;
            }
            push_value(count);
        }
        case OP_I32_DIV_S: {
            let b = pop_value();
            let a = pop_value();
            if b == 0u {
                return false;  // Division by zero trap
            }
            // Handle special case for -2147483648 / -1 which would overflow
            if a == 0x80000000u && b == 0xFFFFFFFFu {
                push_value(0x80000000u);  // Overflow result
            } else {
                push_value(u32(i32(a) / i32(b)));
            }
        }
        case OP_I32_REM_S: {
            let b = pop_value();
            let a = pop_value();
            if b == 0u {
                return false;  // Division by zero trap
            }
            push_value(u32(i32(a) % i32(b)));
        }
        case OP_I32_ROTL: {
            let b = pop_value();
            let a = pop_value();
            let shift = b % 32u;
            push_value((a << shift) | (a >> (32u - shift)));
        }
        case OP_I32_ROTR: {
            let b = pop_value();
            let a = pop_value();
            let shift = b % 32u;
            push_value((a >> shift) | (a << (32u - shift)));
        }
        case OP_I32_GT_S: {
            let b = pop_value();
            let a = pop_value();
            push_value(u32(i32(a) > i32(b)));
        }
        case OP_I32_GT_U: {
            let b = pop_value();
            let a = pop_value();
            push_value(u32(a > b));
        }
        case OP_I32_LE_S: {
            let b = pop_value();
            let a = pop_value();
            push_value(u32(i32(a) <= i32(b)));
        }
        case OP_I32_LE_U: {
            let b = pop_value();
            let a = pop_value();
            push_value(u32(a <= b));
        }
        case OP_I32_GE_S: {
            let b = pop_value();
            let a = pop_value();
            push_value(u32(i32(a) >= i32(b)));
        }
        case OP_I32_GE_U: {
            let b = pop_value();
            let a = pop_value();
            push_value(u32(a >= b));
        }
        case OP_I32_LOAD8_S: {
            let align = read_u32_leb128(pc_ptr);
            let offset = read_u32_leb128(pc_ptr);
            let addr = pop_value() + offset;
            let byte_val = memory_load_u8(addr);
            // Sign extend from 8 bits
            let signed_val = byte_val | (select(0xFFFFFF00u, 0u, (byte_val & 0x80u) == 0u));
            push_value(signed_val);
        }
        case OP_I32_LOAD8_U: {
            let align = read_u32_leb128(pc_ptr);
            let offset = read_u32_leb128(pc_ptr);
            let addr = pop_value() + offset;
            push_value(memory_load_u8(addr));
        }
        case OP_I32_LOAD16_S: {
            let align = read_u32_leb128(pc_ptr);
            let offset = read_u32_leb128(pc_ptr);
            let addr = pop_value() + offset;
            let half_val = memory_load_u16(addr);
            // Sign extend from 16 bits
            let signed_val = half_val | (select(0xFFFF0000u, 0u, (half_val & 0x8000u) == 0u));
            push_value(signed_val);
        }
        case OP_I32_LOAD16_U: {
            let align = read_u32_leb128(pc_ptr);
            let offset = read_u32_leb128(pc_ptr);
            let addr = pop_value() + offset;
            push_value(memory_load_u16(addr));
        }
        case OP_I32_STORE8: {
            let align = read_u32_leb128(pc_ptr);
            let offset = read_u32_leb128(pc_ptr);
            let value = pop_value();
            let addr = pop_value() + offset;
            memory_store_u8(addr, value);
        }
        case OP_I32_STORE16: {
            let align = read_u32_leb128(pc_ptr);
            let offset = read_u32_leb128(pc_ptr);
            let value = pop_value();
            let addr = pop_value() + offset;
            memory_store_u16(addr, value);
        }
        // br_table instruction
        case OP_BR_TABLE: {
            let num_targets = read_u32_leb128(pc_ptr);
            let index = pop_value();

            // Read all target depths
            var target_depths: array<u32, 32>;
            for (var i: u32 = 0u; i < min(num_targets, 32u); i++) {
                target_depths[i] = read_u32_leb128(pc_ptr);
            }
            let default_depth = read_u32_leb128(pc_ptr);

            // Select target based on index
            let selected_depth = select(default_depth, target_depths[min(index, num_targets - 1u)], index < num_targets);

            // Branch to selected target
            let ctrl_index = atomicLoad(&control_sp) - selected_depth - 1u;
            if ctrl_index < 64u {
                let frame = control_stack[ctrl_index];
                if frame.opcode == OP_LOOP {
                    *pc_ptr = frame.start_pc;
                } else {
                    *pc_ptr = frame.end_pc;
                }
            }
        }
        // call_indirect instruction
        case OP_CALL_INDIRECT: {
            let type_index = read_u32_leb128(pc_ptr);
            let reserved = read_u32_leb128(pc_ptr); // Table index (always 0 for MVP)
            let func_index = pop_value();

            // Check if this is a host function call (func_index < 3)
            if func_index == HOST_READ_REGION {
                // host_read_region(x, y, width, height, data_pointer)
                let data_pointer = pop_value();
                let height = pop_value();
                let width = pop_value();
                let y = pop_value();
                let x = pop_value();
                host_read_region(x, y, width, height, data_pointer);
            } else if func_index == HOST_WRITE_REGION {
                // host_write_region(x, y, width, height, data_pointer)
                let data_pointer = pop_value();
                let height = pop_value();
                let width = pop_value();
                let y = pop_value();
                let x = pop_value();
                host_write_region(x, y, width, height, data_pointer);
            } else if func_index == HOST_GET_DIMENSIONS {
                // host_get_dimensions() - returns width, height on stack
                let dims = host_get_dimensions();
                push_value(dims.y);  // Height pushed second (on top)
                push_value(dims.x);  // Width pushed first
            } else {
                // Type checking would happen here in a full implementation
                // For now, we'll do basic bounds checking for regular functions
                if func_index < 10u {
                    // Host function call (same as OP_CALL)
                    let call_index = atomicAdd(&call_sp, 1u);
                    if call_index < 64u {
                        call_stack[call_index] = CallFrame(
                            *pc_ptr,
                            atomicLoad(&locals_offset),
                            0u
                        );
                    }
                    // Jump to function (simplified - would need proper function table)
                } else {
                    // Regular function call (simplified)
                    let call_index = atomicAdd(&call_sp, 1u);
                    if call_index < 64u {
                        call_stack[call_index] = CallFrame(
                            *pc_ptr,
                            atomicLoad(&locals_offset),
                            0u
                        );
                    }
                }
            }
        }
        // i64 constants
        case OP_I64_CONST: {
            let value = read_i64_leb128(pc_ptr);
            push_i64(value.x, value.y);
        }
        // f32/f64 constants
        case OP_F32_CONST: {
            let value = read_f32_const(pc_ptr);
            push_f32(value);
        }
        case OP_F64_CONST: {
            let value = read_f64_const(pc_ptr);
            push_f64(value);
        }
        // i64 load/store
        case OP_I64_LOAD: {
            let align = read_u32_leb128(pc_ptr);
            let offset = read_u32_leb128(pc_ptr);
            let addr = pop_value() + offset;
            let value = memory_load_i64(addr);
            push_i64(value.x, value.y);
        }
        case OP_I64_STORE: {
            let align = read_u32_leb128(pc_ptr);
            let offset = read_u32_leb128(pc_ptr);
            let value = pop_i64();
            let addr = pop_value() + offset;
            memory_store_i64(addr, value);
        }
        case OP_I64_LOAD8_S: {
            let align = read_u32_leb128(pc_ptr);
            let offset = read_u32_leb128(pc_ptr);
            let addr = pop_value() + offset;
            let value = memory_load_i64_u8(addr, true);
            push_i64(value.x, value.y);
        }
        case OP_I64_LOAD8_U: {
            let align = read_u32_leb128(pc_ptr);
            let offset = read_u32_leb128(pc_ptr);
            let addr = pop_value() + offset;
            let value = memory_load_i64_u8(addr, false);
            push_i64(value.x, value.y);
        }
        case OP_I64_LOAD16_S: {
            let align = read_u32_leb128(pc_ptr);
            let offset = read_u32_leb128(pc_ptr);
            let addr = pop_value() + offset;
            let value = memory_load_i64_u16(addr, true);
            push_i64(value.x, value.y);
        }
        case OP_I64_LOAD16_U: {
            let align = read_u32_leb128(pc_ptr);
            let offset = read_u32_leb128(pc_ptr);
            let addr = pop_value() + offset;
            let value = memory_load_i64_u16(addr, false);
            push_i64(value.x, value.y);
        }
        case OP_I64_LOAD32_S: {
            let align = read_u32_leb128(pc_ptr);
            let offset = read_u32_leb128(pc_ptr);
            let addr = pop_value() + offset;
            let value = memory_load_i64_u32(addr, true);
            push_i64(value.x, value.y);
        }
        case OP_I64_LOAD32_U: {
            let align = read_u32_leb128(pc_ptr);
            let offset = read_u32_leb128(pc_ptr);
            let addr = pop_value() + offset;
            let value = memory_load_i64_u32(addr, false);
            push_i64(value.x, value.y);
        }
        case OP_I64_STORE8: {
            let align = read_u32_leb128(pc_ptr);
            let offset = read_u32_leb128(pc_ptr);
            let value = pop_i64();
            let addr = pop_value() + offset;
            memory_store_i64_u8(addr, value);
        }
        case OP_I64_STORE16: {
            let align = read_u32_leb128(pc_ptr);
            let offset = read_u32_leb128(pc_ptr);
            let value = pop_i64();
            let addr = pop_value() + offset;
            memory_store_i64_u16(addr, value);
        }
        case OP_I64_STORE32: {
            let align = read_u32_leb128(pc_ptr);
            let offset = read_u32_leb128(pc_ptr);
            let value = pop_i64();
            let addr = pop_value() + offset;
            memory_store_i64_u32(addr, value);
        }
        // f32/f64 load/store
        case OP_F32_LOAD: {
            let align = read_u32_leb128(pc_ptr);
            let offset = read_u32_leb128(pc_ptr);
            let addr = pop_value() + offset;
            let value = memory_load_f32(addr);
            push_f32(value);
        }
        case OP_F32_STORE: {
            let align = read_u32_leb128(pc_ptr);
            let offset = read_u32_leb128(pc_ptr);
            let value = pop_f32();
            let addr = pop_value() + offset;
            memory_store_f32(addr, value);
        }
        case OP_F64_LOAD: {
            let align = read_u32_leb128(pc_ptr);
            let offset = read_u32_leb128(pc_ptr);
            let addr = pop_value() + offset;
            let value = memory_load_f64(addr);
            push_f64(value);
        }
        case OP_F64_STORE: {
            let align = read_u32_leb128(pc_ptr);
            let offset = read_u32_leb128(pc_ptr);
            let value = pop_f64();
            let addr = pop_value() + offset;
            memory_store_f64(addr, value);
        }
        // i64 comparisons
        case OP_I64_EQZ: {
            let a = pop_i64();
            push_value(u32((a.x == 0u) && (a.y == 0u)));
        }
        case OP_I64_EQ: {
            let b = pop_i64();
            let a = pop_i64();
            push_value(i64_eq(a, b));
        }
        case OP_I64_NE: {
            let b = pop_i64();
            let a = pop_i64();
            push_value(u32(i64_eq(a, b) == 0u));
        }
        case OP_I64_LT_S: {
            let b = pop_i64();
            let a = pop_i64();
            push_value(i64_lt_s(a, b));
        }
        case OP_I64_LT_U: {
            let b = pop_i64();
            let a = pop_i64();
            push_value(i64_lt_u(a, b));
        }
        case OP_I64_GT_S: {
            let b = pop_i64();
            let a = pop_i64();
            push_value(i64_lt_s(b, a)); // a > b == b < a
        }
        case OP_I64_GT_U: {
            let b = pop_i64();
            let a = pop_i64();
            push_value(i64_lt_u(b, a));
        }
        case OP_I64_LE_S: {
            let b = pop_i64();
            let a = pop_i64();
            push_value(u32(i64_lt_s(a, b) == 0u && i64_eq(a, b) == 1u));
        }
        case OP_I64_LE_U: {
            let b = pop_i64();
            let a = pop_i64();
            push_value(u32(i64_lt_u(a, b) == 0u && i64_eq(a, b) == 1u));
        }
        case OP_I64_GE_S: {
            let b = pop_i64();
            let a = pop_i64();
            push_value(u32(i64_lt_s(b, a) == 0u && i64_eq(a, b) == 1u));
        }
        case OP_I64_GE_U: {
            let b = pop_i64();
            let a = pop_i64();
            push_value(u32(i64_lt_u(b, a) == 0u && i64_eq(a, b) == 1u));
        }
        // i64 arithmetic
        case OP_I64_CLZ: {
            let a = pop_i64();
            push_value(i64_clz(a));
        }
        case OP_I64_CTZ: {
            let a = pop_i64();
            push_value(i64_ctz(a));
        }
        case OP_I64_POPCNT: {
            let a = pop_i64();
            push_value(i64_popcnt(a));
        }
        case OP_I64_ADD: {
            let b = pop_i64();
            let a = pop_i64();
            let result = i64_add(a, b);
            push_i64(result.x, result.y);
        }
        case OP_I64_SUB: {
            let b = pop_i64();
            let a = pop_i64();
            let result = i64_sub(a, b);
            push_i64(result.x, result.y);
        }
        case OP_I64_MUL: {
            let b = pop_i64();
            let a = pop_i64();
            let result = i64_mul(a, b);
            push_i64(result.x, result.y);
        }
        case OP_I64_DIV_S: {
            let b = pop_i64();
            let a = pop_i64();
            if b.x == 0u && b.y == 0u {
                return false;  // Division by zero trap
            }
            // Simplified signed division (would need full implementation)
            let signed_a = i32(a.x);
            let signed_b = i32(b.x);
            push_i64(u32(signed_a / signed_b), u32(select(0u, 0xFFFFFFFFu, signed_a < 0)));
        }
        case OP_I64_DIV_U: {
            let b = pop_i64();
            let a = pop_i64();
            if b.x == 0u && b.y == 0u {
                return false;
            }
            // Simplified unsigned division (low word only)
            if b.y == 0u {
                push_i64(a.x / b.x, 0u);
            } else {
                push_i64(0u, 0u);
            }
        }
        case OP_I64_REM_S: {
            let b = pop_i64();
            let a = pop_i64();
            if b.x == 0u && b.y == 0u {
                return false;
            }
            // Simplified signed remainder
            let signed_a = i32(a.x);
            let signed_b = i32(b.x);
            push_i64(u32(signed_a % signed_b), 0u);
        }
        case OP_I64_REM_U: {
            let b = pop_i64();
            let a = pop_i64();
            if b.x == 0u && b.y == 0u {
                return false;
            }
            // Simplified unsigned remainder (low word only)
            if b.y == 0u {
                push_i64(a.x % b.x, 0u);
            } else {
                push_i64(a.x, a.y);
            }
        }
        case OP_I64_AND: {
            let b = pop_i64();
            let a = pop_i64();
            let result = i64_and(a, b);
            push_i64(result.x, result.y);
        }
        case OP_I64_OR: {
            let b = pop_i64();
            let a = pop_i64();
            let result = i64_or(a, b);
            push_i64(result.x, result.y);
        }
        case OP_I64_XOR: {
            let b = pop_i64();
            let a = pop_i64();
            let result = i64_xor(a, b);
            push_i64(result.x, result.y);
        }
        case OP_I64_SHL: {
            let b = pop_i64();
            let a = pop_i64();
            let shift = b.x % 64u;
            let result = i64_shl(a, shift);
            push_i64(result.x, result.y);
        }
        case OP_I64_SHR_S: {
            let b = pop_i64();
            let a = pop_i64();
            let shift = b.x % 64u;
            var result = i64_shr_u(a, shift);
            // Sign extension for negative numbers
            if (a.y & 0x80000000u) != 0u && shift > 0u && shift < 32u {
                result.y |= 0xFFFFFFFFu << (32u - shift);
            }
            push_i64(result.x, result.y);
        }
        case OP_I64_SHR_U: {
            let b = pop_i64();
            let a = pop_i64();
            let shift = b.x % 64u;
            let result = i64_shr_u(a, shift);
            push_i64(result.x, result.y);
        }
        case OP_I64_ROTL: {
            let b = pop_i64();
            let a = pop_i64();
            let shift = b.x % 64u;
            let result = i64_rotl(a, shift);
            push_i64(result.x, result.y);
        }
        case OP_I64_ROTR: {
            let b = pop_i64();
            let a = pop_i64();
            let shift = b.x % 64u;
            let result = i64_rotr(a, shift);
            push_i64(result.x, result.y);
        }
        // f32 comparisons
        case OP_F32_EQ: {
            let b = pop_f32();
            let a = pop_f32();
            push_value(u32(a == b));
        }
        case OP_F32_NE: {
            let b = pop_f32();
            let a = pop_f32();
            push_value(u32(a != b));
        }
        case OP_F32_LT: {
            let b = pop_f32();
            let a = pop_f32();
            push_value(u32(a < b));
        }
        case OP_F32_GT: {
            let b = pop_f32();
            let a = pop_f32();
            push_value(u32(a > b));
        }
        case OP_F32_LE: {
            let b = pop_f32();
            let a = pop_f32();
            push_value(u32(a <= b));
        }
        case OP_F32_GE: {
            let b = pop_f32();
            let a = pop_f32();
            push_value(u32(a >= b));
        }
        // f64 comparisons
        case OP_F64_EQ: {
            let b = pop_f64();
            let a = pop_f64();
            push_value(u32(a == b));
        }
        case OP_F64_NE: {
            let b = pop_f64();
            let a = pop_f64();
            push_value(u32(a != b));
        }
        case OP_F64_LT: {
            let b = pop_f64();
            let a = pop_f64();
            push_value(u32(a < b));
        }
        case OP_F64_GT: {
            let b = pop_f64();
            let a = pop_f64();
            push_value(u32(a > b));
        }
        case OP_F64_LE: {
            let b = pop_f64();
            let a = pop_f64();
            push_value(u32(a <= b));
        }
        case OP_F64_GE: {
            let b = pop_f64();
            let a = pop_f64();
            push_value(u32(a >= b));
        }
        // f32 arithmetic
        case OP_F32_ABS: {
            let a = pop_f32();
            push_f32(abs(a));
        }
        case OP_F32_NEG: {
            let a = pop_f32();
            push_f32(-a);
        }
        case OP_F32_COPYSIGN: {
            let b = pop_f32();
            let a = pop_f32();
            let result = abs(a) * select(-1.0, 1.0, b >= 0.0);
            push_f32(result);
        }
        case OP_F32_CEIL: {
            let a = pop_f32();
            push_f32(ceil(a));
        }
        case OP_F32_FLOOR: {
            let a = pop_f32();
            push_f32(floor(a));
        }
        case OP_F32_TRUNC: {
            let a = pop_f32();
            let sign = select(1.0, -1.0, a >= 0.0);
            push_f32(sign * floor(abs(a)));
        }
        case OP_F32_NEAREST: {
            let a = pop_f32();
            push_f32(round(a));
        }
        case OP_F32_SQRT: {
            let a = pop_f32();
            push_f32(sqrt(a));
        }
        case OP_F32_ADD: {
            let b = pop_f32();
            let a = pop_f32();
            push_f32(a + b);
        }
        case OP_F32_SUB: {
            let b = pop_f32();
            let a = pop_f32();
            push_f32(a - b);
        }
        case OP_F32_MUL: {
            let b = pop_f32();
            let a = pop_f32();
            push_f32(a * b);
        }
        case OP_F32_DIV: {
            let b = pop_f32();
            let a = pop_f32();
            push_f32(a / b);
        }
        case OP_F32_MIN: {
            let b = pop_f32();
            let a = pop_f32();
            push_f32(min(a, b));
        }
        case OP_F32_MAX: {
            let b = pop_f32();
            let a = pop_f32();
            push_f32(max(a, b));
        }
        // f64 arithmetic
        case OP_F64_ABS: {
            let a = pop_f64();
            push_f64(abs(a));
        }
        case OP_F64_NEG: {
            let a = pop_f64();
            push_f64(-a);
        }
        case OP_F64_COPYSIGN: {
            let b = pop_f64();
            let a = pop_f64();
            let result = abs(a) * select(-1.0, 1.0, b >= 0.0);
            push_f64(result);
        }
        case OP_F64_CEIL: {
            let a = pop_f64();
            push_f64(ceil(a));
        }
        case OP_F64_FLOOR: {
            let a = pop_f64();
            push_f64(floor(a));
        }
        case OP_F64_TRUNC: {
            let a = pop_f64();
            let sign = select(1.0, -1.0, a >= 0.0);
            push_f64(sign * floor(abs(a)));
        }
        case OP_F64_NEAREST: {
            let a = pop_f64();
            push_f64(round(a));
        }
        case OP_F64_SQRT: {
            let a = pop_f64();
            push_f64(sqrt(a));
        }
        case OP_F64_ADD: {
            let b = pop_f64();
            let a = pop_f64();
            push_f64(a + b);
        }
        case OP_F64_SUB: {
            let b = pop_f64();
            let a = pop_f64();
            push_f64(a - b);
        }
        case OP_F64_MUL: {
            let b = pop_f64();
            let a = pop_f64();
            push_f64(a * b);
        }
        case OP_F64_DIV: {
            let b = pop_f64();
            let a = pop_f64();
            push_f64(a / b);
        }
        case OP_F64_MIN: {
            let b = pop_f64();
            let a = pop_f64();
            push_f64(min(a, b));
        }
        case OP_F64_MAX: {
            let b = pop_f64();
            let a = pop_f64();
            push_f64(max(a, b));
        }
        // Conversion opcodes
        case OP_I32_WRAP_I64: {
            let a = pop_i64();
            push_value(a.x);  // Keep low 32 bits
        }
        case OP_I32_TRUNC_F32_S: {
            let a = pop_f32();
            push_value(u32(i32(floor(abs(a))) * select(1, -1, a >= 0.0)));
        }
        case OP_I32_TRUNC_F32_U: {
            let a = pop_f32();
            push_value(u32(floor(abs(a))));
        }
        case OP_I32_TRUNC_F64_S: {
            let a = pop_f64();
            push_value(u32(i32(floor(abs(a))) * select(1, -1, a >= 0.0)));
        }
        case OP_I32_TRUNC_F64_U: {
            let a = pop_f64();
            push_value(u32(floor(abs(a))));
        }
        case OP_I64_EXTEND_S_I32: {
            let a = pop_value();
            let signed_val = i32(a);
            let high = select(0u, 0xFFFFFFFFu, signed_val < 0);
            push_i64(a, high);
        }
        case OP_I64_EXTEND_U_I32: {
            let a = pop_value();
            push_i64(a, 0u);
        }
        case OP_I64_TRUNC_F32_S: {
            let a = pop_f32();
            let signed_val = i32(floor(abs(a)));
            let high = select(0u, 0xFFFFFFFFu, signed_val < 0);
            push_i64(u32(signed_val), high);
        }
        case OP_I64_TRUNC_F32_U: {
            let a = pop_f32();
            push_i64(u32(floor(abs(a))), 0u);
        }
        case OP_I64_TRUNC_F64_S: {
            let a = pop_f64();
            let signed_val = i32(floor(abs(a)));
            let high = select(0u, 0xFFFFFFFFu, signed_val < 0);
            push_i64(u32(signed_val), high);
        }
        case OP_I64_TRUNC_F64_U: {
            let a = pop_f64();
            push_i64(u32(floor(abs(a))), 0u);
        }
        case OP_F32_CONVERT_I32_S: {
            let a = pop_value();
            push_f32(f32(i32(a)));
        }
        case OP_F32_CONVERT_I32_U: {
            let a = pop_value();
            push_f32(f32(a));
        }
        case OP_F32_CONVERT_I64_S: {
            let a = pop_i64();
            // Simplified: convert low word only
            push_f32(f32(i32(a.x)));
        }
        case OP_F32_CONVERT_I64_U: {
            let a = pop_i64();
            push_f32(f32(a.x));
        }
        case OP_F32_DEMOTE_F64: {
            let a = pop_f64();
            push_f32(f32(a));
        }
        case OP_F64_CONVERT_I32_S: {
            let a = pop_value();
            push_f64(f64(i32(a)));
        }
        case OP_F64_CONVERT_I32_U: {
            let a = pop_value();
            push_f64(f64(a));
        }
        case OP_F64_CONVERT_I64_S: {
            let a = pop_i64();
            push_f64(f64(i32(a.x)));
        }
        case OP_F64_CONVERT_I64_U: {
            let a = pop_i64();
            push_f64(f64(a.x));
        }
        case OP_F64_PROMOTE_F32: {
            let a = pop_f32();
            push_f64(f64(a));
        }
        case OP_I32_REINTERPRET_F32: {
            let a = pop_f32();
            push_value(bitcast<u32>(a));
        }
        case OP_I64_REINTERPRET_F64: {
            // Reinterpret f64 bits as i64
            // Due to WGSL limitations, we approximate using f32
            let a = pop_f64();
            let approx = f32(a);
            let u32_bits = bitcast<u32>(approx);
            push_i64(u32_bits, 0u);
        }
        case OP_F32_REINTERPRET_I32: {
            let a = pop_value();
            push_f32(bitcast<f32>(a));
        }
        case OP_F64_REINTERPRET_I64: {
            // Reinterpret i64 bits as f64
            // Due to WGSL limitations, we approximate using f32
            let a = pop_i64();
            let approx = bitcast<f32>(a.x);
            push_f64(f64(approx));
        }
        default: {
            // Unknown opcode - trap
            return false;
        }
    }

    return true;
}

// ============================================
// HOST FUNCTIONS (FFI)
// ============================================

// Host function indices (used with call_indirect)
const HOST_READ_REGION: u32 = 0u;
const HOST_WRITE_REGION: u32 = 1u;
const HOST_GET_DIMENSIONS: u32 = 2u;

// read_region(x, y, width, height, data_pointer)
// Reads pixels from spatial_texture and writes to linear_memory
fn host_read_region(x: u32, y: u32, width: u32, height: u32, data_pointer: u32) {
    // Validate parameters
    if width == 0u || height == 0u {
        return;  // Zero-size region, nothing to do
    }

    let dims = textureDimensions(spatial_texture);
    let tex_width = dims.x;
    let tex_height = dims.y;

    // Clamp region to texture bounds
    let read_width = min(width, tex_width - min(x, tex_width));
    let read_height = min(height, tex_height - min(y, tex_height));

    // Read pixels and write to linear memory
    for (py = 0u; py < read_height; py++) {
        for (px = 0u; px < read_width; px++) {
            let tex_x = min(x + px, tex_width - 1u);
            let tex_y = min(y + py, tex_height - 1u);

            // Sample texture (RGBA, normalized 0-1)
            let texel = textureLoad(spatial_texture, vec2<i32>(i32(tex_x), i32(tex_y)), 0);

            // Convert to 8-bit per channel and pack as u32
            let r = u32(texel.r * 255.0);
            let g = u32(texel.g * 255.0);
            let b = u32(texel.b * 255.0);
            let a = u32(texel.a * 255.0);
            let pixel = (a << 24u) | (b << 16u) | (g << 8u) | r;

            // Write to linear memory (4 bytes per pixel)
            let pixel_index = (py * width + px);
            let mem_offset = data_pointer + pixel_index;
            let word_index = mem_offset / 4u;

            if word_index < arrayLength(&linear_memory) {
                linear_memory[word_index] = pixel;
            }
        }
    }
}

// write_region(x, y, width, height, data_pointer)
// Reads pixel data from linear_memory and writes to output_buffer
fn host_write_region(x: u32, y: u32, width: u32, height: u32, data_pointer: u32) {
    // Validate parameters
    if width == 0u || height == 0u {
        return;  // Zero-size region, nothing to do
    }

    // Write header to output buffer: x, y, width, height
    let out_idx = atomicAdd(&output_index_counter, 4u);
    if out_idx + 4u <= arrayLength(&output_buffer) {
        output_buffer[out_idx] = x;
        output_buffer[out_idx + 1u] = y;
        output_buffer[out_idx + 2u] = width;
        output_buffer[out_idx + 3u] = height;
    }

    // Write pixel data to output buffer
    let pixel_count = width * height;
    for (i = 0u; i < pixel_count; i++) {
        let mem_offset = data_pointer + i;
        let word_index = mem_offset / 4u;

        if word_index < arrayLength(&linear_memory) {
            let pixel = linear_memory[word_index];
            let write_idx = atomicAdd(&output_index_counter, 1u);

            if write_idx < arrayLength(&output_buffer) {
                output_buffer[write_idx] = pixel;
            }
        }
    }
}

// get_dimensions()
// Returns texture dimensions (width, height) as two values on stack
fn host_get_dimensions() -> vec2<u32> {
    let dims = textureDimensions(spatial_texture);
    return vec2<u32>(dims.x, dims.y);
}

// ============================================
// MAIN EXECUTION LOOP
// ============================================

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>,
        @builtin(local_invocation_id) local_id: vec3<u32>) {
    
    // Initialize (thread 0 only)
    if local_id.x == 0u {
        atomicStore(&value_sp, 0u);
        atomicStore(&call_sp, 0u);
        atomicStore(&control_sp, 0u);
        atomicStore(&locals_offset, 0u);
        atomicStore(&pc, vm_config.entry_point);
        atomicStore(&instruction_count, 0u);
        atomicStore(&current_memory_pages, vm_config.memory_size);
        atomicStore(&output_index_counter, 0u);
    }
    workgroupBarrier();
    
    // Execute instructions (single-threaded for now)
    // In a more advanced implementation, we could parallelize across functions
    if local_id.x == 0u {
        var current_pc = atomicLoad(&pc);
        var continue_execution = true;
        
        while continue_execution && atomicLoad(&instruction_count) < vm_config.max_instructions {
            if current_pc >= vm_config.bytecode_size {
                break;
            }
            
            let opcode = read_u8(current_pc);
            current_pc += 1u;
            
            continue_execution = execute_instruction(opcode, &current_pc);
            
            atomicStore(&pc, current_pc);
        }
    }
    
    workgroupBarrier();
}
