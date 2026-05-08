; DESCRIPTION: This GeOS assembly code initializes several registers and performs a counted animation by repeatedly updating pixel values on the screen through loops, using arithmetic operations and conditional jumps to create a sequence of visual effects.

; counted animation
; initialization
  LDI r5, 0x13B622
  LDI r2, 8
  LDI r8, 32
  LDI r0, 1
  LDI r0, 0xE40DAF
loop_0:
  SUBI r9, r0, 33
  SUBI r14, r28, 0xABA254
  LDI r16, 1
  SUB r0, r0, r16
  JNZ r0, loop_0
  LDI r9, 0x171A45
loop_1:
  ADDI r3, r2, 1
  LDI r3, 0x9F6CCE
  LDI r12, 4
  LDI r3, 2898
  LDI r2, 3461
  LDI r2, 255
  LINE r3, r12, r3, r2, r2
  SHR r10, r3, r0
  DIV r7, r5, r10
  LDI r8, 1
  SUB r9, r9, r8
  JNZ r9, loop_1
  LDI r13, 0x6A125F
loop_2:
  ADDI r11, r14, 58
  LDI r4, 1
  SUB r13, r13, r4
  JNZ r13, loop_2
  HALT
