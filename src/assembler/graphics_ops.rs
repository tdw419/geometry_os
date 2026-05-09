// assembler/graphics_ops.rs -- Graphics instruction match arms
//
// PSET, PSETI, FILL, RECTF, TEXT, LINE, CIRCLE, SCROLL,
// SPRITE, TILEMAP, PEEK, SCREENP

use super::{parse_imm, parse_reg};

type Constants<'a> = &'a std::collections::HashMap<String, u32>;

pub(super) fn try_parse(
    opcode: &str,
    tokens: &[&str],
    bytecode: &mut Vec<u32>,
    constants: Constants,
) -> Result<Option<()>, String> {
    match opcode {
        "PSET" => {
            if tokens.len() < 4 {
                return Err("PSET requires 3 arguments: PSET x_reg, y_reg, color_reg".to_string());
            }
            bytecode.push(0x40);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "PSETI" => {
            if tokens.len() < 4 {
                return Err("PSETI requires 3 arguments: PSETI x, y, color".to_string());
            }
            bytecode.push(0x41);
            bytecode.push(parse_imm(tokens[1], constants)?);
            bytecode.push(parse_imm(tokens[2], constants)?);
            bytecode.push(parse_imm(tokens[3], constants)?);
            Ok(Some(()))
        }

        "FILL" => {
            if tokens.len() < 2 {
                return Err("FILL requires 1 argument: FILL color_reg".to_string());
            }
            bytecode.push(0x42);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "RECTF" => {
            if tokens.len() < 6 {
                return Err(
                    "RECTF requires 5 arguments: RECTF x_reg, y_reg, w_reg, h_reg, color_reg"
                        .to_string(),
                );
            }
            bytecode.push(0x43);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            bytecode.push(parse_reg(tokens[5])? as u32);
            Ok(Some(()))
        }

        "FLOOD" => {
            if tokens.len() < 5 {
                return Err(
                    "FLOOD requires 4 arguments: FLOOD x_reg, y_reg, fill_reg, tolerance_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xCE);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            Ok(Some(()))
        }

        "TEXT" => {
            if tokens.len() < 4 {
                return Err("TEXT requires 3 arguments: TEXT x_reg, y_reg, addr_reg".to_string());
            }
            bytecode.push(0x44);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "DRAWTEXT" => {
            if tokens.len() < 6 {
                return Err("DRAWTEXT requires 5 arguments: DRAWTEXT x_reg, y_reg, addr_reg, fg_reg, bg_reg".to_string());
            }
            bytecode.push(0x8C);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            bytecode.push(parse_reg(tokens[5])? as u32);
            Ok(Some(()))
        }

        "SMALLTEXT" => {
            if tokens.len() < 6 {
                return Err("SMALLTEXT requires 5 arguments: SMALLTEXT x_reg, y_reg, addr_reg, fg_reg, bg_reg".to_string());
            }
            bytecode.push(0xD0);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            bytecode.push(parse_reg(tokens[5])? as u32);
            Ok(Some(()))
        }

        "MEDTEXT" => {
            if tokens.len() < 6 {
                return Err(
                    "MEDTEXT requires 5 arguments: MEDTEXT x_reg, y_reg, addr_reg, fg_reg, bg_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xD1);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            bytecode.push(parse_reg(tokens[5])? as u32);
            Ok(Some(()))
        }

        "VWTXT" => {
            if tokens.len() < 6 {
                return Err(
                    "VWTXT requires 5 arguments: VWTXT x_reg, y_reg, addr_reg, fg_reg, bg_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xDB);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            bytecode.push(parse_reg(tokens[5])? as u32);
            Ok(Some(()))
        }

        "FONT_SELECT" => {
            if tokens.len() < 2 {
                return Err("FONT_SELECT requires 1 argument: FONT_SELECT mode_reg".to_string());
            }
            bytecode.push(0xDC);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "LINE" => {
            if tokens.len() < 6 {
                return Err("LINE requires 5 arguments: LINE x0r, y0r, x1r, y1r, cr".to_string());
            }
            bytecode.push(0x45);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            bytecode.push(parse_reg(tokens[5])? as u32);
            Ok(Some(()))
        }

        "CIRCLE" => {
            if tokens.len() < 5 {
                return Err("CIRCLE requires 4 arguments: CIRCLE xr, yr, rr, cr".to_string());
            }
            bytecode.push(0x46);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            Ok(Some(()))
        }

        "SCROLL" => {
            if tokens.len() < 2 {
                return Err("SCROLL requires 1 argument: SCROLL nr".to_string());
            }
            bytecode.push(0x47);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "SPRITE" => {
            if tokens.len() < 6 {
                return Err(
                    "SPRITE requires 5 arguments: SPRITE x_reg, y_reg, addr_reg, w_reg, h_reg"
                        .to_string(),
                );
            }
            bytecode.push(0x4A);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            bytecode.push(parse_reg(tokens[5])? as u32);
            Ok(Some(()))
        }

        "TILEMAP" => {
            if tokens.len() < 9 {
                return Err(
                    "TILEMAP requires 8 arguments: TILEMAP xr, yr, mr, tr, gwr, ghr, twr, thr"
                        .to_string(),
                );
            }
            bytecode.push(0x4C);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            bytecode.push(parse_reg(tokens[5])? as u32);
            bytecode.push(parse_reg(tokens[6])? as u32);
            bytecode.push(parse_reg(tokens[7])? as u32);
            bytecode.push(parse_reg(tokens[8])? as u32);
            Ok(Some(()))
        }

        "PEEK" => {
            if tokens.len() < 4 {
                return Err("PEEK requires 3 arguments: PEEK rx, ry, rd".to_string());
            }
            bytecode.push(0x4F);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "SCREENP" => {
            if tokens.len() < 4 {
                return Err(
                    "SCREENP requires 3 arguments: SCREENP dest_reg, x_reg, y_reg".to_string(),
                );
            }
            bytecode.push(0x6D);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "HITSET" => {
            if tokens.len() < 6 {
                return Err(
                    "HITSET requires 5 arguments: HITSET x_reg, y_reg, w_reg, h_reg, id"
                        .to_string(),
                );
            }
            bytecode.push(0x37);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            bytecode.push(parse_imm(tokens[5], constants)?);
            Ok(Some(()))
        }

        "HITQ" => {
            if tokens.len() < 2 {
                return Err("HITQ requires 1 argument: HITQ dest_reg".to_string());
            }
            bytecode.push(0x38);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "MOUSEQ" => {
            if tokens.len() < 2 {
                return Err(
                    "MOUSEQ requires 1 argument: MOUSEQ x_reg (Y goes into x_reg+1)".to_string(),
                );
            }
            bytecode.push(0x85);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "IMOUSE" => {
            if tokens.len() < 2 {
                return Err(
                    "IMOUSE requires 1 argument: IMOUSE rd (event→rd, x→rd+1, y→rd+2)".to_string(),
                );
            }
            bytecode.push(0xC7);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "MOUSEX" => {
            if tokens.len() < 2 {
                return Err("MOUSEX requires 1 argument: MOUSEX dest_reg".to_string());
            }
            bytecode.push(0xC8);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "MOUSEY" => {
            if tokens.len() < 2 {
                return Err("MOUSEY requires 1 argument: MOUSEY dest_reg".to_string());
            }
            bytecode.push(0xC9);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "MOUSEB" => {
            if tokens.len() < 2 {
                return Err("MOUSEB requires 1 argument: MOUSEB dest_reg".to_string());
            }
            bytecode.push(0xCA);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "MOUSECLICK" => {
            if tokens.len() < 2 {
                return Err(
                    "MOUSECLICK requires 1 argument: MOUSECLICK rd (type→rd, x→rd+1, y→rd+2)"
                        .to_string(),
                );
            }
            bytecode.push(0xCB);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "RECT" => {
            if tokens.len() < 6 {
                return Err(
                    "RECT requires 5 arguments: RECT x_reg, y_reg, w_reg, h_reg, color_reg"
                        .to_string(),
                );
            }
            bytecode.push(0x88);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            bytecode.push(parse_reg(tokens[5])? as u32);
            Ok(Some(()))
        }

        "SPRBLT" => {
            if tokens.len() < 5 {
                return Err(
                    "SPRBLT requires 4 arguments: SPRBLT sheet_addr_reg, sprite_id_reg, x_reg, y_reg"
                        .to_string(),
                );
            }
            bytecode.push(0x97);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            Ok(Some(()))
        }

        "SPRLOAD" => {
            // SPRLOAD sheet_id, addr_reg, frame_w_reg, frame_h_reg, frames_reg
            // sheet_id is an immediate (0-15), rest are registers
            if tokens.len() < 6 {
                return Err(
                    "SPRLOAD requires 5 arguments: SPRLOAD sheet_id, addr_reg, frame_w_reg, frame_h_reg, frames_reg"
                        .to_string(),
                );
            }
            let sheet_id: u32 = tokens[1]
                .parse()
                .map_err(|_| format!("invalid sheet_id: {}", tokens[1]))?;
            bytecode.push(0xE5);
            bytecode.push(sheet_id);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            bytecode.push(parse_reg(tokens[5])? as u32);
            Ok(Some(()))
        }

        "SPRFRAME" => {
            // SPRFRAME sheet_id, frame_reg
            // sheet_id is an immediate (0-15), frame_reg is a register
            if tokens.len() < 3 {
                return Err(
                    "SPRFRAME requires 2 arguments: SPRFRAME sheet_id, frame_reg".to_string(),
                );
            }
            let sheet_id: u32 = tokens[1]
                .parse()
                .map_err(|_| format!("invalid sheet_id: {}", tokens[1]))?;
            bytecode.push(0xE6);
            bytecode.push(sheet_id);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "SPRANIM" => {
            // SPRANIM sheet_id, x_reg, y_reg
            // sheet_id is an immediate (0-15), x_reg and y_reg are registers
            if tokens.len() < 4 {
                return Err(
                    "SPRANIM requires 3 arguments: SPRANIM sheet_id, x_reg, y_reg".to_string(),
                );
            }
            let sheet_id: u32 = tokens[1]
                .parse()
                .map_err(|_| format!("invalid sheet_id: {}", tokens[1]))?;
            bytecode.push(0xE7);
            bytecode.push(sheet_id);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "SPRITEANIM" => {
            // SPRITEANIM sheet_id, x_reg, y_reg
            // sheet_id is an immediate (0-15), x_reg and y_reg are registers
            // Blits current frame then auto-advances frame counter with wrap-around
            if tokens.len() < 4 {
                return Err(
                    "SPRITEANIM requires 3 arguments: SPRITEANIM sheet_id, x_reg, y_reg"
                        .to_string(),
                );
            }
            let sheet_id: u32 = tokens[1]
                .parse()
                .map_err(|_| format!("invalid sheet_id: {}", tokens[1]))?;
            bytecode.push(0xEC);
            bytecode.push(sheet_id);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "BLEND" => {
            if tokens.len() < 5 {
                return Err(
                    "BLEND requires 4 arguments: BLEND x_reg, y_reg, color_reg, alpha_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xF2);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            Ok(Some(()))
        }

        "BLENDR" => {
            if tokens.len() < 4 {
                return Err(
                    "BLENDR requires 3 arguments: BLENDR dst_reg, src_reg, alpha_reg".to_string(),
                );
            }
            bytecode.push(0xF3);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "ROTATE" => {
            if tokens.len() < 6 {
                return Err(
                    "ROTATE requires 5 arguments: ROTATE x_reg, y_reg, w_reg, h_reg, angle_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xF4);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            bytecode.push(parse_reg(tokens[5])? as u32);
            Ok(Some(()))
        }

        "SCALE" => {
            if tokens.len() < 9 {
                return Err(
                    "SCALE requires 8 arguments: SCALE sx_reg, sy_reg, sw_reg, sh_reg, dx_reg, dy_reg, dw_reg, dh_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xF5);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            bytecode.push(parse_reg(tokens[5])? as u32);
            bytecode.push(parse_reg(tokens[6])? as u32);
            bytecode.push(parse_reg(tokens[7])? as u32);
            bytecode.push(parse_reg(tokens[8])? as u32);
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

    fn assemble_graphics(opcode: &str, args: &str) -> Result<Vec<u32>, String> {
        let tokens: Vec<&str> = args.split(',').map(|s| s.trim()).collect();
        let mut tokens = vec![opcode];
        tokens.extend(args.split(',').map(|s| s.trim()));
        let mut bytecode = Vec::new();
        let constants = constants();
        try_parse(opcode, &tokens, &mut bytecode, &constants)?;
        Ok(bytecode)
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
        try_parse(opcode, &tokens, &mut bytecode, &constants())
            .unwrap_err()
    }

    // ── PSET (0x40) ──────────────────────────────────────────
    #[test]
    fn test_pset_basic() {
        let bc = parse_one("PSET", "r1, r2, r3");
        assert_eq!(bc, vec![0x40, 1, 2, 3]);
    }

    #[test]
    fn test_pset_r0_registers() {
        let bc = parse_one("PSET", "r0, r0, r0");
        assert_eq!(bc, vec![0x40, 0, 0, 0]);
    }

    #[test]
    fn test_pset_high_registers() {
        let bc = parse_one("PSET", "r31, r30, r29");
        assert_eq!(bc, vec![0x40, 31, 30, 29]);
    }

    #[test]
    fn test_pset_too_few_args() {
        let err = parse_one_err("PSET", "r1, r2");
        assert!(err.contains("3 arguments"), "got: {err}");
    }

    // ── PSETI (0x41) ─────────────────────────────────────────
    #[test]
    fn test_pseti_basic() {
        let bc = parse_one("PSETI", "10, 20, 0xFF0000");
        assert_eq!(bc, vec![0x41, 10, 20, 0xFF0000]);
    }

    #[test]
    fn test_pseti_zero_coords() {
        let bc = parse_one("PSETI", "0, 0, 0");
        assert_eq!(bc, vec![0x41, 0, 0, 0]);
    }

    #[test]
    fn test_pseti_max_values() {
        let bc = parse_one("PSETI", "255, 255, 0xFFFFFFFF");
        assert_eq!(bc, vec![0x41, 255, 255, 0xFFFFFFFF]);
    }

    #[test]
    fn test_pseti_too_few_args() {
        let err = parse_one_err("PSETI", "10, 20");
        assert!(err.contains("3 arguments"), "got: {err}");
    }

    // ── FILL (0x42) ──────────────────────────────────────────
    #[test]
    fn test_fill_basic() {
        let bc = parse_one("FILL", "r5");
        assert_eq!(bc, vec![0x42, 5]);
    }

    #[test]
    fn test_fill_no_args() {
        let err = parse_one_err("FILL", "");
        assert!(err.contains("1 argument"), "got: {err}");
    }

    // ── RECTF (0x43) ─────────────────────────────────────────
    #[test]
    fn test_rectf_basic() {
        let bc = parse_one("RECTF", "r1, r2, r3, r4, r5");
        assert_eq!(bc, vec![0x43, 1, 2, 3, 4, 5]);
    }

    #[test]
    fn test_rectf_too_few_args() {
        let err = parse_one_err("RECTF", "r1, r2, r3");
        assert!(err.contains("5 arguments"), "got: {err}");
    }

    // ── FLOOD (0xCE) ─────────────────────────────────────────
    #[test]
    fn test_flood_basic() {
        let bc = parse_one("FLOOD", "r10, r11, r12, r13");
        assert_eq!(bc, vec![0xCE, 10, 11, 12, 13]);
    }

    #[test]
    fn test_flood_too_few_args() {
        let err = parse_one_err("FLOOD", "r10, r11");
        assert!(err.contains("4 arguments"), "got: {err}");
    }

    // ── TEXT (0x44) ──────────────────────────────────────────
    #[test]
    fn test_text_basic() {
        let bc = parse_one("TEXT", "r10, r11, r12");
        assert_eq!(bc, vec![0x44, 10, 11, 12]);
    }

    #[test]
    fn test_text_arg_order() {
        // TEXT x_reg, y_reg, addr_reg
        let bc = parse_one("TEXT", "r1, r2, r3");
        assert_eq!(bc[1], 1); // x
        assert_eq!(bc[2], 2); // y
        assert_eq!(bc[3], 3); // addr
    }

    #[test]
    fn test_text_too_few_args() {
        let err = parse_one_err("TEXT", "r10, r11");
        assert!(err.contains("3 arguments"), "got: {err}");
    }

    // ── DRAWTEXT (0x8C) ──────────────────────────────────────
    #[test]
    fn test_drawtext_basic() {
        let bc = parse_one("DRAWTEXT", "r1, r2, r3, r4, r5");
        assert_eq!(bc, vec![0x8C, 1, 2, 3, 4, 5]);
    }

    // ── SMALLTEXT (0xD0) ─────────────────────────────────────
    #[test]
    fn test_smalltext_basic() {
        let bc = parse_one("SMALLTEXT", "r1, r2, r3, r4, r5");
        assert_eq!(bc, vec![0xD0, 1, 2, 3, 4, 5]);
    }

    // ── MEDTEXT (0xD1) ───────────────────────────────────────
    #[test]
    fn test_medtext_basic() {
        let bc = parse_one("MEDTEXT", "r1, r2, r3, r4, r5");
        assert_eq!(bc, vec![0xD1, 1, 2, 3, 4, 5]);
    }

    // ── VWTXT (0xDB) ────────────────────────────────────────
    #[test]
    fn test_vwtxt_basic() {
        let bc = parse_one("VWTXT", "r1, r2, r3, r4, r5");
        assert_eq!(bc, vec![0xDB, 1, 2, 3, 4, 5]);
    }

    // ── FONT_SELECT (0xDC) ───────────────────────────────────
    #[test]
    fn test_font_select_basic() {
        let bc = parse_one("FONT_SELECT", "r1");
        assert_eq!(bc, vec![0xDC, 1]);
    }

    // ── LINE (0x45) ──────────────────────────────────────────
    #[test]
    fn test_line_basic() {
        let bc = parse_one("LINE", "r1, r2, r3, r4, r5");
        assert_eq!(bc, vec![0x45, 1, 2, 3, 4, 5]);
    }

    #[test]
    fn test_line_too_few_args() {
        let err = parse_one_err("LINE", "r1, r2, r3");
        assert!(err.contains("5 arguments"), "got: {err}");
    }

    // ── CIRCLE (0x46) ────────────────────────────────────────
    #[test]
    fn test_circle_basic() {
        let bc = parse_one("CIRCLE", "r10, r11, r12, r13");
        assert_eq!(bc, vec![0x46, 10, 11, 12, 13]);
    }

    #[test]
    fn test_circle_too_few_args() {
        let err = parse_one_err("CIRCLE", "r10, r11");
        assert!(err.contains("4 arguments"), "got: {err}");
    }

    // ── SCROLL (0x47) ────────────────────────────────────────
    #[test]
    fn test_scroll_basic() {
        let bc = parse_one("SCROLL", "r5");
        assert_eq!(bc, vec![0x47, 5]);
    }

    #[test]
    fn test_scroll_no_args() {
        let err = parse_one_err("SCROLL", "");
        assert!(err.contains("1 argument"), "got: {err}");
    }

    // ── SPRITE (0x4A) ────────────────────────────────────────
    #[test]
    fn test_sprite_basic() {
        let bc = parse_one("SPRITE", "r1, r2, r3, r4, r5");
        assert_eq!(bc, vec![0x4A, 1, 2, 3, 4, 5]);
    }

    #[test]
    fn test_sprite_too_few_args() {
        let err = parse_one_err("SPRITE", "r1, r2");
        assert!(err.contains("5 arguments"), "got: {err}");
    }

    // ── TILEMAP (0x4C) ───────────────────────────────────────
    #[test]
    fn test_tilemap_basic() {
        let bc = parse_one("TILEMAP", "r1, r2, r3, r4, r5, r6, r7, r8");
        assert_eq!(bc, vec![0x4C, 1, 2, 3, 4, 5, 6, 7, 8]);
    }

    #[test]
    fn test_tilemap_too_few_args() {
        let err = parse_one_err("TILEMAP", "r1, r2, r3");
        assert!(err.contains("8 arguments"), "got: {err}");
    }

    // ── PEEK (0x4F) vs SCREENP (0x6D) ──────────────────────
    #[test]
    fn test_peek_arg_order() {
        // PEEK xr, yr, rd
        let bc = parse_one("PEEK", "r1, r2, r3");
        assert_eq!(bc, vec![0x4F, 1, 2, 3]);
    }

    #[test]
    fn test_screenp_arg_order() {
        // SCREENP dest_reg, x_reg, y_reg
        let bc = parse_one("SCREENP", "r1, r2, r3");
        assert_eq!(bc, vec![0x6D, 1, 2, 3]);
    }

    #[test]
    fn test_peek_and_screenp_different_opcodes() {
        let peek = parse_one("PEEK", "r1, r2, r3");
        let screenp = parse_one("SCREENP", "r1, r2, r3");
        assert_ne!(peek[0], screenp[0], "PEEK and SCREENP must have different opcodes");
        assert_eq!(peek[0], 0x4F);
        assert_eq!(screenp[0], 0x6D);
    }

    // ── HITSET (0x37) ────────────────────────────────────────
    #[test]
    fn test_hitset_basic() {
        let bc = parse_one("HITSET", "r1, r2, r3, r4, 5");
        assert_eq!(bc, vec![0x37, 1, 2, 3, 4, 5]);
    }

    // ── HITQ (0x38) ──────────────────────────────────────────
    #[test]
    fn test_hitq_basic() {
        let bc = parse_one("HITQ", "r1");
        assert_eq!(bc, vec![0x38, 1]);
    }

    // ── Mouse opcodes ────────────────────────────────────────
    #[test]
    fn test_mouseq_basic() {
        let bc = parse_one("MOUSEQ", "r1");
        assert_eq!(bc, vec![0x85, 1]);
    }

    #[test]
    fn test_imouse_basic() {
        let bc = parse_one("IMOUSE", "r1");
        assert_eq!(bc, vec![0xC7, 1]);
    }

    #[test]
    fn test_mousex_basic() {
        let bc = parse_one("MOUSEX", "r1");
        assert_eq!(bc, vec![0xC8, 1]);
    }

    #[test]
    fn test_mousey_basic() {
        let bc = parse_one("MOUSEY", "r1");
        assert_eq!(bc, vec![0xC9, 1]);
    }

    #[test]
    fn test_mouseb_basic() {
        let bc = parse_one("MOUSEB", "r1");
        assert_eq!(bc, vec![0xCA, 1]);
    }

    #[test]
    fn test_mouseclick_basic() {
        let bc = parse_one("MOUSECLICK", "r1");
        assert_eq!(bc, vec![0xCB, 1]);
    }

    // ── RECT (0x88) ──────────────────────────────────────────
    #[test]
    fn test_rect_basic() {
        let bc = parse_one("RECT", "r1, r2, r3, r4, r5");
        assert_eq!(bc, vec![0x88, 1, 2, 3, 4, 5]);
    }

    // ── SPRBLT (0x97) ────────────────────────────────────────
    #[test]
    fn test_sprblt_basic() {
        let bc = parse_one("SPRBLT", "r1, r2, r3, r4");
        assert_eq!(bc, vec![0x97, 1, 2, 3, 4]);
    }

    // ── SPRLOAD (0xE5) ───────────────────────────────────────
    #[test]
    fn test_sprload_basic() {
        let bc = parse_one("SPRLOAD", "3, r1, r2, r3, r4");
        assert_eq!(bc, vec![0xE5, 3, 1, 2, 3, 4]);
    }

    #[test]
    fn test_sprload_invalid_sheet_id() {
        let err = parse_one_err("SPRLOAD", "abc, r1, r2, r3, r4");
        assert!(err.contains("invalid sheet_id"), "got: {err}");
    }

    // ── SPRFRAME (0xE6) ─────────────────────────────────────
    #[test]
    fn test_sprframe_basic() {
        let bc = parse_one("SPRFRAME", "5, r10");
        assert_eq!(bc, vec![0xE6, 5, 10]);
    }

    // ── SPRANIM (0xE7) ──────────────────────────────────────
    #[test]
    fn test_spranim_basic() {
        let bc = parse_one("SPRANIM", "7, r10, r11");
        assert_eq!(bc, vec![0xE7, 7, 10, 11]);
    }

    // ── SPRITEANIM (0xEC) ───────────────────────────────────
    #[test]
    fn test_spriteanim_basic() {
        let bc = parse_one("SPRITEANIM", "0, r10, r11");
        assert_eq!(bc, vec![0xEC, 0, 10, 11]);
    }

    // ── BLEND (0xF2) ────────────────────────────────────────
    #[test]
    fn test_blend_basic() {
        let bc = parse_one("BLEND", "r1, r2, r3, r4");
        assert_eq!(bc, vec![0xF2, 1, 2, 3, 4]);
    }

    #[test]
    fn test_blend_too_few_args() {
        let err = parse_one_err("BLEND", "r1, r2");
        assert!(err.contains("4 arguments"), "got: {err}");
    }

    // ── BLENDR (0xF3) ───────────────────────────────────────
    #[test]
    fn test_blendr_basic() {
        let bc = parse_one("BLENDR", "r1, r2, r3");
        assert_eq!(bc, vec![0xF3, 1, 2, 3]);
    }

    // ── ROTATE (0xF4) ───────────────────────────────────────
    #[test]
    fn test_rotate_basic() {
        let bc = parse_one("ROTATE", "r1, r2, r3, r4, r5");
        assert_eq!(bc, vec![0xF4, 1, 2, 3, 4, 5]);
    }

    #[test]
    fn test_rotate_too_few_args() {
        let err = parse_one_err("ROTATE", "r1, r2");
        assert!(err.contains("5 arguments"), "got: {err}");
    }

    // ── SCALE (0xF5) ────────────────────────────────────────
    #[test]
    fn test_scale_basic() {
        let bc = parse_one("SCALE", "r1, r2, r3, r4, r5, r6, r7, r8");
        assert_eq!(bc, vec![0xF5, 1, 2, 3, 4, 5, 6, 7, 8]);
    }

    #[test]
    fn test_scale_too_few_args() {
        let err = parse_one_err("SCALE", "r1, r2, r3");
        assert!(err.contains("8 arguments"), "got: {err}");
    }

    // ── Full assemble round-trip tests ───────────────────────
    #[test]
    fn test_assemble_pset_through_full_pipeline() {
        use crate::assembler::assemble;
        let src = "PSET r1, r2, r3\nHALT";
        let result = assemble(src, 0).expect("assembly should succeed");
        assert_eq!(result.pixels[0], 0x40); // PSET
        assert_eq!(result.pixels[1], 1);    // r1
        assert_eq!(result.pixels[2], 2);    // r2
        assert_eq!(result.pixels[3], 3);    // r3
        assert_eq!(result.pixels[4], 0x00); // HALT
    }

    #[test]
    fn test_assemble_graphics_sequence() {
        use crate::assembler::assemble;
        let src = "FILL r0\nRECTF r1, r2, r3, r4, r5\nLINE r6, r7, r8, r9, r10\nCIRCLE r11, r12, r13, r14\nHALT";
        let result = assemble(src, 0).expect("assembly should succeed");
        let mut pos = 0;
        // FILL: 2 words
        assert_eq!(result.pixels[pos], 0x42); pos += 2;
        // RECTF: 6 words
        assert_eq!(result.pixels[pos], 0x43); pos += 6;
        // LINE: 6 words
        assert_eq!(result.pixels[pos], 0x45); pos += 6;
        // CIRCLE: 5 words
        assert_eq!(result.pixels[pos], 0x46); pos += 5;
        // HALT: 1 word
        assert_eq!(result.pixels[pos], 0x00);
    }

    #[test]
    fn test_assemble_blend_rotate_scale() {
        use crate::assembler::assemble;
        let src = "BLEND r1, r2, r3, r4\nROTATE r5, r6, r7, r8, r9\nSCALE r10, r11, r12, r13, r14, r15, r16, r17\nHALT";
        let result = assemble(src, 0).expect("assembly should succeed");
        let mut pos = 0;
        assert_eq!(result.pixels[pos], 0xF2); pos += 5; // BLEND
        assert_eq!(result.pixels[pos], 0xF4); pos += 6; // ROTATE
        assert_eq!(result.pixels[pos], 0xF5); pos += 9; // SCALE
        assert_eq!(result.pixels[pos], 0x00);            // HALT
    }

    // ── Unknown opcode returns Ok(None) ──────────────────────
    #[test]
    fn test_unknown_opcode_returns_none() {
        let tokens = vec!["NOTGRAPHICS"];
        let mut bytecode = Vec::new();
        let result = try_parse("NOTGRAPHICS", &tokens, &mut bytecode, &constants()).unwrap();
        assert!(result.is_none());
        assert!(bytecode.is_empty());
    }

    // ── Constants in immediates ──────────────────────────────
    #[test]
    fn test_pseti_with_constants() {
        let mut consts = HashMap::new();
        consts.insert("RED".to_string(), 0xFF0000);
        let tokens = vec!["PSETI", "10", "20", "RED"];
        let mut bytecode = Vec::new();
        try_parse("PSETI", &tokens, &mut bytecode, &consts).unwrap();
        assert_eq!(bytecode, vec![0x41, 10, 20, 0xFF0000]);
    }
}
