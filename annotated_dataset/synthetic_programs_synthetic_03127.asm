; DESCRIPTION: This GeOS assembly code initializes registers and performs a counted animation loop. It draws lines and circles using specific parameters, then enters another loop to manipulate pixel values until a condition is met, after which it halts execution.

; counted animation
; initialization
  LDI r26, 0
  LDI r6, 0x9DB006
  LDI r5, 44
loop_0:
  LDI r8, 0xCAF311
  LDI r10, 256
  LDI r11, 255
  LDI r11, 2273
  LDI r0, 8
  LINE r8, r10, r11, r11, r0
  SUBI r8, r1, 22
  ANDI r3, r7, 0xFFA37D
  LDI r15, 0xEAB16A
  LDI r6, 255
  LDI r13, 10
  LDI r12, 0x86DF0E
  CIRCLE r15, r6, r13, r12
  LDI r8, 1
  SUB r5, r5, r8
  JNZ r5, loop_0
  LDI r13, 0xA48077
loop_1:
  SUBI r9, r11, 252
  OR r11, r12, r5
  LDI r13, 0
  LDI r10, 461
  LDI r10, 10
  WPIXEL
  ANDI r13, r1, 242
  LDI r2, 1
  SUB r13, r13, r2
  JNZ r13, loop_1
  HALT
