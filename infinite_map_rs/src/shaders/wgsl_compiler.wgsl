// ═══════════════════════════════════════════════════════════════════════════
// wgsl_compiler.wgsl - Phase 42 Micro-Compiler Kernel
// "The map programs the map."
//
// This shader implements in-pixel WGSL → SPIR-V compilation using a
// dual-channel substrate:
//   - Blue/Alpha (BA): Source WGSL text (UTF-8)
//   - Red/Green (RG): Compiled SPIR-V bytecode (little-endian)
//
// The compilation happens through two passes:
//   Pass 1 (Tokenize): Convert source bytes to token IDs via LUT lookup
//   Pass 2 (Emit): Pattern match tokens and emit SPIR-V instructions
// ═══════════════════════════════════════════════════════════════════════════

// ─────────────────────────────────────────────────────────────────────────────
// Constants
// ─────────────────────────────────────────────────────────────────────────────

const STATUS_CLEAN: u32 = 0u;
const STATUS_DIRTY: u32 = 1u;
const STATUS_COMPILING: u32 = 2u;
const STATUS_ERROR: u32 = 3u;

const TOKEN_INVALID: u32 = 0xFFFFFFFFu;
const TOKEN_EOF: u32 = 0u;
const TOKEN_WHITESPACE: u32 = 1u;
const TOKEN_NEWLINE: u32 = 2u;
const TOKEN_AT: u32 = 3u;           // @
const TOKEN_COMPUTE: u32 = 4u;       // compute
const TOKEN_WORKGROUP_SIZE: u32 = 5u; // workgroup_size
const TOKEN_FN: u32 = 6u;            // fn
const TOKEN_MAIN: u32 = 7u;          // main
const TOKEN_LET: u32 = 8u;           // let
const TOKEN_VAR: u32 = 9u;           // var
const TOKEN_U32: u32 = 10u;          // u32
const TOKEN_I32: u32 = 11u;          // i32
const TOKEN_F32: u32 = 12u;          // f32
const TOKEN_LPAREN: u32 = 13u;       // (
const TOKEN_RPAREN: u32 = 14u;       // )
const TOKEN_LBRACE: u32 = 15u;       // {
const TOKEN_RBRACE: u32 = 16u;       // }
const TOKEN_SEMICOLON: u32 = 17u;    // ;
const TOKEN_COLON: u32 = 18u;        // :
const TOKEN_COMMA: u32 = 19u;        // ,
const TOKEN_EQUALS: u32 = 20u;       // =
const TOKEN_PLUS: u32 = 21u;         // +
const TOKEN_MINUS: u32 = 22u;        // -
const TOKEN_STAR: u32 = 23u;         // *
const TOKEN_SLASH: u32 = 24u;        // /
const TOKEN_NUMBER: u32 = 25u;       // numeric literal
const TOKEN_IDENTIFIER: u32 = 26u;   // identifier

const SPIR_V_MAGIC: u32 = 0x07230203u;
const SPIR_V_VERSION: u32 = 0x00010000u; // SPIR-V 1.0

// Execution Modes
const SPIRV_EXEC_LOCAL_SIZE: u32 = 17u;

// SPIR-V opcodes (subset for Phase 43)
const SPIRV_OP_NOP: u32 = 0u;
const SPIRV_OP_ENTRY_POINT: u32 = 15u;
const SPIRV_OP_EXECUTION_MODE: u32 = 16u;
const SPIRV_OP_TYPE_VOID: u32 = 19u;
const SPIRV_OP_TYPE_INT: u32 = 21u;
const SPIRV_OP_TYPE_FLOAT: u32 = 22u;
const SPIRV_OP_TYPE_VECTOR: u32 = 23u;
const SPIRV_OP_TYPE_FUNCTION: u32 = 33u;
const SPIRV_OP_CONSTANT: u32 = 43u;
const SPIRV_OP_FUNCTION: u32 = 54u;
const SPIRV_OP_FUNCTION_END: u32 = 56u;
const SPIRV_OP_VARIABLE: u32 = 59u;
const SPIRV_OP_LOAD: u32 = 61u;
const SPIRV_OP_STORE: u32 = 62u;
const SPIRV_OP_IADD: u32 = 128u;
const SPIRV_OP_ISUB: u32 = 130u;
const SPIRV_OP_IMUL: u32 = 132u;
const SPIRV_OP_SDIV: u32 = 135u;
const SPIRV_OP_RETURN: u32 = 253u;

// ─────────────────────────────────────────────────────────────────────────────
// Header Structure (matches Rust CompilerHeader)
// Stored in Row 0 of the tile texture
// ─────────────────────────────────────────────────────────────────────────────

struct Header {
    source_len: u32,
    spirv_len: u32,
    status: atomic<u32>,
    hash_hi: u32,
    hash_lo: u32,
    error_pos: atomic<u32>,
}

// ─────────────────────────────────────────────────────────────────────────────
// Resource Bindings
// ─────────────────────────────────────────────────────────────────────────────

@group(0) @binding(0) var tile_tex: texture_storage_2d<rgba8unorm, read_write>;
@group(0) @binding(1) var token_lut: texture_2d<u32>;
@group(0) @binding(2) var template_lut: texture_2d<u32>;
@group(0) @binding(3) var<storage, read_write> header: Header;

// ─────────────────────────────────────────────────────────────────────────────
// Workgroup Shared Memory
// ─────────────────────────────────────────────────────────────────────────────

var<workgroup> shared_tokens: array<u32, 256>;
var<workgroup> shared_error: atomic<u32>;
var<workgroup> workgroup_x: atomic<u32>;
var<workgroup> workgroup_y: atomic<u32>;
var<workgroup> workgroup_z: atomic<u32>;

// ─────────────────────────────────────────────────────────────────────────────
// Helper Functions
// ─────────────────────────────────────────────────────────────────────────────

// Read two bytes from the BA (Blue/Alpha) channel at a linear byte index
fn read_source_bytes(byte_idx: u32) -> vec2<u32> {
    let tile_width = textureDimensions(tile_tex).x;
    
    // Each pixel holds 2 bytes in BA channel
    // Byte 0,1 → pixel 0; Byte 2,3 → pixel 1; etc.
    let pixel_idx = byte_idx / 2u;
    
    // Skip header row (row 0)
    let row = 1u + pixel_idx / tile_width;
    let col = pixel_idx % tile_width;
    
    let pixel = textureLoad(tile_tex, vec2<i32>(i32(col), i32(row)));
    
    // BA channel: Blue = even byte, Alpha = odd byte
    let b = u32(pixel.b * 255.0);
    let a = u32(pixel.a * 255.0);
    
    if (byte_idx % 2u == 0u) {
        return vec2<u32>(b, a);
    } else {
        return vec2<u32>(a, 0u); // Odd index only reads alpha
    }
}

// Write a token ID to the scratch area (reusing unused pixels)
fn write_token(token_idx: u32, token_id: u32) {
    shared_tokens[token_idx % 256u] = token_id;
}

// Read a token from shared memory
fn read_token(token_idx: u32) -> u32 {
    return shared_tokens[token_idx % 256u];
}

// Write SPIR-V word to RG (Red/Green) channel
fn write_spirv_word(word_idx: u32, word: u32) {
    let tile_width = textureDimensions(tile_tex).x;
    
    // Each SPIR-V word (4 bytes) needs 2 pixels (RG of each)
    let pixel_a_idx = word_idx * 2u;
    let pixel_b_idx = word_idx * 2u + 1u;
    
    // Skip header row
    let row_a = 1u + pixel_a_idx / tile_width;
    let col_a = pixel_a_idx % tile_width;
    let row_b = 1u + pixel_b_idx / tile_width;
    let col_b = pixel_b_idx % tile_width;
    
    // Extract bytes from word (little-endian)
    let byte0 = f32(word & 0xFFu) / 255.0;
    let byte1 = f32((word >> 8u) & 0xFFu) / 255.0;
    let byte2 = f32((word >> 16u) & 0xFFu) / 255.0;
    let byte3 = f32((word >> 24u) & 0xFFu) / 255.0;
    
    // Read existing pixels (preserve BA channel)
    var pixel_a = textureLoad(tile_tex, vec2<i32>(i32(col_a), i32(row_a)));
    var pixel_b = textureLoad(tile_tex, vec2<i32>(i32(col_b), i32(row_b)));
    
    // Write RG channels
    pixel_a.r = byte0;
    pixel_a.g = byte1;
    pixel_b.r = byte2;
    pixel_b.g = byte3;
    
    textureStore(tile_tex, vec2<i32>(i32(col_a), i32(row_a)), pixel_a);
    textureStore(tile_tex, vec2<i32>(i32(col_b), i32(row_b)), pixel_b);
}

// Simple FNV-1a hash for change detection
fn compute_hash(byte_idx: u32, max_bytes: u32) -> vec2<u32> {
    var hash: u32 = 2166136261u; // FNV offset basis
    
    for (var i: u32 = 0u; i < max_bytes; i = i + 1u) {
        let bytes = read_source_bytes(i);
        hash = hash ^ bytes.x;
        hash = hash * 16777619u; // FNV prime
        if (bytes.y != 0u) {
            hash = hash ^ bytes.y;
            hash = hash * 16777619u;
        }
    }
    
    // Split into hi/lo for 64-bit-ish storage
    return vec2<u32>(hash, hash ^ 0xDEADBEEFu);
}

// ─────────────────────────────────────────────────────────────────────────────
// Pass 1: Tokenization
// Converts source bytes to token IDs using LUT lookup
// ─────────────────────────────────────────────────────────────────────────────

@compute @workgroup_size(64)
fn pass_tokenize(@builtin(global_invocation_id) gid: vec3<u32>) {
    let idx = gid.x;
    let source_len = header.source_len;
    
    // Thread 0: Check if compilation is needed
    if (idx == 0u) {
        let current_status = atomicLoad(&header.status);
        if (current_status == STATUS_CLEAN) {
            return; // No work needed
        }
        
        // Set to compiling
        atomicStore(&header.status, STATUS_COMPILING);
        atomicStore(&header.error_pos, 0xFFFFFFFFu); // Reset error position
    }
    
    workgroupBarrier();
    
    // Check bounds
    if (idx >= source_len) {
        write_token(idx, TOKEN_EOF);
        return;
    }
    
    // Read byte pair at this position
    let byte_pair = read_source_bytes(idx);
    
    // Look up token in LUT
    let lut_coord = vec2<i32>(i32(byte_pair.x), i32(byte_pair.y));
    let token_id = textureLoad(token_lut, lut_coord, 0).r;
    
    // Check for invalid token
    if (token_id == TOKEN_INVALID) {
        atomicMin(&header.error_pos, idx);
        atomicStore(&header.status, STATUS_ERROR);
    }
    
    // Store token
    write_token(idx, token_id);
}

// ─────────────────────────────────────────────────────────────────────────────
// Pass 2: Pattern Matching and SPIR-V Emission
// Matches token sequences and emits SPIR-V instructions
// ─────────────────────────────────────────────────────────────────────────────

@compute @workgroup_size(64)
fn pass_emit(@builtin(global_invocation_id) gid: vec3<u32>) {
    let idx = gid.x;
    
    // Check for error state (bail out)
    if (atomicLoad(&header.status) == STATUS_ERROR) {
        return;
    }
    
    // Thread 0: Emit SPIR-V header
    if (idx == 0u) {
        // SPIR-V Magic Number
        write_spirv_word(0u, SPIR_V_MAGIC);
        // Version 1.0
        write_spirv_word(1u, SPIR_V_VERSION);
        // Generator (0 = unknown)
        write_spirv_word(2u, 0u);
        // Bound (will be updated)
        write_spirv_word(3u, 16u);
        // Schema (reserved)
        write_spirv_word(4u, 0u);
    }
    
    // Pattern matching and value extraction
    let token = read_token(idx);
    
    // Detect workgroup size pattern: @workgroup_size(X, Y, Z)
    if (token == TOKEN_AT) {
        let next1 = read_token(idx + 1u);
        if (next1 == TOKEN_WORKGROUP_SIZE) {
            let next2 = read_token(idx + 2u); // (
            let val_x = read_token(idx + 3u); // X
            atomicStore(&workgroup_x, val_x); // Simplified: should parse number
            // ... Y and Z
        }
    }

    workgroupBarrier();
    
    // Thread 0: Emit metadata instructions after header
    if (idx == 0u) {
        let wx = atomicLoad(&workgroup_x);
        if (wx == 0u) { atomicStore(&workgroup_x, 64u); } // Default
        
        // OpExecutionMode %main LocalSize X Y Z
        let op_exec_mode = (6u << 16u) | SPIRV_OP_EXECUTION_MODE;
        write_spirv_word(5u, op_exec_mode);
        write_spirv_word(6u, 4u); // %main id
        write_spirv_word(7u, SPIRV_EXEC_LOCAL_SIZE);
        write_spirv_word(8u, atomicLoad(&workgroup_x));
        write_spirv_word(9u, atomicLoad(&workgroup_y));
        write_spirv_word(10u, atomicLoad(&workgroup_z));
    }
    
    // Emission of actual code follows
    // Template matching logic...
    
    let template_coord = vec2<i32>(i32(token), 0);
    let template = textureLoad(template_lut, template_coord, 0);
    
    if (template.r != 0u) {
        let spirv_idx = 11u + idx; // After header and metadata
        let opcode = template.r;
        let word_count = template.g;
        let instruction = (word_count << 16u) | opcode;
        write_spirv_word(spirv_idx, instruction);
    }
    
    // Thread 0: Finalize
    if (idx == 0u) {
        // Mark as clean (compilation complete)
        atomicStore(&header.status, STATUS_CLEAN);
    }
}

// ─────────────────────────────────────────────────────────────────────────────
// Pass 0: Change Detection (Optional separate pass)
// Computes hash and compares with cached value
// ─────────────────────────────────────────────────────────────────────────────

@compute @workgroup_size(1)
fn pass_detect_change(@builtin(global_invocation_id) gid: vec3<u32>) {
    let source_len = header.source_len;
    
    // Compute current hash
    let current_hash = compute_hash(0u, min(source_len, 1024u));
    
    // Compare with cached hash
    if (current_hash.x == header.hash_hi && current_hash.y == header.hash_lo) {
        // No change, keep status as CLEAN
        return;
    }
    
    // Hash changed, mark as dirty
    atomicStore(&header.status, STATUS_DIRTY);
    header.hash_hi = current_hash.x;
    header.hash_lo = current_hash.y;
}
