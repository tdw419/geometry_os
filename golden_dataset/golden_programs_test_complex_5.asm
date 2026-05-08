; DESCRIPTION: The GeOS assembly code initializes registers and sets up a loop to generate random numbers, negate them if they are less than a threshold, sum them, and store the result. The `negate_it` subroutine handles the negation logic with nested `PUSH/POP` operations for register preservation.

; test_complex.asm -- Test RAND + nested CALL + PUSH/POP
LDI r11, 1
LDI r30, 0xFF00

LDI r4, 0
LDI r14, 100

loop:
  RAND r0
  AND r0, r14
  CALL negate_it
  ADD r4, r0
  ADD r2, r11
  CMP r2, r14
  BLT r13, loop

LDI r5, 0x7000
STORE r5, r4

HALT

negate_it:
  PUSH r31
  PUSH r13
  CMP r0, r11
  BGE r13, neg_skip
  NEG r0
neg_skip:
  POP r13
  POP r31
  RET
