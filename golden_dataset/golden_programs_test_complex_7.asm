; DESCRIPTION: Geometry OS program to draw a colored object.

; test_complex.asm -- Test RAND + nested CALL + PUSH/POP
LDI r5, 1
LDI r30, 0xFF00

LDI r13, 0
LDI r3, 100

loop:
  RAND r10
  AND r10, r3
  CALL negate_it
  ADD r13, r10
  ADD r4, r5
  CMP r4, r3
  BLT r1, loop

LDI r0, 0x7000
STORE r0, r13

HALT

negate_it:
  PUSH r31
  PUSH r1
  CMP r10, r5
  BGE r1, neg_skip
  NEG r10
neg_skip:
  POP r1
  POP r31
  RET
