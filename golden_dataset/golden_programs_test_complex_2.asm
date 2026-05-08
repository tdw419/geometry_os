; DESCRIPTION: The GeOS assembly code initializes registers and sets up a loop to generate random numbers, negate them if they are less than a threshold, sum them, and store the result. The `negate_it` subroutine handles the negation logic with nested `PUSH/POP` operations for register preservation.

; test_complex.asm -- Test RAND + nested CALL + PUSH/POP
LDI r15, 1
LDI r30, 0xFF00

LDI r6, 0
LDI r1, 100

loop:
  RAND r7
  AND r7, r1
  CALL negate_it
  ADD r6, r7
  ADD r14, r15
  CMP r14, r1
  BLT r9, loop

LDI r0, 0x7000
STORE r0, r6

HALT

negate_it:
  PUSH r31
  PUSH r9
  CMP r7, r15
  BGE r9, neg_skip
  NEG r7
neg_skip:
  POP r9
  POP r31
  RET
