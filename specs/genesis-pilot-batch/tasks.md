---
spec: genesis-pilot-batch
phase: tasks
total_tasks: 16
created: 2026-02-20T14:00:00Z
---

# Implementation Tasks: genesis-pilot-batch

## Execution Context

- **Testing depth**: Standard - unit + integration
- **Execution priority**: Ship fast - POC first, polish later
- **Existing components**: `ctrm_triad.py`, `bible_id.py`, `scripture_truth_analyzer.py`, `verse_classifier.py`, `evidence_scorer.py`, `batch_analyzer.py`, `genesis_kjv.json` all exist
- **To create**: `truth_texture.py`, test suite in `tests/intelligence/`
- **To modify**: `verse_classifier.py` (prophetic lookup), `batch_analyzer.py` (texture integration)

---

## Phase 1: POC (Make It Work)

Focus: Validate truth texture encoding and texture integration works end-to-end. Skip tests initially.

### Task 1.1: Create TruthTextureEncoder module [x]

**Do**:
1. Create `systems/intelligence/truth_texture.py`
2. Implement `TruthTextureEncoder` class with:
   - `__init__(self, size: int = 10)` - 10x10 texture for 100 verses
   - `encode(results: List[Dict]) -> PIL.Image.Image` - RGBA encoding
   - `save(results: List[Dict], output_path: str) -> None` - Save as .rts.png
   - `_verse_to_pixel(result: Dict) -> tuple` - RGBA conversion
3. R = E1_archaeology * 255, G = E2_manuscript * 255, B = E3_prophecy * 255, A = confidence * 255
4. Use Pillow for image creation

**Files**:
- Create: `systems/intelligence/truth_texture.py`

**Done when**: Module imports successfully and can encode sample data to RGBA image

**Verify**: `python3 -c "from systems.intelligence.truth_texture import TruthTextureEncoder; e = TruthTextureEncoder(); print('OK')"`

**Commit**: `feat(intelligence): add TruthTextureEncoder for RGBA manifold encoding`

_Requirements: FR-5.1, FR-5.2, FR-5.3, FR-5.4_
_Design: C6 TruthTexture_

---

### Task 1.2: Add prophetic reference lookup to VerseClassifier [x]

**Do**:
1. Open `systems/intelligence/verse_classifier.py`
2. Add `PROPHETIC_REFERENCES` class variable with set of (book, chapter, verse) tuples:
   - ("Genesis", 3, 15), ("Genesis", 12, 3), ("Genesis", 22, 18), ("Genesis", 28, 14), ("Genesis", 49, 10)
3. Modify `classify()` method to accept `book: str = "Genesis"` and `verse: int = 0` parameters
4. Check lookup table BEFORE keyword matching
5. Return `VerseCategory.PROPHETIC` immediately if reference found in lookup

**Files**:
- Modify: `systems/intelligence/verse_classifier.py`

**Done when**: Genesis 3:15, 12:3, 22:18, 28:14, 49:10 classify as PROPHETIC

**Verify**: `python3 -c "from systems.intelligence.verse_classifier import VerseClassifier, VerseCategory; assert VerseClassifier.classify('seed', 3, 'Genesis', 15) == VerseCategory.PROPHETIC; print('OK')"`

**Commit**: `feat(intelligence): add prophetic reference lookup to VerseClassifier`

_Requirements: FR-2.3, AC-2.3_
_Design: C2 VerseClassifier Enhancement_

---

### Task 1.3: Integrate TruthTexture into BatchAnalyzer [x]

**Do**:
1. Open `systems/intelligence/batch_analyzer.py`
2. Add import for `TruthTextureEncoder` at top
3. After `self.analyzer.save_report()` call in `run_pilot()`, add texture generation:
   - Create `TruthTextureEncoder(size=10)`
   - Call `encoder.save(self.analyzer.results, texture_path)`
   - Set `texture_path` to `genesis_truth_manifold.rts.png` in project root
4. Print confirmation message after texture saved

**Files**:
- Modify: `systems/intelligence/batch_analyzer.py`

**Done when**: Running batch analyzer generates both JSON report and PNG texture

**Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -c "from systems.intelligence.batch_analyzer import BatchAnalyzer; print('import OK')" && ls -la systems/intelligence/data/genesis_kjv.json`

**Commit**: `feat(intelligence): integrate TruthTexture generation into batch analyzer`

_Requirements: FR-4.3, FR-5.6_
_Design: C5 BatchAnalyzer Enhancement_

---

### Task 1.4: Run full pilot and verify outputs [x]

**Do**:
1. Run batch analyzer: `python3 -m systems.intelligence.batch_analyzer`
2. Verify `genesis_pilot_report.json` exists in project root with 100 verses
3. Verify `genesis_truth_manifold.rts.png` exists in project root (10x10 PNG)
4. Check report contains CTRM system metrics (cronbach_alpha, pearson_r1)
5. Verify statistical targets: alpha < 0.5, r1 > 0.7 (or document deviation)

**Files**:
- Verify outputs: `genesis_pilot_report.json`, `genesis_truth_manifold.rts.png`

**Done when**: Both outputs generated, 100 verses processed, statistics in report

**Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m systems.intelligence.batch_analyzer && python3 -c "import json; d=json.load(open('genesis_pilot_report.json')); print(f'Verses: {len(d[\"verses\"])}, Alpha: {d[\"ctrm_system_report\"][\"system_metrics\"][\"cronbach_alpha\"]}')" && file genesis_truth_manifold.rts.png`

**Commit**: `feat(intelligence): complete pilot batch with truth manifold output`

_Requirements: AC-1.1, AC-4.1, AC-4.2, AC-5.1, AC-5.6_
_Design: Data Flow_

---

### Task 1.5 [VERIFY] POC Checkpoint: E2E validation [x]

**Do**:
1. Run batch analyzer fresh
2. Verify texture dimensions (10x10 RGBA)
3. Verify report JSON structure
4. Verify statistical thresholds met or documented

**Verify**:
```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os && \
python3 -c "
import json
from PIL import Image

# Check report
r = json.load(open('genesis_pilot_report.json'))
assert len(r['verses']) == 100, 'Need 100 verses'
assert 'ctrm_system_report' in r, 'Need CTRM report'
m = r['ctrm_system_report']['system_metrics']
print(f'Alpha: {m[\"cronbach_alpha\"]:.4f} (target < 0.5)')
print(f'r1: {m[\"pearson_r1\"]:.4f} (target > 0.7)')

# Check texture
img = Image.open('genesis_truth_manifold.rts.png')
assert img.size == (10, 10), f'Size mismatch: {img.size}'
assert img.mode == 'RGBA', f'Mode mismatch: {img.mode}'
print(f'Texture: {img.size} {img.mode}')
print('POC VALIDATED')
"
```

**Done when**: Both outputs pass automated checks

**Commit**: `chore(intelligence): validate POC outputs`

---

## Phase 2: Refactoring

After POC validated, clean up code structure.

### Task 2.1: Add type hints and docstrings to TruthTextureEncoder [x]

**Do**:
1. Add comprehensive docstrings to `TruthTextureEncoder` class and methods
2. Add type hints for all parameters and return types
3. Document RGBA channel mapping in class docstring
4. Add error handling for empty results list

**Files**:
- Modify: `systems/intelligence/truth_texture.py`

**Done when**: Module has complete type hints and docstrings

**Verify**: `python3 -c "from systems.intelligence.truth_texture import TruthTextureEncoder; help(TruthTextureEncoder.encode)" | head -20`

**Commit**: `refactor(intelligence): add type hints and docstrings to TruthTextureEncoder`

_Requirements: NFR-3.2, NFR-3.3_
_Design: C6 TruthTexture Interface_

---

### Task 2.2: Improve VerseClassifier API consistency [x]

**Do**:
1. Ensure all parameters have default values for backward compatibility
2. Add docstring explaining classification priority order
3. Add logging/debug output for classification decisions (optional, controlled by flag)
4. Ensure return type is consistently `VerseCategory` enum

**Files**:
- Modify: `systems/intelligence/verse_classifier.py`

**Done when**: Method signature documented, backward compatible

**Verify**: `python3 -c "from systems.intelligence.verse_classifier import VerseClassifier; c = VerseClassifier.classify('test text'); print(type(c).__name__)"`

**Commit**: `refactor(intelligence): improve VerseClassifier API consistency`

_Requirements: NFR-3.3_
_Design: C2 VerseClassifier_

---

### Task 2.3 [VERIFY] Quality checkpoint: type checking [x]

**Do**:
1. Run mypy or pyright on modified files if available
2. If no type checker, verify imports work cleanly
3. Check for any runtime type errors

**Verify**: `python3 -c "import systems.intelligence.truth_texture; import systems.intelligence.verse_classifier; import systems.intelligence.batch_analyzer; print('All imports OK')"`

**Done when**: No import errors or type issues

**Commit**: `chore(intelligence): pass quality checkpoint` (only if fixes needed)

---

## Phase 3: Testing

### Task 3.1: Create test package structure [x]

**Do**:
1. Create directory `tests/intelligence/`
2. Create `tests/intelligence/__init__.py` (empty file)

**Files**:
- Create: `tests/intelligence/__init__.py`

**Done when**: Directory exists, package importable

**Verify**: `python3 -c "import tests.intelligence; print('OK')"`

**Commit**: `test(intelligence): create test package structure`

_Requirements: FR-6_

---

### Task 3.2: Create test_genesis_data.py [x]

**Do**:
1. Create `tests/intelligence/test_genesis_data.py`
2. Add tests:
   - `test_data_file_exists`: Verify genesis_kjv.json exists
   - `test_data_structure`: Verify JSON has book, translation, verses keys
   - `test_verse_count`: Verify exactly 100 verses
   - `test_genesis_1_1_content`: Verify first verse has "In the beginning"

**Files**:
- Create: `tests/intelligence/test_genesis_data.py`

**Done when**: All 4 tests pass

**Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest tests/intelligence/test_genesis_data.py -v`

**Commit**: `test(intelligence): add Genesis data validation tests`

_Requirements: FR-1.1, FR-1.2, FR-1.3, FR-1.4_
_Design: Test Strategy - Data validation_

---

### Task 3.3: Create test_verse_classifier.py [x]

**Do**:
1. Create `tests/intelligence/test_verse_classifier.py`
2. Add tests:
   - `test_prophetic_lookup_genesis_3_15`: Seed of woman verse = PROPHETIC
   - `test_prophetic_lookup_genesis_12_3`: Bless all families = PROPHETIC
   - `test_prophetic_lookup_genesis_22_18`: Seed blessed = PROPHETIC
   - `test_cosmological_detection`: "In the beginning God created" = COSMOLOGICAL
   - `test_historical_fallback`: Unknown patterns default to HISTORICAL
   - `test_priority_order`: Prophetic keywords detected before historical

**Files**:
- Create: `tests/intelligence/test_verse_classifier.py`

**Done when**: All 6 tests pass

**Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest tests/intelligence/test_verse_classifier.py -v`

**Commit**: `test(intelligence): add VerseClassifier unit tests`

_Requirements: FR-2.1, FR-2.2, FR-2.3, FR-2.4_
_Design: Test Strategy - Classification_

---

### Task 3.4: Create test_evidence_scorer.py

**Do**:
1. Create `tests/intelligence/test_evidence_scorer.py`
2. Add tests:
   - `test_deterministic_output`: Same input produces same output twice
   - `test_e2_high_for_genesis`: Manuscript score > 0.90 for Genesis verses
   - `test_scores_in_range`: All scores clamped to [0.0, 1.0]
   - `test_cosmological_low_e1`: Cosmological category gets low archaeology score

**Files**:
- Create: `tests/intelligence/test_evidence_scorer.py`

**Done when**: All 4 tests pass

**Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest tests/intelligence/test_evidence_scorer.py -v`

**Commit**: `test(intelligence): add EvidenceScorer unit tests`

_Requirements: FR-3.1, FR-3.2, FR-3.3, FR-3.4, FR-3.5_
_Design: Test Strategy - Scoring_

---

### Task 3.5: Create test_batch_analyzer.py

**Do**:
1. Create `tests/intelligence/test_batch_analyzer.py`
2. Add tests:
   - `test_batch_initialization`: BatchAnalyzer creates with correct paths
   - `test_100_verses_processed`: Run batch, verify 100 results
   - `test_report_structure`: Report has metadata, ctrm_system_report, verses
   - `test_texture_generated`: PNG file exists after batch run
   - `test_processing_time`: Batch completes in < 30 seconds

**Files**:
- Create: `tests/intelligence/test_batch_analyzer.py`

**Done when**: All 5 tests pass

**Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest tests/intelligence/test_batch_analyzer.py -v`

**Commit**: `test(intelligence): add BatchAnalyzer integration tests`

_Requirements: FR-4.1, FR-4.2, FR-4.3, NFR-1.1_
_Design: Test Strategy - Batch pipeline_

---

### Task 3.6: Create test_truth_texture.py

**Do**:
1. Create `tests/intelligence/test_truth_texture.py`
2. Add tests:
   - `test_encoder_creation`: TruthTextureEncoder(10) creates successfully
   - `test_texture_dimensions`: encode() returns 10x10 image
   - `test_rgba_channels`: Image mode is RGBA
   - `test_channel_mapping`: Verify R=G1, G=G2, B=G3, A=confidence mapping
   - `test_save_creates_file`: save() creates PNG file

**Files**:
- Create: `tests/intelligence/test_truth_texture.py`

**Done when**: All 5 tests pass

**Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest tests/intelligence/test_truth_texture.py -v`

**Commit**: `test(intelligence): add TruthTexture encoder tests`

_Requirements: FR-5.1, FR-5.2, FR-5.3, FR-5.4_
_Design: Test Strategy - Texture_

---

### Task 3.7 [VERIFY] Run full test suite

**Do**:
1. Run all tests in `tests/intelligence/`
2. Verify all tests pass
3. Document any failures

**Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest tests/intelligence/ -v --tb=short`

**Done when**: All tests pass (expect ~24 tests total)

**Commit**: `test(intelligence): verify complete test suite passes`

---

## Phase 4: Quality Gates

### Task 4.1 [VERIFY] Local quality check

**Do**:
1. Run all quality checks locally
2. Verify test suite passes
3. Verify imports work cleanly

**Verify**:
```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os && \
python3 -m pytest tests/intelligence/ -v && \
python3 -c "
from systems.intelligence.truth_texture import TruthTextureEncoder
from systems.intelligence.verse_classifier import VerseClassifier
from systems.intelligence.batch_analyzer import BatchAnalyzer
from systems.intelligence.evidence_scorer import EvidenceScorer
from systems.intelligence.scripture_truth_analyzer import ScriptureTruthAnalyzer
print('All imports successful')
"
```

**Done when**: All tests pass, all imports work

**Commit**: `fix(intelligence): address quality issues` (only if fixes needed)

---

### Task 4.2: Create PR and verify CI

**Do**:
1. Verify current branch is feature branch: `git branch --show-current`
2. Stage modified/created files
3. Push branch: `git push -u origin feat/substrate-cloning` (or current branch)
4. Create PR using gh CLI if CI available

**Verify**: `git status && git branch --show-current`

**Done when**: Changes pushed to remote

**Commit**: None (push existing commits)

---

### Task 4.3 [VERIFY] AC checklist validation

**Do**:
1. Read requirements.md acceptance criteria
2. Run automated verification for each AC
3. Document any gaps

**Verify**:
```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os && \
python3 -c "
import json
from PIL import Image

r = json.load(open('genesis_pilot_report.json'))
img = Image.open('genesis_truth_manifold.rts.png')

# AC-1.1: 100 verses
assert len(r['verses']) == 100, 'AC-1.1 FAIL: Need 100 verses'
print('AC-1.1 PASS: 100 verses processed')

# AC-1.2: E1/E2/E3 in range [0,1]
for v in r['verses']:
    t = v['triad_scores']
    assert 0 <= t['E1_archaeology'] <= 1
    assert 0 <= t['E2_manuscript'] <= 1
    assert 0 <= t['E3_prophecy'] <= 1
print('AC-1.2 PASS: All triad scores in [0,1]')

# AC-4.1: Cronbach alpha in report
assert 'cronbach_alpha' in r['ctrm_system_report']['system_metrics']
print('AC-4.1 PASS: Cronbach alpha reported')

# AC-4.2: Pearson r1 in report
assert 'pearson_r1' in r['ctrm_system_report']['system_metrics']
print('AC-4.2 PASS: Pearson r1 reported')

# AC-5.1: Texture 10x10
assert img.size == (10, 10), f'AC-5.1 FAIL: Size is {img.size}'
print('AC-5.1 PASS: Texture is 10x10')

# AC-5.2-5.5: RGBA mode
assert img.mode == 'RGBA', f'AC-5 FAIL: Mode is {img.mode}'
print('AC-5.2-5.5 PASS: RGBA channels present')

print('ALL CHECKED ACs PASSED')
"
```

**Done when**: All automated ACs verified

**Commit**: None

---

## Phase 5: PR Lifecycle

### Task 5.1: Final validation and documentation

**Do**:
1. Verify all ACs from requirements.md are met
2. Update .progress.md with final learnings
3. Document statistical results in report

**Verify**: `cat /home/jericho/zion/projects/geometry_os/geometry_os/genesis_pilot_report.json | python3 -c "import sys,json; d=json.load(sys.stdin); m=d['ctrm_system_report']['system_metrics']; print(f\"Final Stats - Alpha: {m['cronbach_alpha']:.4f}, r1: {m['pearson_r1']:.4f}, Verses: {len(d['verses'])}\")"`

**Done when**: Statistical targets verified or deviation documented

**Commit**: `docs(intelligence): document pilot results`

---

## Notes

**POC shortcuts taken**:
- Mock mode evidence scoring (no LLM integration)
- Linear row-major texture mapping (not Hilbert-derived)
- Rule-based classification (no ML model)

**Production TODOs**:
- Integrate real LLM for evidence scoring
- Calculate ICC for inter-rater reliability
- Add Hilbert-curve texture coordinate option
- Expand to full Genesis (1,533 verses)
- Add web API endpoints
- Implement real archaeology/manuscript database lookups

---

## Unresolved Questions

1. **ICC Omitted**: Pilot uses single scorer (mock mode), so ICC calculation is omitted per design recommendation
2. **Alpha Target**: Report both < 0.5 (pilot success) and < 0.2 (true independence) if achieved
3. **Texture Metadata**: Consider adding JSON sidecar or tEXt chunk for manifold metadata (future iteration)
