// assembler/formula_ops.rs -- Formula/filesystem instruction match arms
//
// FORMULA, FORMULACLEAR, FORMULAREM, FMKDIR, FSTAT, FUNLINK

use super::{parse_imm, parse_reg};

type Constants<'a> = &'a std::collections::HashMap<String, u32>;

pub(super) fn try_parse(
    opcode: &str,
    tokens: &[&str],
    bytecode: &mut Vec<u32>,
    constants: Constants,
) -> Result<Option<()>, String> {
    match opcode {
        "FORMULA" => {
            // FORMULA target_idx, op, dep0, [dep1, ...]
            if tokens.len() < 4 {
                return Err("FORMULA requires: target_idx, op, dep0, [dep1, ...]".into());
            }
            let target_idx = parse_imm(tokens[1], constants)? as u32;
            let op_name = tokens[2].trim().to_uppercase();
            let op_code = match op_name.as_str() {
                "ADD" => 0,
                "SUB" => 1,
                "MUL" => 2,
                "DIV" => 3,
                "AND" => 4,
                "OR" => 5,
                "XOR" => 6,
                "NOT" => 7,
                "COPY" => 8,
                "MAX" => 9,
                "MIN" => 10,
                "MOD" => 11,
                "SHL" => 12,
                "SHR" => 13,
                _ => return Err(format!("FORMULA: unknown op '{}'", op_name)),
            };
            let deps: Vec<u32> = tokens[3..]
                .iter()
                .map(|a| parse_imm(a, constants))
                .collect::<Result<Vec<u32>, String>>()?;
            if deps.len() > 8 {
                return Err("FORMULA: too many dependencies (max 8)".into());
            }
            bytecode.push(0x75);
            bytecode.push(target_idx);
            bytecode.push(op_code);
            bytecode.push(deps.len() as u32);
            for d in &deps {
                bytecode.push(*d);
            }
            Ok(Some(()))
        }

        "FORMULACLEAR" => {
            bytecode.push(0x76);
            Ok(Some(()))
        }

        "FORMULAREM" => {
            if tokens.len() < 2 {
                return Err("FORMULAREM requires: target_idx".into());
            }
            let target_idx = parse_imm(tokens[1], constants)? as u32;
            bytecode.push(0x77);
            bytecode.push(target_idx);
            Ok(Some(()))
        }

        "FMKDIR" => {
            if tokens.len() < 2 {
                return Err("FMKDIR requires: path_reg".into());
            }
            let path_reg = parse_reg(tokens[1])?;
            bytecode.push(0x78);
            bytecode.push(path_reg as u32);
            Ok(Some(()))
        }

        "FSTAT" => {
            if tokens.len() < 3 {
                return Err("FSTAT requires: ino_reg, buf_reg".into());
            }
            let ino_reg = parse_reg(tokens[1])?;
            let buf_reg = parse_reg(tokens[2])?;
            bytecode.push(0x79);
            bytecode.push(ino_reg as u32);
            bytecode.push(buf_reg as u32);
            Ok(Some(()))
        }

        "FUNLINK" => {
            if tokens.len() < 2 {
                return Err("FUNLINK requires: path_reg".into());
            }
            let path_reg = parse_reg(tokens[1])?;
            bytecode.push(0x7A);
            bytecode.push(path_reg as u32);
            Ok(Some(()))
        }

        _ => Ok(None),
    }
}

// ── Phase 313: Formula Opcode Encoding Unit Tests ────────────────────────

#[cfg(test)]
mod tests {
    use super::*;
    use std::collections::HashMap;

    fn empty_constants() -> HashMap<String, u32> {
        HashMap::new()
    }

    #[test]
    fn test_p313_formula_add_basic() {
        let mut bc = Vec::new();
        let tokens = ["FORMULA", "100", "ADD", "200", "300"];
        let result = try_parse("FORMULA", &tokens, &mut bc, &empty_constants()).unwrap();
        assert!(result.is_some());
        assert_eq!(bc, vec![0x75, 100, 0, 2, 200, 300]); // opcode, target, ADD=0, 2 deps
    }

    #[test]
    fn test_p313_formula_sub() {
        let mut bc = Vec::new();
        let tokens = ["FORMULA", "50", "SUB", "10"];
        try_parse("FORMULA", &tokens, &mut bc, &empty_constants()).unwrap();
        assert_eq!(bc[2], 1); // SUB = 1
    }

    #[test]
    fn test_p313_formula_mul() {
        let mut bc = Vec::new();
        let tokens = ["FORMULA", "50", "MUL", "10"];
        try_parse("FORMULA", &tokens, &mut bc, &empty_constants()).unwrap();
        assert_eq!(bc[2], 2); // MUL = 2
    }

    #[test]
    fn test_p313_formula_div() {
        let mut bc = Vec::new();
        let tokens = ["FORMULA", "50", "DIV", "10"];
        try_parse("FORMULA", &tokens, &mut bc, &empty_constants()).unwrap();
        assert_eq!(bc[2], 3); // DIV = 3
    }

    #[test]
    fn test_p313_formula_and() {
        let mut bc = Vec::new();
        let tokens = ["FORMULA", "50", "AND", "10"];
        try_parse("FORMULA", &tokens, &mut bc, &empty_constants()).unwrap();
        assert_eq!(bc[2], 4);
    }

    #[test]
    fn test_p313_formula_or() {
        let mut bc = Vec::new();
        let tokens = ["FORMULA", "50", "OR", "10"];
        try_parse("FORMULA", &tokens, &mut bc, &empty_constants()).unwrap();
        assert_eq!(bc[2], 5);
    }

    #[test]
    fn test_p313_formula_xor() {
        let mut bc = Vec::new();
        let tokens = ["FORMULA", "50", "XOR", "10"];
        try_parse("FORMULA", &tokens, &mut bc, &empty_constants()).unwrap();
        assert_eq!(bc[2], 6);
    }

    #[test]
    fn test_p313_formula_not() {
        let mut bc = Vec::new();
        let tokens = ["FORMULA", "50", "NOT", "10"];
        try_parse("FORMULA", &tokens, &mut bc, &empty_constants()).unwrap();
        assert_eq!(bc[2], 7);
    }

    #[test]
    fn test_p313_formula_copy() {
        let mut bc = Vec::new();
        let tokens = ["FORMULA", "50", "COPY", "10"];
        try_parse("FORMULA", &tokens, &mut bc, &empty_constants()).unwrap();
        assert_eq!(bc[2], 8);
    }

    #[test]
    fn test_p313_formula_max() {
        let mut bc = Vec::new();
        let tokens = ["FORMULA", "50", "MAX", "10", "20"];
        try_parse("FORMULA", &tokens, &mut bc, &empty_constants()).unwrap();
        assert_eq!(bc[2], 9);
        assert_eq!(bc[3], 2); // 2 deps
    }

    #[test]
    fn test_p313_formula_min() {
        let mut bc = Vec::new();
        let tokens = ["FORMULA", "50", "MIN", "10", "20"];
        try_parse("FORMULA", &tokens, &mut bc, &empty_constants()).unwrap();
        assert_eq!(bc[2], 10);
    }

    #[test]
    fn test_p313_formula_mod() {
        let mut bc = Vec::new();
        let tokens = ["FORMULA", "50", "MOD", "10"];
        try_parse("FORMULA", &tokens, &mut bc, &empty_constants()).unwrap();
        assert_eq!(bc[2], 11);
    }

    #[test]
    fn test_p313_formula_shl() {
        let mut bc = Vec::new();
        let tokens = ["FORMULA", "50", "SHL", "10"];
        try_parse("FORMULA", &tokens, &mut bc, &empty_constants()).unwrap();
        assert_eq!(bc[2], 12);
    }

    #[test]
    fn test_p313_formula_shr() {
        let mut bc = Vec::new();
        let tokens = ["FORMULA", "50", "SHR", "10"];
        try_parse("FORMULA", &tokens, &mut bc, &empty_constants()).unwrap();
        assert_eq!(bc[2], 13);
    }

    #[test]
    fn test_p313_formula_unknown_op() {
        let mut bc = Vec::new();
        let tokens = ["FORMULA", "50", "INVALID", "10"];
        let result = try_parse("FORMULA", &tokens, &mut bc, &empty_constants());
        assert!(result.is_err());
        assert!(result.unwrap_err().contains("unknown op"));
    }

    #[test]
    fn test_p313_formula_too_few_args() {
        let mut bc = Vec::new();
        let tokens = ["FORMULA", "50"];
        let result = try_parse("FORMULA", &tokens, &mut bc, &empty_constants());
        assert!(result.is_err());
        assert!(result.unwrap_err().contains("requires"));
    }

    #[test]
    fn test_p313_formula_max_deps() {
        let mut bc = Vec::new();
        let tokens = [
            "FORMULA", "50", "ADD", "1", "2", "3", "4", "5", "6", "7", "8", "9",
        ]; // 9 deps > max 8
        let result = try_parse("FORMULA", &tokens, &mut bc, &empty_constants());
        assert!(result.is_err());
        assert!(result.unwrap_err().contains("too many"));
    }

    #[test]
    fn test_p313_formula_max_deps_boundary() {
        let mut bc = Vec::new();
        let tokens = [
            "FORMULA", "50", "ADD", "1", "2", "3", "4", "5", "6", "7", "8",
        ]; // 8 deps = max
        let result = try_parse("FORMULA", &tokens, &mut bc, &empty_constants());
        assert!(result.is_ok());
        assert_eq!(bc[3], 8); // 8 dependencies
        assert_eq!(bc.len(), 4 + 8); // header (4) + deps (8)
    }

    #[test]
    fn test_p313_formula_single_dep() {
        let mut bc = Vec::new();
        let tokens = ["FORMULA", "50", "COPY", "10"];
        let result = try_parse("FORMULA", &tokens, &mut bc, &empty_constants()).unwrap();
        assert!(result.is_some());
        assert_eq!(bc[3], 1); // 1 dep
        assert_eq!(bc.len(), 5); // header (4) + dep (1)
    }

    #[test]
    fn test_p313_formula_op_case_insensitive() {
        let mut bc = Vec::new();
        let tokens = ["FORMULA", "50", "add", "10"];
        try_parse("FORMULA", &tokens, &mut bc, &empty_constants()).unwrap();
        assert_eq!(bc[2], 0); // add -> ADD = 0
    }

    #[test]
    fn test_p313_formula_with_constants() {
        let mut constants = HashMap::new();
        constants.insert("MY_TARGET".into(), 42u32);
        constants.insert("MY_DEP".into(), 99u32);
        let mut bc = Vec::new();
        let tokens = ["FORMULA", "MY_TARGET", "ADD", "MY_DEP"];
        try_parse("FORMULA", &tokens, &mut bc, &constants).unwrap();
        assert_eq!(bc[1], 42); // resolved constant
        assert_eq!(bc[4], 99); // resolved dep constant
    }

    #[test]
    fn test_p313_formulaclear_basic() {
        let mut bc = Vec::new();
        let tokens = ["FORMULACLEAR"];
        let result = try_parse("FORMULACLEAR", &tokens, &mut bc, &empty_constants()).unwrap();
        assert!(result.is_some());
        assert_eq!(bc, vec![0x76]);
    }

    #[test]
    fn test_p313_formularem_basic() {
        let mut bc = Vec::new();
        let tokens = ["FORMULAREM", "42"];
        let result = try_parse("FORMULAREM", &tokens, &mut bc, &empty_constants()).unwrap();
        assert!(result.is_some());
        assert_eq!(bc, vec![0x77, 42]);
    }

    #[test]
    fn test_p313_formularem_missing_arg() {
        let mut bc = Vec::new();
        let tokens = ["FORMULAREM"];
        let result = try_parse("FORMULAREM", &tokens, &mut bc, &empty_constants());
        assert!(result.is_err());
        assert!(result.unwrap_err().contains("requires"));
    }

    #[test]
    fn test_p313_fmkdir_basic() {
        let mut bc = Vec::new();
        let tokens = ["FMKDIR", "r1"];
        let result = try_parse("FMKDIR", &tokens, &mut bc, &empty_constants()).unwrap();
        assert!(result.is_some());
        assert_eq!(bc, vec![0x78, 1]); // r1 = index 1
    }

    #[test]
    fn test_p313_fmkdir_missing_arg() {
        let mut bc = Vec::new();
        let tokens = ["FMKDIR"];
        let result = try_parse("FMKDIR", &tokens, &mut bc, &empty_constants());
        assert!(result.is_err());
    }

    #[test]
    fn test_p313_fstat_basic() {
        let mut bc = Vec::new();
        let tokens = ["FSTAT", "r5", "r10"];
        let result = try_parse("FSTAT", &tokens, &mut bc, &empty_constants()).unwrap();
        assert!(result.is_some());
        assert_eq!(bc, vec![0x79, 5, 10]);
    }

    #[test]
    fn test_p313_fstat_missing_args() {
        let mut bc = Vec::new();
        let tokens = ["FSTAT", "r5"];
        let result = try_parse("FSTAT", &tokens, &mut bc, &empty_constants());
        assert!(result.is_err());
    }

    #[test]
    fn test_p313_funlink_basic() {
        let mut bc = Vec::new();
        let tokens = ["FUNLINK", "r3"];
        let result = try_parse("FUNLINK", &tokens, &mut bc, &empty_constants()).unwrap();
        assert!(result.is_some());
        assert_eq!(bc, vec![0x7A, 3]);
    }

    #[test]
    fn test_p313_funlink_missing_arg() {
        let mut bc = Vec::new();
        let tokens = ["FUNLINK"];
        let result = try_parse("FUNLINK", &tokens, &mut bc, &empty_constants());
        assert!(result.is_err());
    }

    #[test]
    fn test_p313_unknown_opcode_returns_none() {
        let mut bc = Vec::new();
        let tokens = ["NONEXISTENT"];
        let result = try_parse("NONEXISTENT", &tokens, &mut bc, &empty_constants()).unwrap();
        assert!(result.is_none());
        assert!(bc.is_empty());
    }
}
