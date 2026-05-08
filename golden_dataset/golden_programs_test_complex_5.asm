; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; test_complex.asm -- Test RAND + nested CALL + PUSH/POP
LDI r0, 1
LDI r30, 0xFF00

LDI r5, 0
LDI r1, 100

loop:
  RAND r9
  AND r9, r1
  CALL negate_it
  ADD r5, r9
  ADD r10, r0
  CMP r10, r1
  BLT r3, loop

LDI r12, 0x7000
STORE r12, r5

HALT

negate_it:
  PUSH r31
  PUSH r3
  CMP r9, r0
  BGE r3, neg_skip
  NEG r9
neg_skip:
  POP r3
  POP r31
  RET
