; DESCRIPTION: The GeOS assembly code initializes registers and sets up a loop to generate random numbers, negate them if they are less than a threshold, sum them, and store the result. The `negate_it` subroutine handles the negation logic with nested `PUSH/POP` operations for register preservation.

; test_complex.asm -- Test RAND + nested CALL + PUSH/POP
LDI r12, 1
LDI r30, 0xFF00

LDI r11, 0
LDI r0, 100

loop:
  RAND r13
  AND r13, r0
  CALL negate_it
  ADD r11, r13
  ADD r1, r12
  CMP r1, r0
  BLT r4, loop

LDI r8, 0x7000
STORE r8, r11

HALT

negate_it:
  PUSH r31
  PUSH r4
  CMP r13, r12
  BGE r4, neg_skip
  NEG r13
neg_skip:
  POP r4
  POP r31
  RET
