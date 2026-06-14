// assembler/includes.rs -- .include and .lib directive resolution

use super::AsmError;

/// Maximum include depth to prevent recursive includes.
const MAX_INCLUDE_DEPTH: usize = 8;

/// Resolve .include directives by recursively inlining file contents.
pub(super) fn resolve_includes(
    source: &str,
    lib_dir: Option<&str>,
    depth: usize,
) -> Result<String, AsmError> {
    if depth > MAX_INCLUDE_DEPTH {
        return Err(AsmError::new(
            0,
            "include depth exceeded (possible circular include)",
        ));
    }

    let mut output = String::new();
    for (line_num, raw_line) in source.lines().enumerate() {
        let trimmed = raw_line.trim();
        // .lib name -- shorthand for .include "lib/name.asm"
        if trimmed.to_lowercase().starts_with(".lib") {
            let rest = trimmed[4..].trim();
            if rest.is_empty() {
                return Err(AsmError::new(line_num + 1, ".lib requires a library name"));
            }
            let name = if (rest.starts_with('"') && rest.ends_with('"'))
                || (rest.starts_with('\'') && rest.ends_with('\''))
            {
                &rest[1..rest.len() - 1]
            } else {
                rest
            };
            let filename = format!("lib/{}.asm", name);
            // Search for the file (same logic as .include)
            let filepath = if let Some(dir) = lib_dir {
                let p = std::path::Path::new(dir).join(&filename);
                if p.exists() {
                    Some(p)
                } else {
                    std::path::Path::new(&filename)
                        .exists()
                        .then(|| std::path::PathBuf::from(&filename))
                }
            } else {
                std::path::Path::new(&filename)
                    .exists()
                    .then(|| std::path::PathBuf::from(&filename))
            };
            match filepath {
                Some(path) => {
                    let included = std::fs::read_to_string(&path).map_err(|e| {
                        AsmError::new(
                            line_num + 1,
                            format!("cannot read lib file '{}': {}", filename, e),
                        )
                    })?;
                    let expanded = resolve_includes(&included, lib_dir, depth + 1)?;
                    output.push_str("; --- begin lib: ");
                    output.push_str(&filename);
                    output.push_str(" ---\n");
                    output.push_str(&expanded);
                    if !expanded.ends_with('\n') {
                        output.push('\n');
                    }
                    output.push_str("; --- end lib: ");
                    output.push_str(&filename);
                    output.push_str(" ---\n");
                },
                None => {
                    return Err(AsmError::new(
                        line_num + 1,
                        format!("lib not found: '{}'", filename),
                    ));
                },
            }
        } else if trimmed.to_lowercase().starts_with(".include") {
            // Parse: .include "filename" or .include filename
            let rest = trimmed[8..].trim();
            let filename = if (rest.starts_with('"') && rest.ends_with('"'))
                || (rest.starts_with('\'') && rest.ends_with('\''))
            {
                &rest[1..rest.len() - 1]
            } else {
                rest
            };
            let filename = filename.trim();
            if filename.is_empty() {
                return Err(AsmError::new(line_num + 1, ".include requires a filename"));
            }
            // Search for the file
            let filepath = if let Some(dir) = lib_dir {
                let p = std::path::Path::new(dir).join(filename);
                if p.exists() {
                    Some(p)
                } else {
                    std::path::Path::new(filename)
                        .exists()
                        .then(|| std::path::PathBuf::from(filename))
                }
            } else {
                std::path::Path::new(filename)
                    .exists()
                    .then(|| std::path::PathBuf::from(filename))
            };
            match filepath {
                Some(path) => {
                    let included = std::fs::read_to_string(&path).map_err(|e| {
                        AsmError::new(
                            line_num + 1,
                            format!("cannot read include file '{}': {}", filename, e),
                        )
                    })?;
                    let expanded = resolve_includes(&included, lib_dir, depth + 1)?;
                    output.push_str("; --- begin included: ");
                    output.push_str(filename);
                    output.push_str(" ---\n");
                    output.push_str(&expanded);
                    if !expanded.ends_with('\n') {
                        output.push('\n');
                    }
                    output.push_str("; --- end included: ");
                    output.push_str(filename);
                    output.push_str(" ---\n");
                },
                None => {
                    return Err(AsmError::new(
                        line_num + 1,
                        format!("include file not found: '{}'", filename),
                    ));
                },
            }
        } else {
            output.push_str(raw_line);
            output.push('\n');
        }
    }
    Ok(output)
}

// ── Phase 313: Include Directive Unit Tests ──────────────────────────────

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_p313_passthrough_no_includes() {
        let source = "LDI r1, 42\nADD r1, r2\nHALT";
        let result = resolve_includes(source, None, 0).unwrap();
        assert_eq!(result, "LDI r1, 42\nADD r1, r2\nHALT\n");
    }

    #[test]
    fn test_p313_include_missing_file() {
        let source = ".include \"nonexistent_file.asm\"";
        let result = resolve_includes(source, None, 0);
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(err.message.contains("not found"));
        assert_eq!(err.line, 1);
    }

    #[test]
    fn test_p313_include_empty_filename() {
        let source = ".include \"\"";
        let result = resolve_includes(source, None, 0);
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(err.message.contains("requires a filename"));
    }

    #[test]
    fn test_p313_include_missing_filename() {
        let source = ".include";
        let result = resolve_includes(source, None, 0);
        assert!(result.is_err());
    }

    #[test]
    fn test_p313_lib_missing_name() {
        let source = ".lib";
        let result = resolve_includes(source, None, 0);
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(err.message.contains("requires a library name"));
    }

    #[test]
    fn test_p313_lib_missing_library() {
        let source = ".lib nonexistent";
        let result = resolve_includes(source, None, 0);
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(err.message.contains("lib not found"));
    }

    #[test]
    fn test_p313_lib_quoted_name() {
        let source = ".lib \"nonexistent\"";
        let result = resolve_includes(source, None, 0);
        assert!(result.is_err());
        // Should look for lib/nonexistent.asm
        assert!(result.unwrap_err().message.contains("lib/nonexistent.asm"));
    }

    #[test]
    fn test_p313_actual_include() {
        // Use programs/hello.asm which exists
        let source = ".include \"programs/hello.asm\"";
        let result = resolve_includes(source, None, 0);
        assert!(result.is_ok());
        let output = result.unwrap();
        assert!(output.contains("begin included: programs/hello.asm"));
        assert!(output.contains("end included: programs/hello.asm"));
        // Verify actual content from hello.asm was inlined
        assert!(output.contains("LDI") || output.contains("word_0"));
    }

    #[test]
    fn test_p313_actual_lib_include() {
        // Use lib/stdlib.asm which exists
        let source = ".lib stdlib";
        let result = resolve_includes(source, None, 0);
        assert!(result.is_ok());
        let output = result.unwrap();
        assert!(output.contains("begin lib: lib/stdlib.asm"));
        assert!(output.contains("end lib: lib/stdlib.asm"));
    }

    #[test]
    fn test_p313_mixed_source_and_include() {
        let source = "LDI r1, 10\n.include \"programs/hello.asm\"\nADD r1, r2\nHALT";
        let result = resolve_includes(source, None, 0);
        assert!(result.is_ok());
        let output = result.unwrap();
        // First line should be the LDI
        assert!(output.starts_with("LDI r1, 10\n"));
        // Should contain include markers
        assert!(output.contains("begin included: programs/hello.asm"));
        // Should contain the trailing ADD and HALT
        assert!(output.contains("ADD r1, r2"));
        assert!(output.contains("HALT"));
    }

    #[test]
    fn test_p313_include_preserves_other_directives() {
        let source = ".db 1, 2, 3\nLDI r1, 42\nHALT";
        let result = resolve_includes(source, None, 0);
        assert!(result.is_ok());
        let output = result.unwrap();
        assert!(output.contains(".db 1, 2, 3"));
    }

    #[test]
    fn test_p313_include_with_lib_dir() {
        // Use the project's programs dir as lib_dir
        let source = ".include \"hello.asm\"";
        let result = resolve_includes(source, Some("programs"), 0);
        assert!(result.is_ok());
        let output = result.unwrap();
        assert!(output.contains("begin included: hello.asm"));
    }

    #[test]
    fn test_p313_lib_with_lib_dir_fallback() {
        // .lib should try lib_dir first, then relative
        let source = ".lib math";
        let result = resolve_includes(source, Some("programs"), 0);
        // Should find lib/math.asm via relative path
        assert!(result.is_ok());
    }

    #[test]
    fn test_p313_case_insensitive_include() {
        let source = ".INCLUDE \"programs/hello.asm\"";
        let result = resolve_includes(source, None, 0);
        assert!(result.is_ok());
    }

    #[test]
    fn test_p313_case_insensitive_lib() {
        let source = ".LIB stdlib";
        let result = resolve_includes(source, None, 0);
        assert!(result.is_ok());
    }

    #[test]
    fn test_p313_single_quote_filename() {
        let source = ".include 'programs/hello.asm'";
        let result = resolve_includes(source, None, 0);
        assert!(result.is_ok());
        let output = result.unwrap();
        assert!(output.contains("begin included: programs/hello.asm"));
    }

    #[test]
    fn test_p313_nesting_depth_limit() {
        // The MAX_INCLUDE_DEPTH is 8
        let result = resolve_includes("dummy", None, 9);
        assert!(result.is_err());
        let err = result.unwrap_err();
        assert!(err.message.contains("depth exceeded"));
        assert_eq!(err.line, 0);
    }

    #[test]
    fn test_p313_depth_zero_ok() {
        let result = resolve_includes("LDI r1, 1\nHALT", None, 0);
        assert!(result.is_ok());
    }

    #[test]
    fn test_p313_depth_at_limit() {
        let result = resolve_includes("LDI r1, 1\nHALT", None, 8);
        assert!(result.is_ok());
    }

    #[test]
    fn test_p313_depth_exceeded() {
        let result = resolve_includes("LDI r1, 1", None, 9);
        assert!(result.is_err());
    }
}
