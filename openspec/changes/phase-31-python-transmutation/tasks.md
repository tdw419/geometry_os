# Tasks: Phase 31 Python Transmutation

- [x] **Task 1**: Implement AST-to-RISCV Transpiler Baseline
  - **Description**: Create a Python script that converts basic arithmetic and loops (AST) into textual RISC-V assembly.
  - **Acceptance Criteria**:
    - Supports `+`, `-`, `*`, `/` operations.
    - Supports `while` loops.
    - Outputs valid assembly that can be assembled by `clang` or `gcc`.
  - **Estimated Effort**: Large

- [x] **Task 2**: Implement Visual Linker
  - **Description**: create `visual_linker.py` to convert compiled RISC-V binaries into `.rts.png` format with Hilbert mapping.
  - **Acceptance Criteria**:
    - Input: raw binary file.
    - Output: valid PNG image.
    - Metadata embedded in alpha channel or separate chunk.
  - **Estimated Effort**: Medium

- [x] **Task 3**: Create Frontend Drag-and-Drop Loader
  - **Description**: Add support to `InfiniteMap` to handle `.py` file drops.
  - **Acceptance Criteria**:
    - Detects `.py` extension on drop.
    - Sends file to local backend.
    - Receives processed image.
    - Places tile on map.
  - **Estimated Effort**: Medium

- [x] **Task 4**: End-to-End Verification
  - **Description**: Write a `fibonacci.py` script, drop it on the map, and boot it on the GPU.
  - **Acceptance Criteria**:
    - Boot successful.
    - TTY output verifies correct calculation.
  - **Estimated Effort**: Medium
