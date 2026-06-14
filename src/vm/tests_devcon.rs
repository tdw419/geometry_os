// Test: devcon.asm assembles without errors
#[cfg(test)]
mod tests_devcon {
    #[test]
    fn assemble_devcon_program() {
        let source = std::fs::read_to_string(
            std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("programs/devcon.asm"),
        )
        .expect("devcon.asm should exist");
        let mut pp = crate::preprocessor::Preprocessor::new();
        let preprocessed = pp.preprocess(&source);
        match crate::assembler::assemble(&preprocessed, 0x1000) {
            Ok(asm) => eprintln!("devcon.asm assembled OK: {} words", asm.pixels.len()),
            Err(e) => panic!("devcon.asm assembly failed: {}", e),
        }
    }
}
