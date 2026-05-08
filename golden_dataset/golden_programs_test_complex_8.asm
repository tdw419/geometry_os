; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; test_complex.asm -- Test RAND + nested CALL + PUSH/POP
LDI r10, 1
LDI r30, 0xFF00

LDI r6, 0
LDI r5, 100

loop:
  RAND r14
  AND r14, r5
  CALL negate_it
  ADD r6, r14
  ADD r1, r10
  CMP r1, r5
  BLT r0, loop

LDI r7, 0x7000
STORE r7, r6

HALT

negate_it:
  PUSH r31
  PUSH r0
  CMP r14, r10
  BGE r0, neg_skip
  NEG r14
neg_skip:
  POP r0
  POP r31
  RET
