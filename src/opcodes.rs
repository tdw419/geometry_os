// ═══════════════════════════════════════════════════════════════════════
// PIXEL COMPOSITION OPCODES
//
// Keystrokes produce colors. Colors compose into patterns. Patterns are
// opcodes. Programs are paintings first and code second.
//
// Each instruction is a horizontal run of N pixels:
//
//   [opcode pixel] [arg1 pixel] [arg2 pixel] ... [argN pixel]
//
// The opcode pixel's color value determines the operation.
// Argument pixels' color values are the actual arguments.
// The VM advances PC by the instruction's width after executing.
//
// Example: ADD r0, r1
//   Pixel 0: 0x41 ('A') → opcode ADD
//   Pixel 1: 0x30 ('0') → arg dst = r0
//   Pixel 2: 0x31 ('1') → arg src = r1
//   You type "A01". Three keystrokes. Three pixels. One instruction.
//
// See docs/PIXEL_COMPOSITION_OPCODES.md for the full design doc.
// ═══════════════════════════════════════════════════════════════════════

/// Opcode constant = its pixel color value (= ASCII code of the key).
pub mod op {
    // ── Uppercase: Primary operations ─────────────────────────────────
    pub const ADD: u8 = 0x41;           // A  width 3: dst, src
    pub const BRANCH: u8 = 0x42;        // B  width 3: cond, addr
    pub const CALL: u8 = 0x43;          // C  width 2: addr
    pub const DIV: u8 = 0x44;           // D  width 3: dst, src
    pub const EXEC: u8 = 0x45;          // E  width 3: addr, arg
    pub const RECTF: u8 = 0x46;         // F  width 5: x, y, w, h
    pub const CIRCLEF: u8 = 0x47;       // G  width 4: cx, cy, r
    pub const HALT: u8 = 0x48;          // H  width 1
    pub const LDI: u8 = 0x49;           // I  width 3: dst, value
    pub const JMP: u8 = 0x4A;           // J  width 2: addr
    pub const SHL: u8 = 0x4B;           // K  width 3: dst, amount
    pub const LOAD: u8 = 0x4C;          // L  width 3: dst, addr
    pub const MOV: u8 = 0x4D;           // M  width 3: dst, src
    pub const NOP: u8 = 0x4E;           // N  width 1
    pub const OR: u8 = 0x4F;            // O  width 3: dst, src
    pub const PSET: u8 = 0x50;          // P  width 4: x, y, color
    pub const SPAWN: u8 = 0x51;         // Q  width 3: addr, arg
    pub const RET: u8 = 0x52;           // R  width 1
    pub const STORE: u8 = 0x53;         // S  width 3: addr, src
    pub const TEXT: u8 = 0x54;          // T  width 4: x, y, str_addr
    pub const SUB: u8 = 0x55;           // U  width 3: dst, src
    pub const LINE: u8 = 0x56;          // V  width 5: x1, y1, x2, y2
    pub const BLIT: u8 = 0x57;          // W  width 4: dst, src, count
    pub const XOR: u8 = 0x58;           // X  width 3: dst, src
    pub const YIELD: u8 = 0x59;         // Y  width 1
    pub const SPATIAL_SPAWN: u8 = 0x5A; // Z  width 4: x, y, addr

    // ── Lowercase: Secondary operations ───────────────────────────────
    pub const AND: u8 = 0x61;           // a  width 3: dst, src
    pub const MOD: u8 = 0x62;           // b  width 3: dst, src
    pub const LDB: u8 = 0x64;           // d  width 3: dst, addr
    pub const PGET: u8 = 0x67;          // g  width 3: x, y (result in r0)
    pub const INT: u8 = 0x69;           // i  width 2: vector
    pub const SHR: u8 = 0x6B;           // k  width 3: dst, amount
    pub const MUL: u8 = 0x6D;           // m  width 3: dst, src
    pub const NOT: u8 = 0x6E;           // n  width 2: dst
    pub const PUSH: u8 = 0x70;          // p  width 2: value
    pub const POP: u8 = 0x72;           // r  width 2: dst
    pub const STB: u8 = 0x73;           // s  width 3: addr, src
}

/// How many pixels does this opcode consume (including the opcode pixel itself)?
pub fn width(opcode: u8) -> usize {
    match opcode {
        op::HALT | op::NOP | op::RET | op::YIELD => 1,
        op::CALL | op::JMP | op::INT | op::NOT | op::PUSH | op::POP => 2,
        op::ADD | op::BRANCH | op::DIV | op::EXEC | op::LDI | op::SHL
        | op::LOAD | op::MOV | op::OR | op::SPAWN | op::STORE | op::SUB
        | op::XOR | op::AND | op::MOD | op::LDB | op::PGET | op::SHR
        | op::MUL | op::STB => 3,
        op::PSET | op::TEXT | op::BLIT | op::CIRCLEF | op::SPATIAL_SPAWN => 4,
        op::RECTF | op::LINE => 5,
        _ => 1, // unknown = skip 1 pixel
    }
}

/// Human-readable name for an opcode byte.
pub fn name(opcode: u8) -> &'static str {
    match opcode {
        op::ADD => "ADD", op::BRANCH => "BRANCH", op::CALL => "CALL",
        op::DIV => "DIV", op::EXEC => "EXEC", op::RECTF => "RECTF",
        op::CIRCLEF => "CIRCLEF", op::HALT => "HALT", op::LDI => "LDI",
        op::JMP => "JMP", op::SHL => "SHL", op::LOAD => "LOAD",
        op::MOV => "MOV", op::NOP => "NOP", op::OR => "OR",
        op::PSET => "PSET", op::SPAWN => "SPAWN", op::RET => "RET",
        op::STORE => "STORE", op::TEXT => "TEXT", op::SUB => "SUB",
        op::LINE => "LINE", op::BLIT => "BLIT", op::XOR => "XOR",
        op::YIELD => "YIELD", op::SPATIAL_SPAWN => "SPAWN+",
        op::AND => "AND", op::MOD => "MOD", op::LDB => "LDB",
        op::PGET => "PGET", op::INT => "INT", op::SHR => "SHR",
        op::MUL => "MUL", op::NOT => "NOT", op::PUSH => "PUSH",
        op::POP => "POP", op::STB => "STB",
        _ => "???",
    }
}

/// Is this byte a valid opcode?
pub fn is_valid(b: u8) -> bool {
    matches!(b,
        0x41..=0x5A |  // A-Z
        0x61 | 0x62 | 0x64 | 0x67 | 0x69 | 0x6B | 0x6D | 0x6E | 0x70 | 0x72 | 0x73
    )
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn halt_is_width_1() {
        assert_eq!(width(op::HALT), 1);
    }

    #[test]
    fn add_is_width_3() {
        assert_eq!(width(op::ADD), 3);
    }

    #[test]
    fn line_is_width_5() {
        assert_eq!(width(op::LINE), 5);
    }

    #[test]
    fn all_opcodes_have_names() {
        for b in 0x41u8..=0x5A {
            if is_valid(b) {
                assert_ne!(name(b), "???", "opcode 0x{:02X} should have a name", b);
            }
        }
    }

    #[test]
    fn opcode_values_are_ascii_letters() {
        assert_eq!(op::ADD, b'A');
        assert_eq!(op::HALT, b'H');
        assert_eq!(op::LDI, b'I');
        assert_eq!(op::MUL, b'm');
    }
}
