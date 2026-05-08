; DESCRIPTION: The GeOS assembly code initializes registers and sets up a loop to generate random numbers, negate them if they are less than a threshold, sum them, and store the result. The `negate_it` subroutine handles the negation logic with nested `PUSH/POP` operations for register preservation.

; test_complex.asm -- Test RAND + nested CALL + PUSH/POP
LDI r5, 1
LDI r30, 0xFF00

LDI r0, 0
LDI r9, 100

loop:
  RAND r11
  AND r11, r9
  CALL negate_it
  ADD r0, r11
  ADD r12, r5
  CMP r12, r9
  BLT r13, loop

LDI r2, 0x7000
STORE r2, r0

HALT

negate_it:
  PUSH r31
  PUSH r13
  CMP r11, r5
  BGE r13, neg_skip
  NEG r11
neg_skip:
  POP r13
  POP r31
  RET
