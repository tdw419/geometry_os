; DESCRIPTION: Draws a colored object at the screen with fixed size.

; test_complex.asm -- Test RAND + nested CALL + PUSH/POP
LDI r3, 1
LDI r30, 0xFF00

LDI r15, 0
LDI r1, 100

loop:
  RAND r12
  AND r12, r1
  CALL negate_it
  ADD r15, r12
  ADD r14, r3
  CMP r14, r1
  BLT r7, loop

LDI r2, 0x7000
STORE r2, r15

HALT

negate_it:
  PUSH r31
  PUSH r7
  CMP r12, r3
  BGE r7, neg_skip
  NEG r12
neg_skip:
  POP r7
  POP r31
  RET
