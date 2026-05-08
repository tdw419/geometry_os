; DESCRIPTION: The GeOS assembly code initializes registers and sets up a loop to generate random numbers, negate them if they are less than a threshold, sum them, and store the result. The `negate_it` subroutine handles the negation logic with nested `PUSH/POP` operations for register preservation.

; test_complex.asm -- Test RAND + nested CALL + PUSH/POP
LDI r13, 1
LDI r30, 0xFF00

LDI r10, 0
LDI r4, 100

loop:
  RAND r11
  AND r11, r4
  CALL negate_it
  ADD r10, r11
  ADD r2, r13
  CMP r2, r4
  BLT r0, loop

LDI r9, 0x7000
STORE r9, r10

HALT

negate_it:
  PUSH r31
  PUSH r0
  CMP r11, r13
  BGE r0, neg_skip
  NEG r11
neg_skip:
  POP r0
  POP r31
  RET
