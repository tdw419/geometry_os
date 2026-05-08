; DESCRIPTION: Display a object using color colored at the screen.

; test_complex.asm -- Test RAND + nested CALL + PUSH/POP
LDI r11, 1
LDI r30, 0xFF00

LDI r3, 0
LDI r2, 100

loop:
  RAND r14
  AND r14, r2
  CALL negate_it
  ADD r3, r14
  ADD r5, r11
  CMP r5, r2
  BLT r12, loop

LDI r15, 0x7000
STORE r15, r3

HALT

negate_it:
  PUSH r31
  PUSH r12
  CMP r14, r11
  BGE r12, neg_skip
  NEG r14
neg_skip:
  POP r12
  POP r31
  RET
