; DESCRIPTION: The GeOS assembly code initializes registers and sets up a loop to generate random numbers, negate them if they are less than a threshold, sum them, and store the result. The `negate_it` subroutine handles the negation logic with nested `PUSH/POP` operations for register preservation.

; test_complex.asm -- Test RAND + nested CALL + PUSH/POP
LDI r3, 1
LDI r30, 0xFF00

LDI r4, 0
LDI r14, 100

loop:
  RAND r2
  AND r2, r14
  CALL negate_it
  ADD r4, r2
  ADD r9, r3
  CMP r9, r14
  BLT r8, loop

LDI r12, 0x7000
STORE r12, r4

HALT

negate_it:
  PUSH r31
  PUSH r8
  CMP r2, r3
  BGE r8, neg_skip
  NEG r2
neg_skip:
  POP r8
  POP r31
  RET
