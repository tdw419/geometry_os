// assembler/core_ops.rs -- Core instruction match arms
//
// HALT, NOP, FRAME, BEEP, MEMCPY, MEMSET, LDI, LOAD, STORE, MOV,
// arithmetic (ADD..MOD), jumps (JMP, JZ, JNZ, CALL, RET, BLT, BGE),
// stack (PUSH, POP), CMP, NEG, IKEY, RAND

use super::{parse_imm, parse_reg};

type Constants<'a> = &'a std::collections::HashMap<String, u32>;

pub(super) fn try_parse(
    opcode: &str,
    tokens: &[&str],
    bytecode: &mut Vec<u32>,
    label_refs: &mut Vec<(usize, String, usize)>,
    line_num: usize,
    constants: Constants,
) -> Result<Option<()>, String> {
    match opcode {
        "HALT" => {
            bytecode.push(0x00);
            Ok(Some(()))
        }
        "NOP" => {
            bytecode.push(0x01);
            Ok(Some(()))
        }
        "BREAKPOINT" => {
            bytecode.push(0xCD);
            Ok(Some(()))
        }
        "FRAME" => {
            bytecode.push(0x02);
            Ok(Some(()))
        }

        "BEEP" => {
            if tokens.len() < 3 {
                return Err("BEEP requires 2 arguments: BEEP freq_reg, dur_reg".to_string());
            }
            bytecode.push(0x03);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "NOTE" => {
            if tokens.len() < 4 {
                return Err(
                    "NOTE requires 3 arguments: NOTE wave_reg, freq_reg, dur_reg".to_string(),
                );
            }
            bytecode.push(0x7E);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "CONNECT" => {
            if tokens.len() < 4 {
                return Err(
                    "CONNECT requires 3 arguments: CONNECT addr_reg, port_reg, fd_reg".to_string(),
                );
            }
            bytecode.push(0x7F);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "SOCKSEND" => {
            if tokens.len() < 5 {
                return Err(
                    "SOCKSEND requires 4 arguments: SOCKSEND fd_reg, buf_reg, len_reg, sent_reg"
                        .to_string(),
                );
            }
            bytecode.push(0x80);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            Ok(Some(()))
        }

        "SOCKRECV" => {
            if tokens.len() < 5 {
                return Err(
                    "SOCKRECV requires 4 arguments: SOCKRECV fd_reg, buf_reg, max_len_reg, recv_reg"
                        .to_string(),
                );
            }
            bytecode.push(0x81);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            Ok(Some(()))
        }

        "DISCONNECT" => {
            if tokens.len() < 2 {
                return Err("DISCONNECT requires 1 argument: DISCONNECT fd_reg".to_string());
            }
            bytecode.push(0x82);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "NET_SEND" => {
            if tokens.len() < 4 {
                return Err(
                    "NET_SEND requires 3 arguments: NET_SEND addr_reg, len_reg, dest_reg"
                        .to_string(),
                );
            }
            bytecode.push(0x99);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "NET_RECV" => {
            if tokens.len() < 3 {
                return Err(
                    "NET_RECV requires 2 arguments: NET_RECV addr_reg, max_len_reg".to_string(),
                );
            }
            bytecode.push(0x9A);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "TRACE_READ" => {
            if tokens.len() < 2 {
                return Err("TRACE_READ requires 1 argument: TRACE_READ mode_reg".to_string());
            }
            bytecode.push(0x83);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "PIXEL_HISTORY" => {
            if tokens.len() < 2 {
                return Err("PIXEL_HISTORY requires 1 argument: PIXEL_HISTORY mode_reg".to_string());
            }
            bytecode.push(0x84);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "MEMCPY" => {
            if tokens.len() < 4 {
                return Err(
                    "MEMCPY requires 3 arguments: MEMCPY dst_reg, src_reg, len_reg".to_string(),
                );
            }
            bytecode.push(0x04);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "MEMSET" => {
            if tokens.len() < 4 {
                return Err(
                    "MEMSET requires 3 arguments: MEMSET dst_reg, val_reg, count_reg".to_string(),
                );
            }
            bytecode.push(0xF6);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "LDI" => {
            if tokens.len() < 3 {
                return Err("LDI requires 2 arguments: LDI reg, imm".to_string());
            }
            bytecode.push(0x10);
            bytecode.push(parse_reg(tokens[1])? as u32);
            let pos = bytecode.len();
            if let Ok(imm) = parse_imm(tokens[2], constants) {
                bytecode.push(imm);
            } else {
                bytecode.push(0);
                label_refs.push((pos, tokens[2].to_lowercase(), line_num));
            }
            Ok(Some(()))
        }

        "LOAD" => {
            if tokens.len() < 3 {
                return Err("LOAD requires 2 arguments: LOAD reg, addr_reg".to_string());
            }
            bytecode.push(0x11);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "STORE" => {
            if tokens.len() < 3 {
                return Err("STORE requires 2 arguments: STORE addr_reg, reg".to_string());
            }
            bytecode.push(0x12);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        // Phase 282: Typed memory access
        "LOADB" => {
            if tokens.len() < 3 {
                return Err("LOADB requires 2 arguments: LOADB dest_reg, addr_reg".to_string());
            }
            bytecode.push(0xFB);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "STOREB" => {
            if tokens.len() < 3 {
                return Err("STOREB requires 2 arguments: STOREB addr_reg, src_reg".to_string());
            }
            bytecode.push(0xFC);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "LOADH" => {
            if tokens.len() < 3 {
                return Err("LOADH requires 2 arguments: LOADH dest_reg, addr_reg".to_string());
            }
            bytecode.push(0xFD);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "STOREH" => {
            if tokens.len() < 3 {
                return Err("STOREH requires 2 arguments: STOREH addr_reg, src_reg".to_string());
            }
            bytecode.push(0xFE);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "MOV" => {
            if tokens.len() < 3 {
                return Err("MOV requires 2 arguments: MOV rd, rs".to_string());
            }
            bytecode.push(0x51);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        // Arithmetic: ADD, SUB, MUL, DIV, AND, OR, XOR, SHL, SHR, SAR, MOD
        "ADD" | "SUB" | "MUL" | "DIV" | "AND" | "OR" | "XOR" | "SHL" | "SHR" | "SAR" | "MOD" => {
            if tokens.len() < 3 {
                let name = opcode;
                return Err(format!("{} requires 2 arguments: {} rd, rs", name, name));
            }
            let op_byte = match opcode {
                "ADD" => 0x20,
                "SUB" => 0x21,
                "MUL" => 0x22,
                "DIV" => 0x23,
                "AND" => 0x24,
                "OR" => 0x25,
                "XOR" => 0x26,
                "SHL" => 0x27,
                "SHR" => 0x28,
                "SAR" => 0x2B,
                "MOD" => 0x29,
                _ => unreachable!(),
            };
            bytecode.push(op_byte);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "CMP" => {
            if tokens.len() < 3 {
                return Err("CMP requires 2 arguments: CMP rd, rs".to_string());
            }
            bytecode.push(0x50);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "NEG" => {
            if tokens.len() < 2 {
                return Err("NEG requires 1 argument: NEG rd".to_string());
            }
            bytecode.push(0x2A);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        // Jumps with label resolution: JMP, JZ, JNZ, CALL, BLT, BGE
        "JMP" => {
            if tokens.len() < 2 {
                return Err("JMP requires 1 argument: JMP addr".to_string());
            }
            bytecode.push(0x30);
            let pos = bytecode.len();
            if let Ok(addr) = parse_imm(tokens[1], constants) {
                bytecode.push(addr);
            } else {
                bytecode.push(0);
                label_refs.push((pos, tokens[1].to_lowercase(), line_num));
            }
            Ok(Some(()))
        }

        "JZ" | "JNZ" | "BLT" | "BGE" => {
            if tokens.len() < 3 {
                let name = opcode;
                return Err(format!("{} requires 2 arguments: {} reg, addr", name, name));
            }
            let op_byte = match opcode {
                "JZ" => 0x31,
                "JNZ" => 0x32,
                "BLT" => 0x35,
                "BGE" => 0x36,
                _ => unreachable!(),
            };
            bytecode.push(op_byte);
            bytecode.push(parse_reg(tokens[1])? as u32);
            let pos = bytecode.len();
            if let Ok(addr) = parse_imm(tokens[2], constants) {
                bytecode.push(addr);
            } else {
                bytecode.push(0);
                label_refs.push((pos, tokens[2].to_lowercase(), line_num));
            }
            Ok(Some(()))
        }

        "CALL" => {
            if tokens.len() < 2 {
                return Err("CALL requires 1 argument: CALL addr".to_string());
            }
            bytecode.push(0x33);
            let pos = bytecode.len();
            if let Ok(addr) = parse_imm(tokens[1], constants) {
                bytecode.push(addr);
            } else {
                bytecode.push(0);
                label_refs.push((pos, tokens[1].to_lowercase(), line_num));
            }
            Ok(Some(()))
        }

        "RET" => {
            bytecode.push(0x34);
            Ok(Some(()))
        }

        "PUSH" => {
            if tokens.len() < 2 {
                return Err("PUSH requires 1 argument: PUSH reg".to_string());
            }
            bytecode.push(0x60);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "POP" => {
            if tokens.len() < 2 {
                return Err("POP requires 1 argument: POP reg".to_string());
            }
            bytecode.push(0x61);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "IKEY" => {
            if tokens.len() < 2 {
                return Err("IKEY requires 1 argument: IKEY reg".to_string());
            }
            bytecode.push(0x48);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "RAND" => {
            if tokens.len() < 2 {
                return Err("RAND requires 1 argument: RAND rd".to_string());
            }
            bytecode.push(0x49);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "HTTPGET" => {
            if tokens.len() < 6 {
                return Err(
                    "HTTPGET requires 5 arguments: HTTPGET url_reg, buf_reg, max_len_reg, status_reg, len_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xCC);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            bytecode.push(parse_reg(tokens[5])? as u32);
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
        let mut label_refs: Vec<(usize, String, usize)> = Vec::new();
        try_parse(
            opcode,
            &tokens,
            &mut bytecode,
            &mut label_refs,
            0,
            &constants(),
        )
        .unwrap();
        bytecode
    }

    fn parse_one_err(opcode: &str, args: &str) -> String {
        let full = format!("{opcode} {args}");
        let tokens: Vec<&str> = full
            .split(|c: char| c.is_whitespace() || c == ',')
            .filter(|s| !s.is_empty())
            .collect();
        let mut bytecode = Vec::new();
        let mut label_refs: Vec<(usize, String, usize)> = Vec::new();
        try_parse(
            opcode,
            &tokens,
            &mut bytecode,
            &mut label_refs,
            0,
            &constants(),
        )
        .unwrap_err()
    }

    // ── No-arg opcodes ──────────────────────────────────────
    #[test]
    fn test_halt() {
        assert_eq!(parse_one("HALT", ""), vec![0x00]);
    }

    #[test]
    fn test_nop() {
        assert_eq!(parse_one("NOP", ""), vec![0x01]);
    }

    #[test]
    fn test_breakpoint() {
        assert_eq!(parse_one("BREAKPOINT", ""), vec![0xCD]);
    }

    #[test]
    fn test_frame() {
        assert_eq!(parse_one("FRAME", ""), vec![0x02]);
    }

    #[test]
    fn test_ret() {
        assert_eq!(parse_one("RET", ""), vec![0x34]);
    }

    // ── Single-register opcodes ─────────────────────────────
    #[test]
    fn test_neg() {
        assert_eq!(parse_one("NEG", "r5"), vec![0x2A, 5]);
    }

    #[test]
    fn test_neg_too_few() {
        assert!(parse_one_err("NEG", "").contains("1 argument"));
    }

    #[test]
    fn test_push() {
        assert_eq!(parse_one("PUSH", "r10"), vec![0x60, 10]);
    }

    #[test]
    fn test_pop() {
        assert_eq!(parse_one("POP", "r20"), vec![0x61, 20]);
    }

    #[test]
    fn test_ikey() {
        assert_eq!(parse_one("IKEY", "r1"), vec![0x48, 1]);
    }

    #[test]
    fn test_rand() {
        assert_eq!(parse_one("RAND", "r3"), vec![0x49, 3]);
    }

    #[test]
    fn test_disconnect() {
        assert_eq!(parse_one("DISCONNECT", "r7"), vec![0x82, 7]);
    }

    #[test]
    fn test_trace_read() {
        assert_eq!(parse_one("TRACE_READ", "r0"), vec![0x83, 0]);
    }

    #[test]
    fn test_pixel_history() {
        assert_eq!(parse_one("PIXEL_HISTORY", "r2"), vec![0x84, 2]);
    }

    // ── Two-register opcodes ────────────────────────────────
    #[test]
    fn test_beep() {
        assert_eq!(parse_one("BEEP", "r1, r2"), vec![0x03, 1, 2]);
    }

    #[test]
    fn test_memcpy() {
        assert_eq!(parse_one("MEMCPY", "r1, r2, r3"), vec![0x04, 1, 2, 3]);
    }

    #[test]
    fn test_memset() {
        assert_eq!(parse_one("MEMSET", "r4, r5, r6"), vec![0xF6, 4, 5, 6]);
    }

    #[test]
    fn test_ldi_decimal() {
        assert_eq!(parse_one("LDI", "r1, 42"), vec![0x10, 1, 42]);
    }

    #[test]
    fn test_ldi_hex() {
        assert_eq!(parse_one("LDI", "r2, 0xFF"), vec![0x10, 2, 255]);
    }

    #[test]
    fn test_ldi_zero() {
        assert_eq!(parse_one("LDI", "r0, 0"), vec![0x10, 0, 0]);
    }

    #[test]
    fn test_load() {
        assert_eq!(parse_one("LOAD", "r1, r2"), vec![0x11, 1, 2]);
    }

    #[test]
    fn test_store() {
        assert_eq!(parse_one("STORE", "r3, r4"), vec![0x12, 3, 4]);
    }

    #[test]
    fn test_mov() {
        assert_eq!(parse_one("MOV", "r10, r20"), vec![0x51, 10, 20]);
    }

    #[test]
    fn test_cmp() {
        assert_eq!(parse_one("CMP", "r5, r6"), vec![0x50, 5, 6]);
    }

    #[test]
    fn test_loadb() {
        assert_eq!(parse_one("LOADB", "r1, r2"), vec![0xFB, 1, 2]);
    }

    #[test]
    fn test_storeb() {
        assert_eq!(parse_one("STOREB", "r3, r4"), vec![0xFC, 3, 4]);
    }

    #[test]
    fn test_loadh() {
        assert_eq!(parse_one("LOADH", "r5, r6"), vec![0xFD, 5, 6]);
    }

    #[test]
    fn test_storeh() {
        assert_eq!(parse_one("STOREH", "r7, r8"), vec![0xFE, 7, 8]);
    }

    // ── Arithmetic opcodes ──────────────────────────────────
    #[test]
    fn test_add() {
        assert_eq!(parse_one("ADD", "r1, r2"), vec![0x20, 1, 2]);
    }

    #[test]
    fn test_sub() {
        assert_eq!(parse_one("SUB", "r3, r4"), vec![0x21, 3, 4]);
    }

    #[test]
    fn test_mul() {
        assert_eq!(parse_one("MUL", "r5, r6"), vec![0x22, 5, 6]);
    }

    #[test]
    fn test_div() {
        assert_eq!(parse_one("DIV", "r7, r8"), vec![0x23, 7, 8]);
    }

    #[test]
    fn test_and() {
        assert_eq!(parse_one("AND", "r1, r2"), vec![0x24, 1, 2]);
    }

    #[test]
    fn test_or() {
        assert_eq!(parse_one("OR", "r3, r4"), vec![0x25, 3, 4]);
    }

    #[test]
    fn test_xor() {
        assert_eq!(parse_one("XOR", "r5, r6"), vec![0x26, 5, 6]);
    }

    #[test]
    fn test_shl() {
        assert_eq!(parse_one("SHL", "r7, r8"), vec![0x27, 7, 8]);
    }

    #[test]
    fn test_shr() {
        assert_eq!(parse_one("SHR", "r9, r10"), vec![0x28, 9, 10]);
    }

    #[test]
    fn test_mod() {
        assert_eq!(parse_one("MOD", "r1, r2"), vec![0x29, 1, 2]);
    }

    #[test]
    fn test_sar() {
        assert_eq!(parse_one("SAR", "r3, r4"), vec![0x2B, 3, 4]);
    }

    #[test]
    fn test_arith_too_few() {
        assert!(parse_one_err("ADD", "r1").contains("2 arguments"));
    }

    // ── Jump opcodes (with numeric addresses) ────────────────
    #[test]
    fn test_jmp_numeric() {
        assert_eq!(parse_one("JMP", "100"), vec![0x30, 100]);
    }

    #[test]
    fn test_jz_numeric() {
        assert_eq!(parse_one("JZ", "r5, 200"), vec![0x31, 5, 200]);
    }

    #[test]
    fn test_jnz_numeric() {
        assert_eq!(parse_one("JNZ", "r10, 300"), vec![0x32, 10, 300]);
    }

    #[test]
    fn test_blt_numeric() {
        assert_eq!(parse_one("BLT", "r0, 50"), vec![0x35, 0, 50]);
    }

    #[test]
    fn test_bge_numeric() {
        assert_eq!(parse_one("BGE", "r0, 100"), vec![0x36, 0, 100]);
    }

    #[test]
    fn test_call_numeric() {
        assert_eq!(parse_one("CALL", "500"), vec![0x33, 500]);
    }

    #[test]
    fn test_jmp_too_few() {
        assert!(parse_one_err("JMP", "").contains("1 argument"));
    }

    #[test]
    fn test_jz_too_few() {
        assert!(parse_one_err("JZ", "r1").contains("2 arguments"));
    }

    // ── Three-register opcodes ──────────────────────────────
    #[test]
    fn test_note() {
        assert_eq!(parse_one("NOTE", "r1, r2, r3"), vec![0x7E, 1, 2, 3]);
    }

    #[test]
    fn test_connect() {
        assert_eq!(parse_one("CONNECT", "r4, r5, r6"), vec![0x7F, 4, 5, 6]);
    }

    #[test]
    fn test_socksend() {
        assert_eq!(
            parse_one("SOCKSEND", "r1, r2, r3, r4"),
            vec![0x80, 1, 2, 3, 4]
        );
    }

    #[test]
    fn test_sockrecv() {
        assert_eq!(
            parse_one("SOCKRECV", "r5, r6, r7, r8"),
            vec![0x81, 5, 6, 7, 8]
        );
    }

    #[test]
    fn test_net_send() {
        assert_eq!(parse_one("NET_SEND", "r1, r2, r3"), vec![0x99, 1, 2, 3]);
    }

    #[test]
    fn test_net_recv() {
        assert_eq!(parse_one("NET_RECV", "r1, r2"), vec![0x9A, 1, 2]);
    }

    // ── Five-register opcode ────────────────────────────────
    #[test]
    fn test_httpget() {
        assert_eq!(
            parse_one("HTTPGET", "r1, r2, r3, r4, r5"),
            vec![0xCC, 1, 2, 3, 4, 5]
        );
    }

    #[test]
    fn test_httpget_too_few() {
        assert!(parse_one_err("HTTPGET", "r1, r2, r3, r4").contains("5 arguments"));
    }

    // ── High register boundary ──────────────────────────────
    #[test]
    fn test_ldi_r31() {
        assert_eq!(parse_one("LDI", "r31, 0xFFFF"), vec![0x10, 31, 0xFFFF]);
    }

    #[test]
    fn test_add_r31() {
        assert_eq!(parse_one("ADD", "r31, r30"), vec![0x20, 31, 30]);
    }

    // ── Unknown opcode ──────────────────────────────────────
    #[test]
    fn test_unknown_returns_none() {
        let mut bytecode = Vec::new();
        let mut label_refs: Vec<(usize, String, usize)> = Vec::new();
        let result = try_parse(
            "ZZZTOP",
            &["ZZZTOP"],
            &mut bytecode,
            &mut label_refs,
            0,
            &constants(),
        )
        .unwrap();
        assert!(result.is_none());
    }
}
