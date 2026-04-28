// glyph_lexer.wgsl -- Spatial Opcode Lexer for Geometry OS
//
// Scans a flat u32 array (VM RAM or canvas mirror) to find instruction
// boundaries. Each invocation checks one candidate position, reads the
// opcode byte, classifies it, and if valid, atomically writes the offset
// and width into a dispatch buffer for downstream GPU workgroups.
//
// Binding layout:
//   @binding(0) @group(0) var<storage, read>       input_data:    array<u32>;
//   @binding(1) @group(0) var<storage, read_write>  dispatch_buf:  array<u32>;
//   @binding(2) @group(0) var<uniform>              params:        LexerParams;
//
// Layout constants (must match gpu_lexer.rs):
//   dispatch_buf[0] = instruction count (written by shader)
//   dispatch_buf[1..] = packed entries: low 24 bits = offset, high 8 bits = width
//   dispatch_buf capacity = MAX_INSTRUCTIONS + 1

struct LexerParams {
    input_len:    u32,   // number of u32 words in input_data
    scan_start:   u32,   // starting offset to begin scanning
    scan_end:     u32,   // ending offset (exclusive)
    reserved:     u32,
}

// ── Instruction width table ──────────────────────────────────────
// Maps opcode byte -> instruction width in u32 words.
// 0 = invalid/unknown opcode (skip).
// 255 = variable-length (TEXTI, STRO, FORMULA) -- needs special handling.
//
// Widths extracted from disasm.rs match arms.
// Fixed-width opcodes only; variable-length are handled separately.

fn opcode_width(op: u32) -> u32 {
    // clang-format off
    switch (op) {
        // ── 1-word instructions ──
        case 0x00u: { return 1u; } // HALT
        case 0x01u: { return 1u; } // NOP
        case 0x02u: { return 1u; } // FRAME
        case 0x34u: { return 1u; } // RET
        case 0x53u: { return 1u; } // RETK
        case 0x5Au: { return 1u; } // YIELD
        case 0x5Fu: { return 1u; } // MSGRCV
        case 0x65u: { return 1u; } // GETPID
        case 0x6Eu: { return 1u; } // SHUTDOWN
        case 0x73u: { return 1u; } // ASMSELF
        case 0x74u: { return 1u; } // RUNNEXT
        case 0x76u: { return 1u; } // FORMULACLEAR
        case 0x91u: { return 1u; } // INV
        case 0x9Eu: { return 1u; } // HITCLR
        case 0xB5u: { return 1u; } // VM_LIVE_STEP
        case 0xB6u: { return 1u; } // VM_LIVE_KILL
        case 0xBEu: { return 1u; } // NPROC

        // ── 2-word instructions ──
        case 0x2Au: { return 2u; } // NEG
        case 0x30u: { return 2u; } // JMP
        case 0x33u: { return 2u; } // CALL
        case 0x38u: { return 2u; } // HITQ
        case 0x42u: { return 2u; } // FILL
        case 0x47u: { return 2u; } // SCROLL
        case 0x48u: { return 2u; } // IKEY
        case 0x49u: { return 2u; } // RAND
        case 0x4Du: { return 2u; } // SPAWN
        case 0x4Eu: { return 2u; } // KILL
        case 0x52u: { return 2u; } // SYSCALL
        case 0x57u: { return 2u; } // CLOSE
        case 0x59u: { return 2u; } // LS
        case 0x5Bu: { return 2u; } // SLEEP
        case 0x5Cu: { return 2u; } // SETPRIORITY
        case 0x5Eu: { return 2u; } // MSGSND
        case 0x66u: { return 2u; } // EXEC
        case 0x69u: { return 2u; } // WAITPID
        case 0x6Bu: { return 2u; } // CHDIR
        case 0x6Cu: { return 2u; } // GETCWD
        case 0x6Fu: { return 2u; } // EXIT
        case 0x77u: { return 2u; } // FORMULAREM
        case 0x78u: { return 2u; } // FMKDIR
        case 0x7Au: { return 2u; } // FUNLINK
        case 0x7Bu: { return 2u; } // SNAP_TRACE
        case 0x7Cu: { return 2u; } // REPLAY
        case 0x7Du: { return 2u; } // FORK
        case 0x82u: { return 2u; } // DISCONNECT
        case 0x83u: { return 2u; } // TRACE_READ
        case 0x84u: { return 2u; } // PIXEL_HISTORY
        case 0x85u: { return 2u; } // MOUSEQ
        case 0x87u: { return 2u; } // ABS
        case 0x90u: { return 2u; } // NOT
        case 0x93u: { return 2u; } // RELU
        case 0x94u: { return 2u; } // WINSYS
        case 0x98u: { return 2u; } // SCRSHOT
        case 0x9Bu: { return 2u; } // PROCLS
        case 0xA0u: { return 2u; } // VM_KILL
        case 0xA1u: { return 2u; } // VM_STATUS
        case 0xA2u: { return 2u; } // VM_PAUSE
        case 0xA3u: { return 2u; } // VM_RESUME
        case 0xA5u: { return 2u; } // VM_LIST
        case 0xA6u: { return 2u; } // AI_INJECT
        case 0xACu: { return 2u; } // PTYCLOSE
        case 0xB0u: { return 2u; } // AI_AGENT
        case 0xB2u: { return 2u; } // LOADSRCIMG
        case 0xB3u: { return 2u; } // ASM_RAM

        // ── 3-word instructions ──
        case 0x03u: { return 3u; } // BEEP
        case 0x10u: { return 3u; } // LDI
        case 0x11u: { return 3u; } // LOAD
        case 0x12u: { return 3u; } // STORE
        case 0x15u: { return 3u; } // CMPI
        case 0x16u: { return 3u; } // LOADS
        case 0x17u: { return 3u; } // STORES
        case 0x18u: { return 3u; } // SHLI
        case 0x19u: { return 3u; } // SHRI
        case 0x1Au: { return 3u; } // SARI
        case 0x1Bu: { return 3u; } // ADDI
        case 0x1Cu: { return 3u; } // SUBI
        case 0x1Du: { return 3u; } // ANDI
        case 0x1Eu: { return 3u; } // ORI
        case 0x1Fu: { return 3u; } // XORI
        case 0x20u: { return 3u; } // ADD
        case 0x21u: { return 3u; } // SUB
        case 0x22u: { return 3u; } // MUL
        case 0x23u: { return 3u; } // DIV
        case 0x24u: { return 3u; } // AND
        case 0x25u: { return 3u; } // OR
        case 0x26u: { return 3u; } // XOR
        case 0x27u: { return 3u; } // SHL
        case 0x28u: { return 3u; } // SHR
        case 0x29u: { return 3u; } // MOD
        case 0x2Bu: { return 3u; } // SAR
        case 0x31u: { return 3u; } // JZ
        case 0x32u: { return 3u; } // JNZ
        case 0x35u: { return 3u; } // BLT
        case 0x36u: { return 3u; } // BGE
        case 0x4Bu: { return 3u; } // ASM
        case 0x50u: { return 3u; } // CMP
        case 0x51u: { return 3u; } // MOV
        case 0x54u: { return 3u; } // OPEN
        case 0x5Du: { return 3u; } // PIPE
        case 0x63u: { return 3u; } // GETENV
        case 0x64u: { return 3u; } // SETENV
        case 0x67u: { return 3u; } // WRITESTR
        case 0x70u: { return 3u; } // SIGNAL
        case 0x71u: { return 3u; } // SIGSET
        case 0x72u: { return 3u; } // HYPERVISOR
        case 0x79u: { return 3u; } // FSTAT
        case 0x86u: { return 3u; } // STRCMP
        case 0x89u: { return 3u; } // MIN
        case 0x8Au: { return 3u; } // MAX
        case 0x8Du: { return 3u; } // BITSET
        case 0x8Eu: { return 3u; } // BITCLR
        case 0x8Fu: { return 3u; } // BITTEST
        case 0x9Au: { return 3u; } // NET_RECV
        case 0x9Fu: { return 3u; } // VM_SPAWN
        case 0xA4u: { return 3u; } // VM_SET_BUDGET
        case 0xA7u: { return 3u; } // SPAWNC
        case 0xA9u: { return 3u; } // PTYOPEN
        case 0xB1u: { return 3u; } // LOADPNG
        case 0xB4u: { return 3u; } // VM_LIVE_SPAWN

        // ── 4-word instructions ──
        case 0x04u: { return 4u; } // MEMCPY
        case 0x40u: { return 4u; } // PSET
        case 0x41u: { return 4u; } // PSETI
        case 0x44u: { return 4u; } // TEXT
        case 0x4Fu: { return 4u; } // PEEK
        case 0x55u: { return 4u; } // READ
        case 0x56u: { return 4u; } // WRITE
        case 0x58u: { return 4u; } // SEEK
        case 0x62u: { return 4u; } // IOCTL
        case 0x68u: { return 4u; } // READLN
        case 0x6Au: { return 4u; } // EXECP
        case 0x6Du: { return 4u; } // SCREENP
        case 0x7Eu: { return 4u; } // NOTE
        case 0x7Fu: { return 4u; } // CONNECT
        case 0x8Bu: { return 4u; } // CLAMP
        case 0x99u: { return 4u; } // NET_SEND
        case 0x9Cu: { return 4u; } // LLM
        case 0x9Du: { return 4u; } // HTPARSE
        case 0xA8u: { return 4u; } // HERMES
        case 0xAAu: { return 4u; } // PTYWRITE
        case 0xABu: { return 4u; } // PTYREAD
        case 0xADu: { return 4u; } // PTYSIZE

        // ── 5-word instructions ──
        case 0x80u: { return 5u; } // SOCKSEND
        case 0x81u: { return 5u; } // SOCKRECV
        case 0x95u: { return 5u; } // WPIXEL
        case 0x96u: { return 5u; } // WREAD
        case 0x97u: { return 5u; } // SPRBLT

        // ── 6-word instructions ──
        case 0x37u: { return 6u; } // HITSET
        case 0x43u: { return 6u; } // RECTF
        case 0x45u: { return 6u; } // LINE
        case 0x4Au: { return 6u; } // SPRITE
        case 0x88u: { return 6u; } // RECT
        case 0x8Cu: { return 6u; } // DRAWTEXT
        case 0x92u: { return 6u; } // MATVEC
        case 0xD0u: { return 6u; } // SMALLTEXT
        case 0xD1u: { return 6u; } // MEDTEXT

        // ── 3-word instructions ──
        case 0xD3u: { return 3u; } // PATCHW addr_reg, val_reg

        // ── 4-word instructions ──
        case 0xD2u: { return 4u; } // PATCH addr_reg, val_reg, mask_reg

        // ── 9-word instruction ──
        case 0x4Cu: { return 9u; } // TILEMAP

        // ── Variable-length (handled by special logic) ──
        case 0x13u: { return 255u; } // TEXTI: header=4 + char_count
        case 0x14u: { return 255u; } // STRO:  header=3 + char_count
        case 0x75u: { return 255u; } // FORMULA: header=4 + dep_count

        // ── Host filesystem bridge (2/3/4-word) ──
        case 0xB7u: { return 2u; } // UNLINK
        case 0xB8u: { return 3u; } // FCOPY
        case 0xB9u: { return 3u; } // FSOPEN
        case 0xBAu: { return 2u; } // FSCLOSE
        case 0xBBu: { return 4u; } // FSREAD
        case 0xBCu: { return 4u; } // FSWRITE
        case 0xBDu: { return 4u; } // FSLS
        case 0xBFu: { return 3u; } // PROCINFO

        default:   { return 0u; }  // Unknown opcode
    }
    // clang-format on
}

/// Compute the width of a variable-length instruction starting at `addr`.
/// Returns 0 if the instruction is malformed (count would exceed bounds).
fn variable_width(addr: u32, op: u32) -> u32 {
    if (addr + 3u) >= params.input_len {
        return 0u;
    }

    if (op == 0x13u) {
        // TEXTI: 4 header words + char_count characters
        let count = input_data[addr + 3u];
        if (count > 256u) { return 0u; }
        return 4u + count;
    }

    if (op == 0x14u) {
        // STRO: 3 header words + char_count characters
        let count = input_data[addr + 2u];
        if (count > 256u) { return 0u; }
        return 3u + count;
    }

    if (op == 0x75u) {
        // FORMULA: 4 header words + dep_count (each dep = 1 word)
        let count = input_data[addr + 3u];
        if (count > 32u) { return 0u; } // MAX_FORMULA_DEPS
        return 4u + count;
    }

    return 0u;
}

@binding(0) @group(0) var<storage, read> input_data: array<u32>;
@binding(1) @group(0) var<storage, read_write> dispatch_buf: array<u32>;
@binding(2) @group(0) var<uniform> params: LexerParams;

// Maximum instructions in the dispatch buffer
const MAX_INSTRUCTIONS: u32 = 8192u;

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) gid: vec3<u32>) {
    let idx = gid.x;
    if (idx >= params.scan_end) {
        return;
    }

    let addr = params.scan_start + idx;
    if (addr >= params.input_len) {
        return;
    }

    let word = input_data[addr];
    let op = word & 0xFFu;

    let width = opcode_width(op);

    // Skip unknown opcodes (width == 0)
    if (width == 0u) {
        return;
    }

    // Handle variable-length instructions
    let actual_width = select(width, variable_width(addr, op), width == 255u);
    if (actual_width == 0u) {
        return;
    }

    // Verify the full instruction fits within input bounds
    if (addr + actual_width > params.input_len) {
        return;
    }

    // Pack entry: bits[23:0] = offset, bits[31:24] = width
    let packed = (actual_width << 24u) | (addr & 0x00FFFFFFu);

    // Atomically append to dispatch buffer
    let slot = atomicAdd(&dispatch_buf[0], 1u);
    if (slot < MAX_INSTRUCTIONS) {
        dispatch_buf[1u + slot] = packed;
    }
}
