; DESCRIPTION: The GeOS assembly code initializes registers and sets up a loop to generate random numbers, negate them if they are less than a threshold, sum them, and store the result. The `negate_it` subroutine handles the negation logic with nested `PUSH/POP` operations for register preservation.

; test_complex.asm -- Test RAND + nested CALL + PUSH/POP
LDI r0, 1
LDI r30, 0xFF00

LDI r12, 0
LDI r4, 100

loop:
  RAND r11
  AND r11, r4
  CALL negate_it
  ADD r12, r11
  ADD r3, r0
  CMP r3, r4
  BLT r8, loop

LDI r6, 0x7000
STORE r6, r12

HALT

negate_it:
  PUSH r31
  PUSH r8
  CMP r11, r0
  BGE r8, neg_skip
  NEG r11
neg_skip:
  POP r8
  POP r31
  RET
