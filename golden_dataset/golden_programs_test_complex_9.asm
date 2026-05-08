; DESCRIPTION: The GeOS assembly code initializes registers and sets up a loop to generate random numbers, negate them if they are less than a threshold, sum them, and store the result. The `negate_it` subroutine handles the negation logic with nested `PUSH/POP` operations for register preservation.

; test_complex.asm -- Test RAND + nested CALL + PUSH/POP
LDI r7, 1
LDI r30, 0xFF00

LDI r0, 0
LDI r9, 100

loop:
  RAND r8
  AND r8, r9
  CALL negate_it
  ADD r0, r8
  ADD r2, r7
  CMP r2, r9
  BLT r6, loop

LDI r5, 0x7000
STORE r5, r0

HALT

negate_it:
  PUSH r31
  PUSH r6
  CMP r8, r7
  BGE r6, neg_skip
  NEG r8
neg_skip:
  POP r6
  POP r31
  RET
