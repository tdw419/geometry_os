; DESCRIPTION: This GeOS assembly code initializes several registers and performs a counted animation. It draws lines and pixels, updates register values, and loops until specific conditions are met, ultimately halting execution.

; counted animation
; initialization
  LDI r0, 8
  LDI r12, 4
  LDI r15, 2
  LDI r16, 16
loop_0:
  SUBI r13, r4, 85
  LDI r1, 0xB303FE
  LDI r1, 0x746944
  LDI r1, 0xEE2C87
  LDI r11, 8
  LDI r3, 1
  LINE r1, r1, r1, r11, r3
  LDI r12, 0x567F08
  LDI r8, 735
  LDI r11, 69
  PSETI
  LDI r14, 1
  SUB r16, r16, r14
  JNZ r16, loop_0
  LDI r4, 8
loop_1:
  OR r8, r7, r25
  LDI r2, 255
  LDI r3, 655
  LDI r3, 0x4C6636
  WPIXEL
  LDI r1, 0x8A49EC
  FILL r1
  LDI r13, 1
  SUB r4, r4, r13
  JNZ r4, loop_1
  HALT
