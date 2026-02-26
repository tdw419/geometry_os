---
spec: holographic-dictionary
phase: tasks
total_tasks: 10
created: 2026-02-26
generated: auto
---

# Tasks: Holographic Dictionary

## Phase 1: Make It Work (POC)

Focus: Define Word structure, create Standard Library manifest, place single Word on map.

- [ ] 1.1 Create WordCompiler class
  - **Do**: Create `systems/visual_shell/web/WordCompiler.js` with constructor, loadDictionary(), expandWord() methods
  - **Files**: `systems/visual_shell/web/WordCompiler.js`
  - **Done when**: Class exports, constructor accepts InfiniteMap and GlyphExecutor
  - **Verify**: `node -e "const {WordCompiler} = require('./WordCompiler.js'); console.log('OK')"`
  - **Commit**: `feat(dictionary): add WordCompiler class`
  - _Requirements: FR-1, FR-4_
  - _Design: WordCompiler component_

- [ ] 1.2 Define Standard Library manifest
  - **Do**: Create `.geometry/dictionary/standard.json` with add, sub, mul, load, store Words
  - **Files**: `.geometry/dictionary/standard.json`
  - **Done when**: Valid JSON with 5 Words, each with name, glyphs[], coordinate
  - **Verify**: `cat .geometry/dictionary/standard.json | jq '.words | length'` outputs 5
  - **Commit**: `feat(dictionary): add Standard Library manifest`
  - _Requirements: FR-7, FR-8_
  - _Design: DictionaryManifest structure_

- [ ] 1.3 Create GlyphExpander with opcode-to-atlas mapping
  - **Do**: Create `systems/visual_shell/web/GlyphExpander.js` with OPCODE_TO_ATLAS table and expand(opcodes) method
  - **Files**: `systems/visual_shell/web/GlyphExpander.js`
  - **Done when**: expand(['ADD']) returns [{opcode:'ADD', atlasX:0, atlasY:0, instruction:...}]
  - **Verify**: Unit test passes - expand produces valid GlyphRef objects
  - **Commit**: `feat(dictionary): add GlyphExpander with atlas mapping`
  - _Requirements: FR-9_
  - _Design: GlyphExpander component_

- [ ] 1.4 Implement WordCompiler.loadDictionary()
  - **Do**: Fetch manifest JSON, parse Words, call GlyphExpander for each, store in wordIndex Map
  - **Files**: `systems/visual_shell/web/WordCompiler.js`
  - **Done when**: loadDictionary('standard') populates wordIndex with 5 Words
  - **Verify**: Console log shows "Loaded 5 words from standard"
  - **Commit**: `feat(dictionary): implement loadDictionary`
  - _Requirements: FR-2, FR-3_
  - _Design: Data Flow step 1-2_

- [ ] 1.5 POC Checkpoint: Place single Word on map
  - **Do**: Add WordCompiler.placeWord(wordName) that places glyphs on InfiniteMap at Word coordinate, registers with GlyphExecutor
  - **Files**: `systems/visual_shell/web/WordCompiler.js`
  - **Done when**: placeWord('add') creates sprite at (0,1), registers glyph, executor shows 1 active
  - **Verify**: Manual test in browser console - `compiler.placeWord('add'); executor.getActiveGlyphs().length === 1`
  - **Commit**: `feat(dictionary): complete POC - place Word on map`
  - _Requirements: FR-3, FR-5_
  - _Design: Data Flow step 4-5_

## Phase 2: Refactoring

- [ ] 2.1 Extract DictionaryStorage class
  - **Do**: Create `systems/visual_shell/web/DictionaryStorage.js` with load(), save(), list() methods, move manifest handling from WordCompiler
  - **Files**: `systems/visual_shell/web/DictionaryStorage.js`, `systems/visual_shell/web/WordCompiler.js`
  - **Done when**: WordCompiler uses DictionaryStorage for manifest loading
  - **Verify**: Type check passes, no undefined accesses
  - **Commit**: `refactor(dictionary): extract DictionaryStorage`
  - _Design: DictionaryStorage component_

- [ ] 2.2 Add error handling for invalid opcodes
  - **Do**: GlyphExpander.expand() catches unknown opcodes, logs warning, returns NOP glyph
  - **Files**: `systems/visual_shell/web/GlyphExpander.js`
  - **Done when**: expand(['INVALID']) returns NOP without throwing
  - **Verify**: Test with invalid opcode - no exception, warning logged
  - **Commit**: `refactor(dictionary): add opcode error handling`
  - _Design: Error Handling table_

## Phase 3: Testing

- [ ] 3.1 Unit tests for GlyphExpander
  - **Do**: Create `systems/visual_shell/web/tests/test_glyph_expander.js` with tests for expand(), opcode mapping, NOP fallback
  - **Files**: `systems/visual_shell/web/tests/test_glyph_expander.js`
  - **Done when**: All tests pass, coverage > 80%
  - **Verify**: `node test_glyph_expander.js` exits 0
  - **Commit**: `test(dictionary): add GlyphExpander unit tests`
  - _Requirements: AC-1.1_

- [ ] 3.2 Integration test for WordCompiler
  - **Do**: Create `systems/visual_shell/web/tests/test_word_compiler.js` with tests for loadDictionary(), placeWord(), executor integration
  - **Files**: `systems/visual_shell/web/tests/test_word_compiler.js`
  - **Done when**: Test loads standard dictionary, places 'add' Word, verifies executor registration
  - **Verify**: `node test_word_compiler.js` exits 0
  - **Commit**: `test(dictionary): add WordCompiler integration tests`
  - _Requirements: AC-3.1, AC-3.2_

## Phase 4: Quality Gates

- [ ] 4.1 Local quality check
  - **Do**: Run ESLint, type checks, all tests
  - **Verify**: `pnpm lint && pnpm test` all pass
  - **Done when**: Zero errors, zero warnings
  - **Commit**: `fix(dictionary): address lint issues` (if needed)

- [ ] 4.2 Create PR and verify CI
  - **Do**: Push branch, create PR with gh CLI
  - **Verify**: `gh pr checks --watch` all green
  - **Done when**: PR ready for review

## Notes

- **POC shortcuts**: Manual atlas mapping (will auto-generate later), no cross-Word calls yet
- **Production TODOs**: Add Ligature support (64-bit glyphs), implement Word composition, add visual labels
- **Coordinate scheme**: Dictionary at (0,0), Words at (0, 1..N), future Dictionaries at (1,0), (2,0), etc.
