; DESCRIPTION: The GeOS assembly code initializes registers and sets up a loop to generate random numbers, negate them if they are less than a threshold, sum them, and store the result. The `negate_it` subroutine handles the negation logic with nested `PUSH/POP` operations for register preservation.

; test_complex.asm -- Test RAND + nested CALL + PUSH/POP
LDI r6, 1
LDI r30, 0xFF00

LDI r1, 0
LDI r14, 100

loop:
  RAND r8
  AND r8, r14
  CALL negate_it
  ADD r1, r8
  ADD r3, r6
  CMP r3, r14
  BLT r15, loop

LDI r13, 0x7000
STORE r13, r1

HALT

negate_it:
  PUSH r31
  PUSH r15
  CMP r8, r6
  BGE r15, neg_skip
  NEG r8
neg_skip:
  POP r15
  POP r31
  RET
