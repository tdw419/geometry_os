# Harden Hilbert Foundation - Tasks

## 1. Test Suite Infrastructure
- [ ] 1.1 Create `tests/integration/test_hilbert_roundtrip.py`
- [ ] 1.2 Implement `TestHilbertBitPerfect` class with `pytest`
- [ ] 1.3 Add SHA256 verification helper methods

## 2. Roundtrip Scenarios
- [ ] 2.1 Implement `test_small_file_roundtrip`: 1KB of random data
- [ ] 2.2 Implement `test_kernel_sized_roundtrip`: 10MB of structured data (simulating kernel)
- [ ] 2.3 Implement `test_power_of_two_boundaries`: Test files at 2^N and 2^N - 1 sizes
- [ ] 2.4 Implement `test_edge_cases`: Empty file, single byte, extremely large file

## 3. Locality & Metadata Hardening
- [ ] 3.1 Implement `test_metadata_consistency`: Verify extracted meta matches source exactly
- [ ] 3.2 Implement `test_hilbert_locality_checksum`: Verify that adjacent 1D bytes map to neighboring 2D pixels (using precomputed LUT check)

## 4. Verification & Documentation
- [ ] 4.1 Run full suite and ensure 100% pass rate
- [ ] 4.2 Document Hilbert Storage Proof results in `docs/HILBERT_STORAGE_PROOF.md`
