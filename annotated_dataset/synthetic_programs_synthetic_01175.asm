; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it performs a subtraction operation and sets pixels on a display. The loop continues until the pixel counter reaches zero, at which point the system halts.

; counted animation
; initialization
  LDI r14, 1
  LDI r4, 3486
  LDI r8, 0xC7F064
  LDI r2, 1
loop_0:
  SUBI r0, r3, 0xB832AB
  SUBI r14, r21, 221
  LDI r2, 4020
  LDI r12, 128
  LDI r1, 128
  PSET r2, r12, r1
  LDI r6, 1
  SUB r2, r2, r6
  JNZ r2, loop_0
  HALT
