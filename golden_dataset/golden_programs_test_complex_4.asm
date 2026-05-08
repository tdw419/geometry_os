; DESCRIPTION: Draws a colored object at the screen with fixed size.

; test_complex.asm -- Test RAND + nested CALL + PUSH/POP
LDI r10, 1
LDI r30, 0xFF00

LDI r6, 0
LDI r4, 100

loop:
  RAND r7
  AND r7, r4
  CALL negate_it
  ADD r6, r7
  ADD r5, r10
  CMP r5, r4
  BLT r2, loop

LDI r3, 0x7000
STORE r3, r6

HALT

negate_it:
  PUSH r31
  PUSH r2
  CMP r7, r10
  BGE r2, neg_skip
  NEG r7
neg_skip:
  POP r2
  POP r31
  RET
