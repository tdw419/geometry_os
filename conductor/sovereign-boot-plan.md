# Plan: Sovereign RISC-V Boot

## Objective
Prove the ultimate sovereignty chain: **Text Input -> GPU Assembler -> Glyph Bootloader -> RISC-V Execution -> UART Output.**

This milestone demonstrates that the GPU is fully self-sufficient. A human provides the "intent" as text, and the GPU handles the entire compilation and execution pipeline without host intervention.

## The Chain
1.  **Source Code**: ASCII text for a RISC-V bootloader stored in the RAM texture.
2.  **GPU Assembler**: A Glyph program that parses the source and emits a Glyph bootloader binary.
3.  **Glyph Bootloader**: The emitted binary copies a RISC-V kernel from the Atlas to the RISC-V VM memory.
4.  **RISC-V Execution**: The RISC-V VM executes the kernel and outputs "Hi" to UART.

## Assembler Requirements
To compile the bootloader, the GPU Assembler must be expanded to support:
-   **Mnemonics**: `LDI`, `LOAD`, `STORE`, `ADD`, `BNE`, `HALT`.
-   **Operands**: Registers (`r0`-`r15`), Positive Immediates (for `LDI`), and Negative Immediates (for `BNE` offsets).
-   **Whitespace**: Skip spaces and newlines.

## Implementation Steps
1.  **Extend GPU Assembler**: Update the state machine in the test harness to handle the additional mnemonics and negative offsets.
2.  **Prepare the Atlas**: Pre-load the Atlas with instruction templates and the 8 RISC-V instructions (the "Kernel").
3.  **Execute Phase 1**: Run the Assembler to generate the Bootloader.
4.  **Execute Phase 2**: Run the generated Bootloader to move the RISC-V Kernel.
5.  **Execute Phase 3**: Boot the RISC-V VM and verify UART output.

## Success Criteria
-   The UART output contains "Hi".
-   The compilation was performed by the GPU VM.
-   The bootloading was performed by the emitted Glyph program.
