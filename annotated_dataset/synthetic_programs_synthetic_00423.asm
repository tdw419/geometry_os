; DESCRIPTION: This GeOS assembly code initializes registers and performs a counted animation. It shifts bits, decrements counters, divides values, sets pixel positions, and repeats loops until conditions are met, eventually halting execution.

; counted animation
; initialization
  LDI r13, 32
  LDI r12, 0x67098D
  LDI r4, 0x908057
loop_0:
  SHL r0, r15, r1
  LDI r9, 1
  SUB r4, r4, r9
  JNZ r4, loop_0
  LDI r15, 255
loop_1:
  DIV r4, r12, r7
  LDI r8, 0x0EC0B5
  LDI r5, 0x8794DF
  LDI r13, 255
  PSETI
  LDI r14, 1
  SUB r15, r15, r14
  JNZ r15, loop_1
  HALT
