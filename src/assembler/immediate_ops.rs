// assembler/immediate_ops.rs -- Immediate-operand instruction match arms
//
// TEXTI, STRO, CMPI, LOADS, STORES, SHLI, SHRI, SARI,
// ADDI, SUBI, ANDI, ORI, XORI

use super::{parse_imm, parse_reg};

type Constants<'a> = &'a std::collections::HashMap<String, u32>;

pub(super) fn try_parse(
    opcode: &str,
    tokens: &[&str],
    bytecode: &mut Vec<u32>,
    constants: Constants,
) -> Result<Option<()>, String> {
    match opcode {
        // TEXTI x, y, "string" -- render inline text (no RAM setup needed)
        // Encoding: 0x13, x_imm, y_imm, char_count, char1, char2, ..., 0 (null term)
        "TEXTI" => {
            if tokens.len() < 4 {
                return Err("TEXTI requires 3 args: TEXTI x, y, \"string\"".to_string());
            }
            let x = parse_imm(tokens[1], constants)?;
            let y = parse_imm(tokens[2], constants)?;
            let rest = tokens[3..].join(",");
            let s = rest.trim();
            if !((s.starts_with('"') && s.ends_with('"'))
                || (s.starts_with('\'') && s.ends_with('\'')))
            {
                return Err("TEXTI requires a quoted string: TEXTI x, y, \"text\"".to_string());
            }
            let text = &s[1..s.len() - 1];
            bytecode.push(0x13);
            bytecode.push(x);
            bytecode.push(y);
            bytecode.push(text.len() as u32);
            for ch in text.bytes() {
                bytecode.push(ch as u32);
            }
            Ok(Some(()))
        }

        // STRO addr_reg, "string" -- store inline string at address in register
        // Encoding: 0x14, addr_reg, char_count, char1, char2, ...
        "STRO" => {
            if tokens.len() < 3 {
                return Err("STRO requires 2 args: STRO addr_reg, \"string\"".to_string());
            }
            let reg = parse_reg(tokens[1])?;
            // With quote-aware tokenizer, the string is a single token (tokens[2]).
            // join(",") still works as a fallback for edge cases.
            let s = tokens[2..].join(",");
            let s = s.trim();
            if !((s.starts_with('"') && s.ends_with('"'))
                || (s.starts_with('\'') && s.ends_with('\'')))
            {
                return Err("STRO requires a quoted string: STRO addr_reg, \"text\"".to_string());
            }
            let text = &s[1..s.len() - 1];
            bytecode.push(0x14);
            bytecode.push(reg as u32);
            bytecode.push(text.len() as u32);
            for ch in text.bytes() {
                bytecode.push(ch as u32);
            }
            Ok(Some(()))
        }

        // CMPI reg, imm -- compare register against immediate, sets r0
        "CMPI" => {
            if tokens.len() < 3 {
                return Err("CMPI requires 2 arguments: CMPI reg, imm".to_string());
            }
            bytecode.push(0x15);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_imm(tokens[2], constants)?);
            Ok(Some(()))
        }

        // LOADS reg, offset -- load from SP+offset (r30 + signed offset)
        "LOADS" => {
            if tokens.len() < 3 {
                return Err("LOADS requires 2 arguments: LOADS reg, offset".to_string());
            }
            bytecode.push(0x16);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_imm(tokens[2], constants)?);
            Ok(Some(()))
        }

        // STORES offset, reg -- store to SP+offset (r30 + signed offset)
        "STORES" => {
            if tokens.len() < 3 {
                return Err("STORES requires 2 arguments: STORES offset, reg".to_string());
            }
            bytecode.push(0x17);
            bytecode.push(parse_imm(tokens[1], constants)?);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        // Immediate arithmetic: SHLI, SHRI, SARI, ADDI, SUBI, ANDI, ORI, XORI
        "SHLI" | "SHRI" | "SARI" | "ADDI" | "SUBI" | "ANDI" | "ORI" | "XORI" => {
            if tokens.len() < 3 {
                let name = opcode;
                return Err(format!("{} requires 2 arguments: {} reg, imm", name, name));
            }
            let op_byte = match opcode {
                "SHLI" => 0x18,
                "SHRI" => 0x19,
                "SARI" => 0x1A,
                "ADDI" => 0x1B,
                "SUBI" => 0x1C,
                "ANDI" => 0x1D,
                "ORI" => 0x1E,
                "XORI" => 0x1F,
                _ => unreachable!(),
            };
            bytecode.push(op_byte);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_imm(tokens[2], constants)?);
            Ok(Some(()))
        }

        _ => Ok(None),
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::collections::HashMap;

    fn constants() -> HashMap<String, u32> {
        HashMap::new()
    }

    fn parse_one(opcode: &str, args: &str) -> Vec<u32> {
        let full = format!("{opcode} {args}");
        let tokens: Vec<&str> = full
            .split(|c: char| c.is_whitespace() || c == ',')
            .filter(|s| !s.is_empty())
            .collect();
        let mut bytecode = Vec::new();
        try_parse(opcode, &tokens, &mut bytecode, &constants()).unwrap();
        bytecode
    }

    fn parse_one_err(opcode: &str, args: &str) -> String {
        let full = format!("{opcode} {args}");
        let tokens: Vec<&str> = full
            .split(|c: char| c.is_whitespace() || c == ',')
            .filter(|s| !s.is_empty())
            .collect();
        let mut bytecode = Vec::new();
        try_parse(opcode, &tokens, &mut bytecode, &constants()).unwrap_err()
    }

    // ── CMPI (0x15) ────────────────────────────────────────
    #[test]
    fn test_cmpi_decimal() {
        assert_eq!(parse_one("CMPI", "r5, 42"), vec![0x15, 5, 42]);
    }

    #[test]
    fn test_cmpi_hex() {
        assert_eq!(parse_one("CMPI", "r10, 0xFF"), vec![0x15, 10, 255]);
    }

    #[test]
    fn test_cmpi_zero() {
        assert_eq!(parse_one("CMPI", "r0, 0"), vec![0x15, 0, 0]);
    }

    #[test]
    fn test_cmpi_too_few() {
        assert!(parse_one_err("CMPI", "r5").contains("2 arguments"));
    }

    // ── LOADS (0x16) ───────────────────────────────────────
    #[test]
    fn test_loads_basic() {
        assert_eq!(parse_one("LOADS", "r1, 8"), vec![0x16, 1, 8]);
    }

    #[test]
    fn test_loads_negative() {
        // parse_imm doesn't handle negative numbers - verify it rejects gracefully
        assert!(parse_one_err("LOADS", "r2, -4").contains("invalid number"));
    }

    #[test]
    fn test_loads_too_few() {
        assert!(parse_one_err("LOADS", "r1").contains("2 arguments"));
    }

    // ── STORES (0x17) ──────────────────────────────────────
    #[test]
    fn test_stores_basic() {
        assert_eq!(parse_one("STORES", "8, r1"), vec![0x17, 8, 1]);
    }

    #[test]
    fn test_stores_too_few() {
        assert!(parse_one_err("STORES", "8").contains("2 arguments"));
    }

    // ── Immediate arithmetic ────────────────────────────────
    #[test]
    fn test_shli() {
        assert_eq!(parse_one("SHLI", "r1, 4"), vec![0x18, 1, 4]);
    }

    #[test]
    fn test_shri() {
        assert_eq!(parse_one("SHRI", "r2, 8"), vec![0x19, 2, 8]);
    }

    #[test]
    fn test_sari() {
        assert_eq!(parse_one("SARI", "r3, 16"), vec![0x1A, 3, 16]);
    }

    #[test]
    fn test_addi() {
        assert_eq!(parse_one("ADDI", "r4, 10"), vec![0x1B, 4, 10]);
    }

    #[test]
    fn test_subi() {
        assert_eq!(parse_one("SUBI", "r5, 20"), vec![0x1C, 5, 20]);
    }

    #[test]
    fn test_andi() {
        assert_eq!(parse_one("ANDI", "r6, 0xFF"), vec![0x1D, 6, 0xFF]);
    }

    #[test]
    fn test_ori() {
        assert_eq!(parse_one("ORI", "r7, 0x10"), vec![0x1E, 7, 0x10]);
    }

    #[test]
    fn test_xori() {
        assert_eq!(parse_one("XORI", "r8, 0xAA"), vec![0x1F, 8, 0xAA]);
    }

    #[test]
    fn test_imm_arith_too_few() {
        assert!(parse_one_err("ADDI", "r1").contains("2 arguments"));
    }

    // ── TEXTI (0x13) ───────────────────────────────────────
    #[test]
    fn test_texti_basic() {
        let bc = parse_one("TEXTI", "10, 20, \"Hi\"");
        assert_eq!(bc[0], 0x13);
        assert_eq!(bc[1], 10); // x
        assert_eq!(bc[2], 20); // y
        assert_eq!(bc[3], 2); // char count
        assert_eq!(bc[4], 72); // 'H'
        assert_eq!(bc[5], 105); // 'i'
    }

    #[test]
    fn test_texti_empty() {
        let bc = parse_one("TEXTI", "0, 0, \"\"");
        assert_eq!(bc, vec![0x13, 0, 0, 0]);
    }

    #[test]
    fn test_texti_too_few() {
        assert!(parse_one_err("TEXTI", "10, 20").contains("3 args"));
    }

    // ── STRO (0x14) ───────────────────────────────────────
    #[test]
    fn test_stro_basic() {
        let bc = parse_one("STRO", "r1, \"AB\"");
        assert_eq!(bc[0], 0x14);
        assert_eq!(bc[1], 1); // reg
        assert_eq!(bc[2], 2); // char count
        assert_eq!(bc[3], 65); // 'A'
        assert_eq!(bc[4], 66); // 'B'
    }

    #[test]
    fn test_stro_too_few() {
        assert!(parse_one_err("STRO", "r1").contains("2 args"));
    }

    // ── High register boundary ─────────────────────────────
    #[test]
    fn test_cmpi_r31() {
        assert_eq!(parse_one("CMPI", "r31, 0xFFFF"), vec![0x15, 31, 0xFFFF]);
    }

    // ── Unknown opcode ─────────────────────────────────────
    #[test]
    fn test_unknown_returns_none() {
        let mut bytecode = Vec::new();
        let result = try_parse("ZZZTOP", &["ZZZTOP"], &mut bytecode, &constants()).unwrap();
        assert!(result.is_none());
    }
}
