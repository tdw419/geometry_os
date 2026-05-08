; DESCRIPTION: Display a object using color colored at the screen.

; test_complex.asm -- Test RAND + nested CALL + PUSH/POP
LDI r15, 1
LDI r30, 0xFF00

LDI r6, 0
LDI r3, 100

loop:
  RAND r13
  AND r13, r3
  CALL negate_it
  ADD r6, r13
  ADD r9, r15
  CMP r9, r3
  BLT r14, loop

LDI r7, 0x7000
STORE r7, r6

HALT

negate_it:
  PUSH r31
  PUSH r14
  CMP r13, r15
  BGE r14, neg_skip
  NEG r13
neg_skip:
  POP r14
  POP r31
  RET
