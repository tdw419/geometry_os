; test_complex.asm -- Test RAND + nested CALL + PUSH/POP
LDI r7, 1
LDI r30, 0xFF00

LDI r1, 0
LDI r2, 100

loop:
  RAND r3
  AND r3, r2
  CALL negate_it
  ADD r1, r3
  ADD r4, r7
  CMP r4, r2
  BLT r0, loop

LDI r14, 0x7000
STORE r14, r1

HALT

negate_it:
  PUSH r31
  PUSH r0
  CMP r3, r7
  BGE r0, neg_skip
  NEG r3
neg_skip:
  POP r0
  POP r31
  RET
