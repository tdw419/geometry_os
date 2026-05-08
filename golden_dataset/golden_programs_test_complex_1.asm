; DESCRIPTION: Render a colored object at the screen.

; test_complex.asm -- Test RAND + nested CALL + PUSH/POP
LDI r4, 1
LDI r30, 0xFF00

LDI r7, 0
LDI r6, 100

loop:
  RAND r12
  AND r12, r6
  CALL negate_it
  ADD r7, r12
  ADD r15, r4
  CMP r15, r6
  BLT r9, loop

LDI r0, 0x7000
STORE r0, r7

HALT

negate_it:
  PUSH r31
  PUSH r9
  CMP r12, r4
  BGE r9, neg_skip
  NEG r12
neg_skip:
  POP r9
  POP r31
  RET
