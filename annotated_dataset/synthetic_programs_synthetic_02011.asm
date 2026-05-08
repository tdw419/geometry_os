; DESCRIPTION: This GeOS assembly code initializes several registers to perform a counted animation. It repeatedly shifts and subtracts values in a loop until a counter reaches zero, then halts execution.

; counted animation
; initialization
  LDI r1, 0
  LDI r3, 10
  LDI r5, 2
  LDI r11, 0x4A1063
  LDI r16, 992
  LDI r2, 16
  LDI r27, 31
loop_0:
  SUBI r13, r12, 73
  SHR r12, r5, r0
  SHR r2, r5, r11
  LDI r7, 1
  SUB r27, r27, r7
  JNZ r27, loop_0
  HALT
