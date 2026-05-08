; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a series of loops that perform operations including subtraction, shifting, rectangle drawing (`RECTF`), pixel setting (`PSET`), and conditional jumps. The code ultimately halts execution after completing its iterations.

; counted animation
; initialization
  LDI r11, 0x91F566
  LDI r15, 0x18E23E
  LDI r11, 39
loop_0:
  SUBI r11, r8, 0xAEB2EF
  LDI r3, 0x773482
  LDI r3, 16
  LDI r11, 2
  LDI r3, 3757
  LDI r12, 0x2954B7
  RECTF r3, r3, r11, r3, r12
  SHL r11, r14, r6
  LDI r8, 1
  SUB r11, r11, r8
  JNZ r11, loop_0
  LDI r11, 0
loop_1:
  ANDI r7, r8, 256
  ADDI r5, r8, 194
  LDI r4, 1
  SUB r11, r11, r4
  JNZ r11, loop_1
  LDI r22, 0xA46F49
loop_2:
  LDI r5, 0x25AA7A
  LDI r15, 359
  LDI r6, 0xEBA3A1
  PSET r5, r15, r6
  SHR r3, r2, r15
  LDI r16, 1
  SUB r22, r22, r16
  JNZ r22, loop_2
  HALT
