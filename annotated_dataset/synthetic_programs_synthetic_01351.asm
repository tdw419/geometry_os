; DESCRIPTION: This GeOS assembly code performs a counted animation involving drawing lines and pixels on a display. It initializes various registers with specific values, then enters loops to draw lines with decreasing lengths and single pixels at varying positions until the count reaches zero, after which it halts execution.

; counted animation
; initialization
  LDI r14, 4
  LDI r15, 0xC5DF40
  LDI r7, 256
  LDI r10, 4087
  LDI r11, 3457
  LDI r12, 1458
  LDI r3, 0x5363A6
  LDI r1, 0x269045
loop_0:
  LDI r3, 2
  LDI r9, 0x82DE80
  LDI r13, 16
  LDI r15, 4065
  LDI r6, 1123
  LINE r3, r9, r13, r15, r6
  LDI r6, 1
  SUB r1, r1, r6
  JNZ r1, loop_0
  LDI r30, 0x61E60E
loop_1:
  LDI r11, 1
  LDI r14, 4
  LDI r10, 0xDC752F
  WPIXEL
  SHR r14, r10, r15
  LDI r3, 1
  SUB r30, r30, r3
  JNZ r30, loop_1
  LDI r7, 16
loop_2:
  ADD r15, r7, r0
  LDI r5, 1
  SUB r7, r7, r5
  JNZ r7, loop_2
  HALT
