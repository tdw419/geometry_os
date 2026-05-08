; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; test_complex.asm -- Test RAND + nested CALL + PUSH/POP
LDI r4, 1
LDI r30, 0xFF00

LDI r11, 0
LDI r7, 100

loop:
  RAND r6
  AND r6, r7
  CALL negate_it
  ADD r11, r6
  ADD r13, r4
  CMP r13, r7
  BLT r12, loop

LDI r2, 0x7000
STORE r2, r11

HALT

negate_it:
  PUSH r31
  PUSH r12
  CMP r6, r4
  BGE r12, neg_skip
  NEG r6
neg_skip:
  POP r12
  POP r31
  RET
