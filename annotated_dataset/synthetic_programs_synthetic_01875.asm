; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and enters a loop where it performs arithmetic operations, updates register values, and draws lines on the screen. The loop continues until a condition is met (specifically, when `r15` becomes zero), at which point the program halts.

; counted animation
; initialization
  LDI r3, 256
  LDI r11, 3347
  LDI r29, 0xFB17A4
  LDI r1, 0
  LDI r6, 255
  LDI r8, 10
  LDI r12, 0xE49911
  LDI r15, 0xFCD6A2
loop_0:
  ADDI r3, r10, 144
  SUB r15, r11, r12
  LDI r2, 2891
  LDI r12, 16
  LDI r16, 32
  LDI r3, 352
  LDI r12, 0x5638E0
  LINE r2, r12, r16, r3, r12
  CMPI r7, r4, 249
  LDI r2, 1
  SUB r15, r15, r2
  JNZ r15, loop_0
  HALT
