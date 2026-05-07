; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it shifts bits in register r13 by the value in r8 and compares r11 to r0. If the comparison is not equal to 101, it decrements r15 and repeats the loop until r15 reaches zero, at which point it halts execution.

; counted animation
; initialization
  LDI r1, 3999
  LDI r0, 10
  LDI r11, 10
  LDI r13, 64
  LDI r15, 0x8011A9
loop_0:
  SHL r13, r8, r14
  CMPI r11, r0, 101
  LDI r9, 1
  SUB r15, r15, r9
  JNZ r15, loop_0
  HALT
