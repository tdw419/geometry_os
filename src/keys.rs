// keys.rs -- Keyboard input mapping for Geometry OS

use minifb::Key;

pub fn key_to_ascii(key: Key) -> Option<u8> {
    match key {
        Key::A => Some(b'A'),
        Key::B => Some(b'B'),
        Key::C => Some(b'C'),
        Key::D => Some(b'D'),
        Key::E => Some(b'E'),
        Key::F => Some(b'F'),
        Key::G => Some(b'G'),
        Key::H => Some(b'H'),
        Key::I => Some(b'I'),
        Key::J => Some(b'J'),
        Key::K => Some(b'K'),
        Key::L => Some(b'L'),
        Key::M => Some(b'M'),
        Key::N => Some(b'N'),
        Key::O => Some(b'O'),
        Key::P => Some(b'P'),
        Key::Q => Some(b'Q'),
        Key::R => Some(b'R'),
        Key::S => Some(b'S'),
        Key::T => Some(b'T'),
        Key::U => Some(b'U'),
        Key::V => Some(b'V'),
        Key::W => Some(b'W'),
        Key::X => Some(b'X'),
        Key::Y => Some(b'Y'),
        Key::Z => Some(b'Z'),
        Key::Key0 => Some(b'0'),
        Key::Key1 => Some(b'1'),
        Key::Key2 => Some(b'2'),
        Key::Key3 => Some(b'3'),
        Key::Key4 => Some(b'4'),
        Key::Key5 => Some(b'5'),
        Key::Key6 => Some(b'6'),
        Key::Key7 => Some(b'7'),
        Key::Key8 => Some(b'8'),
        Key::Key9 => Some(b'9'),
        Key::Space => Some(b' '),
        Key::Comma => Some(b','),
        Key::Period => Some(b'.'),
        Key::Slash => Some(b'/'),
        Key::Semicolon => Some(b';'),
        Key::Apostrophe => Some(b'\''),
        Key::Minus => Some(b'-'),
        Key::Equal => Some(b'='),
        Key::LeftBracket => Some(b'['),
        Key::RightBracket => Some(b']'),
        Key::Backslash => Some(b'\\'),
        // Special keys -- return their control character values
        Key::Enter => Some(0x0D),     // CR
        Key::Backspace => Some(0x08), // BS
        Key::Tab => Some(0x09),       // HT
        Key::Escape => Some(0x1B),    // ESC
        Key::Delete => Some(0x7F),    // DEL
        // Arrow keys -- use high codes (0x80+) that IKEY consumers can detect
        Key::Up => Some(0x80),       // extended: up arrow
        Key::Down => Some(0x81),     // extended: down arrow
        Key::Left => Some(0x82),     // extended: left arrow
        Key::Right => Some(0x83),    // extended: right arrow
        Key::Home => Some(0x84),     // extended: home
        Key::End => Some(0x85),      // extended: end
        Key::PageUp => Some(0x86),   // extended: page up
        Key::PageDown => Some(0x87), // extended: page down
        Key::Insert => Some(0x88),   // extended: insert
        _ => None,
    }
}

/// Map Ctrl+Shift+key combos to extended key codes (0x90+).
/// Only called when both Ctrl and Shift are held.
pub fn key_ctrl_shift(key: Key) -> Option<u8> {
    match key {
        Key::T => Some(0x90), // Ctrl+Shift+T = new tab
        Key::W => Some(0x91), // Ctrl+Shift+W = close tab
        Key::C => Some(0x96), // Ctrl+Shift+C = copy
        Key::V => Some(0x97), // Ctrl+Shift+V = paste
        _ => None,
    }
}

/// Map Ctrl+number combos to extended key codes (0x92-0x95).
/// Only called when Ctrl is held (no Shift).
pub fn key_ctrl_num(key: Key) -> Option<u8> {
    match key {
        Key::Key1 => Some(0x92), // Ctrl+1 = switch to tab 1
        Key::Key2 => Some(0x93), // Ctrl+2 = switch to tab 2
        Key::Key3 => Some(0x94), // Ctrl+3 = switch to tab 3
        Key::Key4 => Some(0x95), // Ctrl+4 = switch to tab 4
        _ => None,
    }
}

pub fn key_to_ascii_shifted(key: Key, shift: bool) -> Option<u8> {
    // Letters
    match key {
        Key::A => return Some(if shift { b'A' } else { b'a' }),
        Key::B => return Some(if shift { b'B' } else { b'b' }),
        Key::C => return Some(if shift { b'C' } else { b'c' }),
        Key::D => return Some(if shift { b'D' } else { b'd' }),
        Key::E => return Some(if shift { b'E' } else { b'e' }),
        Key::F => return Some(if shift { b'F' } else { b'f' }),
        Key::G => return Some(if shift { b'G' } else { b'g' }),
        Key::H => return Some(if shift { b'H' } else { b'h' }),
        Key::I => return Some(if shift { b'I' } else { b'i' }),
        Key::J => return Some(if shift { b'J' } else { b'j' }),
        Key::K => return Some(if shift { b'K' } else { b'k' }),
        Key::L => return Some(if shift { b'L' } else { b'l' }),
        Key::M => return Some(if shift { b'M' } else { b'm' }),
        Key::N => return Some(if shift { b'N' } else { b'n' }),
        Key::O => return Some(if shift { b'O' } else { b'o' }),
        Key::P => return Some(if shift { b'P' } else { b'p' }),
        Key::Q => return Some(if shift { b'Q' } else { b'q' }),
        Key::R => return Some(if shift { b'R' } else { b'r' }),
        Key::S => return Some(if shift { b'S' } else { b's' }),
        Key::T => return Some(if shift { b'T' } else { b't' }),
        Key::U => return Some(if shift { b'U' } else { b'u' }),
        Key::V => return Some(if shift { b'V' } else { b'v' }),
        Key::W => return Some(if shift { b'W' } else { b'w' }),
        Key::X => return Some(if shift { b'X' } else { b'x' }),
        Key::Y => return Some(if shift { b'Y' } else { b'y' }),
        Key::Z => return Some(if shift { b'Z' } else { b'z' }),
        _ => {},
    }

    // Numbers and symbols
    match key {
        Key::Key0 => Some(if shift { b')' } else { b'0' }),
        Key::Key1 => Some(if shift { b'!' } else { b'1' }),
        Key::Key2 => Some(if shift { b'@' } else { b'2' }),
        Key::Key3 => Some(if shift { b'#' } else { b'3' }),
        Key::Key4 => Some(if shift { b'$' } else { b'4' }),
        Key::Key5 => Some(if shift { b'%' } else { b'5' }),
        Key::Key6 => Some(if shift { b'^' } else { b'6' }),
        Key::Key7 => Some(if shift { b'&' } else { b'7' }),
        Key::Key8 => Some(if shift { b'*' } else { b'8' }),
        Key::Key9 => Some(if shift { b'(' } else { b'9' }),
        Key::Comma => Some(if shift { b'<' } else { b',' }),
        Key::Period => Some(if shift { b'>' } else { b'.' }),
        Key::Slash => Some(if shift { b'?' } else { b'/' }),
        Key::Semicolon => Some(if shift { b':' } else { b';' }),
        Key::Apostrophe => Some(if shift { b'"' } else { b'\'' }),
        Key::Minus => Some(if shift { b'_' } else { b'-' }),
        Key::Equal => Some(if shift { b'+' } else { b'=' }),
        Key::LeftBracket => Some(if shift { b'{' } else { b'[' }),
        Key::RightBracket => Some(if shift { b'}' } else { b']' }),
        Key::Backslash => Some(if shift { b'|' } else { b'\\' }),
        Key::Backquote => Some(if shift { b'~' } else { b'`' }),
        _ => None,
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use minifb::Key;

    // ── key_to_ascii ──

    #[test]
    fn test_letter_keys_uppercase() {
        assert_eq!(key_to_ascii(Key::A), Some(b'A'));
        assert_eq!(key_to_ascii(Key::Z), Some(b'Z'));
        assert_eq!(key_to_ascii(Key::M), Some(b'M'));
    }

    #[test]
    fn test_digit_keys() {
        assert_eq!(key_to_ascii(Key::Key0), Some(b'0'));
        assert_eq!(key_to_ascii(Key::Key5), Some(b'5'));
        assert_eq!(key_to_ascii(Key::Key9), Some(b'9'));
    }

    #[test]
    fn test_punctuation_keys() {
        assert_eq!(key_to_ascii(Key::Space), Some(b' '));
        assert_eq!(key_to_ascii(Key::Comma), Some(b','));
        assert_eq!(key_to_ascii(Key::Period), Some(b'.'));
        assert_eq!(key_to_ascii(Key::Slash), Some(b'/'));
        assert_eq!(key_to_ascii(Key::Semicolon), Some(b';'));
        assert_eq!(key_to_ascii(Key::Apostrophe), Some(b'\''));
        assert_eq!(key_to_ascii(Key::Minus), Some(b'-'));
        assert_eq!(key_to_ascii(Key::Equal), Some(b'='));
        assert_eq!(key_to_ascii(Key::LeftBracket), Some(b'['));
        assert_eq!(key_to_ascii(Key::RightBracket), Some(b']'));
        assert_eq!(key_to_ascii(Key::Backslash), Some(b'\\'));
    }

    #[test]
    fn test_control_keys() {
        assert_eq!(key_to_ascii(Key::Enter), Some(0x0D));
        assert_eq!(key_to_ascii(Key::Backspace), Some(0x08));
        assert_eq!(key_to_ascii(Key::Tab), Some(0x09));
        assert_eq!(key_to_ascii(Key::Escape), Some(0x1B));
        assert_eq!(key_to_ascii(Key::Delete), Some(0x7F));
    }

    #[test]
    fn test_arrow_keys_extended() {
        assert_eq!(key_to_ascii(Key::Up), Some(0x80));
        assert_eq!(key_to_ascii(Key::Down), Some(0x81));
        assert_eq!(key_to_ascii(Key::Left), Some(0x82));
        assert_eq!(key_to_ascii(Key::Right), Some(0x83));
    }

    #[test]
    fn test_navigation_keys_extended() {
        assert_eq!(key_to_ascii(Key::Home), Some(0x84));
        assert_eq!(key_to_ascii(Key::End), Some(0x85));
        assert_eq!(key_to_ascii(Key::PageUp), Some(0x86));
        assert_eq!(key_to_ascii(Key::PageDown), Some(0x87));
        assert_eq!(key_to_ascii(Key::Insert), Some(0x88));
    }

    #[test]
    fn test_unknown_key_returns_none() {
        assert_eq!(key_to_ascii(Key::F1), None);
        assert_eq!(key_to_ascii(Key::F12), None);
    }

    #[test]
    fn test_all_letters_have_mappings() {
        let letters = [
            Key::A,
            Key::B,
            Key::C,
            Key::D,
            Key::E,
            Key::F,
            Key::G,
            Key::H,
            Key::I,
            Key::J,
            Key::K,
            Key::L,
            Key::M,
            Key::N,
            Key::O,
            Key::P,
            Key::Q,
            Key::R,
            Key::S,
            Key::T,
            Key::U,
            Key::V,
            Key::W,
            Key::X,
            Key::Y,
            Key::Z,
        ];
        for key in &letters {
            assert!(
                key_to_ascii(*key).is_some(),
                "{:?} should map to uppercase",
                key
            );
        }
    }

    #[test]
    fn test_extended_codes_in_high_range() {
        let extended = [
            (Key::Up, 0x80),
            (Key::Down, 0x81),
            (Key::Left, 0x82),
            (Key::Right, 0x83),
            (Key::Home, 0x84),
            (Key::End, 0x85),
            (Key::PageUp, 0x86),
            (Key::PageDown, 0x87),
            (Key::Insert, 0x88),
        ];
        for (key, expected) in &extended {
            assert_eq!(key_to_ascii(*key), Some(*expected));
        }
    }

    // ── key_to_ascii_shifted ──

    #[test]
    fn test_shifted_letters() {
        assert_eq!(key_to_ascii_shifted(Key::A, false), Some(b'a'));
        assert_eq!(key_to_ascii_shifted(Key::A, true), Some(b'A'));
        assert_eq!(key_to_ascii_shifted(Key::Z, false), Some(b'z'));
        assert_eq!(key_to_ascii_shifted(Key::Z, true), Some(b'Z'));
        assert_eq!(key_to_ascii_shifted(Key::M, false), Some(b'm'));
        assert_eq!(key_to_ascii_shifted(Key::M, true), Some(b'M'));
    }

    #[test]
    fn test_shifted_numbers_to_symbols() {
        assert_eq!(key_to_ascii_shifted(Key::Key1, false), Some(b'1'));
        assert_eq!(key_to_ascii_shifted(Key::Key1, true), Some(b'!'));
        assert_eq!(key_to_ascii_shifted(Key::Key2, false), Some(b'2'));
        assert_eq!(key_to_ascii_shifted(Key::Key2, true), Some(b'@'));
        assert_eq!(key_to_ascii_shifted(Key::Key3, false), Some(b'3'));
        assert_eq!(key_to_ascii_shifted(Key::Key3, true), Some(b'#'));
        assert_eq!(key_to_ascii_shifted(Key::Key4, false), Some(b'4'));
        assert_eq!(key_to_ascii_shifted(Key::Key4, true), Some(b'$'));
        assert_eq!(key_to_ascii_shifted(Key::Key5, false), Some(b'5'));
        assert_eq!(key_to_ascii_shifted(Key::Key5, true), Some(b'%'));
        assert_eq!(key_to_ascii_shifted(Key::Key6, false), Some(b'6'));
        assert_eq!(key_to_ascii_shifted(Key::Key6, true), Some(b'^'));
        assert_eq!(key_to_ascii_shifted(Key::Key7, false), Some(b'7'));
        assert_eq!(key_to_ascii_shifted(Key::Key7, true), Some(b'&'));
        assert_eq!(key_to_ascii_shifted(Key::Key8, false), Some(b'8'));
        assert_eq!(key_to_ascii_shifted(Key::Key8, true), Some(b'*'));
        assert_eq!(key_to_ascii_shifted(Key::Key9, false), Some(b'9'));
        assert_eq!(key_to_ascii_shifted(Key::Key9, true), Some(b'('));
        assert_eq!(key_to_ascii_shifted(Key::Key0, false), Some(b'0'));
        assert_eq!(key_to_ascii_shifted(Key::Key0, true), Some(b')'));
    }

    #[test]
    fn test_shifted_punctuation() {
        assert_eq!(key_to_ascii_shifted(Key::Comma, false), Some(b','));
        assert_eq!(key_to_ascii_shifted(Key::Comma, true), Some(b'<'));
        assert_eq!(key_to_ascii_shifted(Key::Period, false), Some(b'.'));
        assert_eq!(key_to_ascii_shifted(Key::Period, true), Some(b'>'));
        assert_eq!(key_to_ascii_shifted(Key::Slash, false), Some(b'/'));
        assert_eq!(key_to_ascii_shifted(Key::Slash, true), Some(b'?'));
        assert_eq!(key_to_ascii_shifted(Key::Semicolon, false), Some(b';'));
        assert_eq!(key_to_ascii_shifted(Key::Semicolon, true), Some(b':'));
        assert_eq!(key_to_ascii_shifted(Key::Apostrophe, false), Some(b'\''));
        assert_eq!(key_to_ascii_shifted(Key::Apostrophe, true), Some(b'"'));
        assert_eq!(key_to_ascii_shifted(Key::Minus, false), Some(b'-'));
        assert_eq!(key_to_ascii_shifted(Key::Minus, true), Some(b'_'));
        assert_eq!(key_to_ascii_shifted(Key::Equal, false), Some(b'='));
        assert_eq!(key_to_ascii_shifted(Key::Equal, true), Some(b'+'));
        assert_eq!(key_to_ascii_shifted(Key::LeftBracket, false), Some(b'['));
        assert_eq!(key_to_ascii_shifted(Key::LeftBracket, true), Some(b'{'));
        assert_eq!(key_to_ascii_shifted(Key::RightBracket, false), Some(b']'));
        assert_eq!(key_to_ascii_shifted(Key::RightBracket, true), Some(b'}'));
        assert_eq!(key_to_ascii_shifted(Key::Backslash, false), Some(b'\\'));
        assert_eq!(key_to_ascii_shifted(Key::Backslash, true), Some(b'|'));
    }

    #[test]
    fn test_shifted_backquote() {
        assert_eq!(key_to_ascii_shifted(Key::Backquote, false), Some(b'`'));
        assert_eq!(key_to_ascii_shifted(Key::Backquote, true), Some(b'~'));
    }

    #[test]
    fn test_shifted_unknown_returns_none() {
        assert_eq!(key_to_ascii_shifted(Key::F1, false), None);
        assert_eq!(key_to_ascii_shifted(Key::F1, true), None);
    }

    #[test]
    fn test_shifted_all_letters_covered() {
        let letters = [
            Key::A,
            Key::B,
            Key::C,
            Key::D,
            Key::E,
            Key::F,
            Key::G,
            Key::H,
            Key::I,
            Key::J,
            Key::K,
            Key::L,
            Key::M,
            Key::N,
            Key::O,
            Key::P,
            Key::Q,
            Key::R,
            Key::S,
            Key::T,
            Key::U,
            Key::V,
            Key::W,
            Key::X,
            Key::Y,
            Key::Z,
        ];
        for key in &letters {
            assert!(key_to_ascii_shifted(*key, false).is_some());
            assert!(key_to_ascii_shifted(*key, true).is_some());
        }
    }

    // ── key_ctrl_shift ──

    #[test]
    fn test_ctrl_shift_mappings() {
        assert_eq!(key_ctrl_shift(Key::T), Some(0x90));
        assert_eq!(key_ctrl_shift(Key::W), Some(0x91));
        assert_eq!(key_ctrl_shift(Key::C), Some(0x96));
        assert_eq!(key_ctrl_shift(Key::V), Some(0x97));
    }

    #[test]
    fn test_ctrl_shift_unknown_returns_none() {
        assert_eq!(key_ctrl_shift(Key::A), None);
        assert_eq!(key_ctrl_shift(Key::Key1), None);
        assert_eq!(key_ctrl_shift(Key::Enter), None);
    }

    // ── key_ctrl_num ──

    #[test]
    fn test_ctrl_num_mappings() {
        assert_eq!(key_ctrl_num(Key::Key1), Some(0x92));
        assert_eq!(key_ctrl_num(Key::Key2), Some(0x93));
        assert_eq!(key_ctrl_num(Key::Key3), Some(0x94));
        assert_eq!(key_ctrl_num(Key::Key4), Some(0x95));
    }

    #[test]
    fn test_ctrl_num_unknown_returns_none() {
        assert_eq!(key_ctrl_num(Key::Key0), None);
        assert_eq!(key_ctrl_num(Key::Key5), None);
        assert_eq!(key_ctrl_num(Key::A), None);
        assert_eq!(key_ctrl_num(Key::Enter), None);
    }

    // ── Consistency between functions ──

    #[test]
    fn test_key_to_ascii_always_uppercase() {
        for key in &[Key::A, Key::M, Key::Z] {
            let result = key_to_ascii(*key).unwrap();
            assert!(
                result.is_ascii_uppercase() || result >= 0x7F,
                "key_to_ascii should return uppercase for letters, got {:?} for {:?}",
                result,
                key
            );
        }
    }

    #[test]
    fn test_key_to_ascii_shifted_lowercase_by_default() {
        for key in &[Key::A, Key::M, Key::Z] {
            let result = key_to_ascii_shifted(*key, false).unwrap();
            assert!(
                result.is_ascii_lowercase(),
                "shifted=false should be lowercase, got {:?} for {:?}",
                result as char,
                key
            );
        }
    }

    #[test]
    fn test_shifted_true_matches_key_to_ascii_for_letters() {
        for key in &[Key::A, Key::B, Key::C, Key::M, Key::Z] {
            assert_eq!(
                key_to_ascii_shifted(*key, true),
                key_to_ascii(*key),
                "shifted(key, true) should match key_to_ascii(key) for {:?}",
                key
            );
        }
    }

    #[test]
    fn test_extended_key_ranges_dont_overlap() {
        let standard = key_to_ascii(Key::Enter).unwrap(); // 0x0D
        let extended = key_to_ascii(Key::Up).unwrap(); // 0x80
        assert!(standard < 0x80, "standard keys should be below 0x80");
        assert!(extended >= 0x80, "extended keys should be at or above 0x80");
    }
}
