---
spec: morphological-compiler
phase: tasks
total_tasks: 10
created: 2026-02-25
generated: auto
---

# Tasks: morphological-compiler

## Phase 1: Make It Work (POC)

Focus: Validate the idea works end-to-end. Skip tests, accept hardcoded values.

- [x] 1.1 Create GeoASM opcode constants
  - **Do**: Create `systems/intelligence/geometric_text/geoasm_opcodes.py` with SYMBOL_TO_OPCODE mapping for 12 symbols ($ + - * < > ! ? @ ~ . #) matching visual_cpu.wgsl opcodes
  - **Files**: `systems/intelligence/geometric_text/geoasm_opcodes.py`
  - **Done when**: `python3 -c "from systems.intelligence.geometric_text.geoasm_opcodes import SYMBOL_TO_OPCODE; print(SYMBOL_TO_OPCODE)"` outputs mapping dict
  - **Verify**: `python3 -c "from systems.intelligence.geometric_text.geoasm_opcodes import OP_I32_CONST; assert OP_I32_CONST == 0x41"`
  - **Commit**: `feat(geoasm): add opcode constants for Geometric Assembly`
  - _Requirements: FR-1_
  - _Design: Component 1_

- [x] 1.2 Create GeoASM parser
  - **Do**: Create `systems/intelligence/geometric_text/geoasm_parser.py` with GeoASMParser class, GeoASMInstruction dataclass (opcode, operand, char, line, col), parse() method that tokenizes symbols and operands
  - **Files**: `systems/intelligence/geometric_text/geoasm_parser.py`
  - **Done when**: `parser.parse("$ 5 $ 3 +")` returns 3 instructions with correct opcodes/operands
  - **Verify**: `python3 -c "from systems.intelligence.geometric_text.geoasm_parser import GeoASMParser; p=GeoASMParser(); i,e=p.parse('\$ 5'); print(i[0].opcode, i[0].operand)"`
  - **Commit**: `feat(geoasm): add parser for Geometric Assembly`
  - _Requirements: FR-1, FR-2, FR-3, FR-4_
  - _Design: Component 2_

- [ ] 1.3 Create morphological compiler
  - **Do**: Create `systems/intelligence/geometric_text/morphological_compiler.py` with MorphologicalCompiler class that uses UniversalMorphologicalFont, compile() method that renders instructions to RGBA texture with channel encoding
  - **Files**: `systems/intelligence/geometric_text/morphological_compiler.py`
  - **Done when**: `compiler.compile("$ 255")` returns 16x16 RGBA PIL Image with R=0x41, G=0x00, B=0xFF
  - **Verify**: `python3 -c "from systems.intelligence.geometric_text.morphological_compiler import MorphologicalCompiler; c=MorphologicalCompiler(); t=c.compile('\$ 255'); px=t.getpixel((8,8)); print(px)"`
  - **Commit**: `feat(geoasm): add Morphological Compiler`
  - _Requirements: FR-5, FR-6, FR-7, FR-8_
  - _Design: Component 3_

- [ ] 1.4 POC Checkpoint
  - **Do**: Verify end-to-end: parse "$ 5 $ 3 +" → compile → verify texture has 3 glyphs (48px wide)
  - **Done when**: Manual test shows 48x16 RGBA texture with correct encoding
  - **Verify**: `python3 -c "from systems.intelligence.geometric_text.morphological_compiler import MorphologicalCompiler; c=MorphologicalCompiler(); t=c.compile('\$ 5 \$ 3 +'); print(t.size)"`
  - **Commit**: `feat(geoasm): complete POC - GeoASM to executable texture`

## Phase 2: Refactoring

After POC validated, clean up code.

- [ ] 2.1 Add disassembler and error reporting
  - **Do**: Add disassemble() function to geoasm_parser.py, improve ParseError with detailed messages
  - **Files**: `systems/intelligence/geometric_text/geoasm_parser.py`
  - **Done when**: disassemble() outputs readable GeoASM text, errors include line/col
  - **Verify**: `python3 -c "from systems.intelligence.geometric_text.geoasm_parser import disassemble, GeoASMParser; p=GeoASMParser(); i,_=p.parse('\$ 5 +'); print(disassemble(i))"`
  - **Commit**: `refactor(geoasm): add disassembler and improve error reporting`
  - _Design: Component 2_

- [ ] 2.2 Add verify_texture and compile_file methods
  - **Do**: Add verify_texture() to decode pixels back to instructions, add compile_file() for CLI use with metadata JSON output
  - **Files**: `systems/intelligence/geometric_text/morphological_compiler.py`
  - **Done when**: verify_texture() returns decoded instruction list, compile_file() creates .rts.png and .json
  - **Verify**: `python3 -c "from systems.intelligence.geometric_text.morphological_compiler import MorphologicalCompiler; c=MorphologicalCompiler(); print(hasattr(c, 'verify_texture'))"`
  - **Commit**: `refactor(geoasm): add texture verification and file compilation`
  - _Requirements: FR-9, FR-10_
  - _Design: Component 3_

## Phase 3: Testing

- [ ] 3.1 Unit tests for GeoASM parser
  - **Do**: Create `systems/intelligence/geometric_text/tests/test_geoasm_parser.py` with tests for: empty input, comments, single/multiple instructions, operands, errors
  - **Files**: `systems/intelligence/geometric_text/tests/test_geoasm_parser.py`
  - **Done when**: `python3 -m pytest systems/intelligence/geometric_text/tests/test_geoasm_parser.py -v` passes all tests
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest systems/intelligence/geometric_text/tests/test_geoasm_parser.py -v`
  - **Commit**: `test(geoasm): add parser unit tests`
  - _Requirements: AC-1.1, AC-1.2, AC-1.3, AC-1.4_

- [ ] 3.2 Unit tests for morphological compiler
  - **Do**: Create `systems/intelligence/geometric_text/tests/test_morphological_compiler.py` with tests for: empty compile, single/multiple instructions, RGBA encoding, operand encoding, roundtrip verify
  - **Files**: `systems/intelligence/geometric_text/tests/test_morphological_compiler.py`
  - **Done when**: `python3 -m pytest systems/intelligence/geometric_text/tests/test_morphological_compiler.py -v` passes all tests
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest systems/intelligence/geometric_text/tests/test_morphological_compiler.py -v`
  - **Commit**: `test(geoasm): add compiler unit tests`
  - _Requirements: AC-2.1, AC-2.2, AC-2.3, AC-2.4, AC-2.5_

## Phase 4: Quality Gates

- [ ] 4.1 Create example GeoASM scripts
  - **Do**: Create examples directory, add counter.geo (memory ops), fibonacci.geo (sequence), arithmetic.geo (math)
  - **Files**: `systems/intelligence/geometric_text/examples/counter.geo`, `fibonacci.geo`, `arithmetic.geo`
  - **Done when**: All 3 .geo files exist and parse without errors
  - **Verify**: `python3 -c "from systems.intelligence.geometric_text.geoasm_parser import GeoASMParser; p=GeoASMParser(); import os; [p.parse(open(f'systems/intelligence/geometric_text/examples/{n}.geo').read()) for n in ['counter','fibonacci','arithmetic']]"`
  - **Commit**: `feat(geoasm): add example scripts`
  - _Requirements: AC-4.1, AC-4.2, AC-4.3_

- [ ] 4.2 Compile examples and verify CI
  - **Do**: Compile all .geo files to .rts.png, verify textures decode correctly, ensure all tests pass
  - **Files**: `systems/intelligence/geometric_text/examples/*.rts.png`, `*.json`
  - **Done when**: 3 .rts.png files created, verification shows correct encoding, pytest passes
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest systems/intelligence/geometric_text/tests/ -v`
  - **Commit**: `feat(geoasm): add compiled executable textures`

## Notes

- **POC shortcuts taken**: No tests initially, minimal error handling
- **Production TODOs**: Add 32-bit operand support, add control flow jumps, browser REPL
- **Model dependency**: Requires `data/synthesizer_v2.pth` and `data/charset_v2.json` in geometric_text directory
