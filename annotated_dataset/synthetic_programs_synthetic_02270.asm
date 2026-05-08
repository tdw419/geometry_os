; DESCRIPTION: The GeOS assembly code initializes various registers with specific values and then enters a counted animation loop. It draws lines, pixels, and circles based on conditional checks and updates register values to control the animation iterations. The loops continue until specified conditions are met, after which the system halts.

; counted animation
; initialization
  LDI r12, 1411
  LDI r1, 10
  LDI r9, 1148
  LDI r27, 4
  LDI r5, 0x0F0FA0
  LDI r15, 3690
  LDI r11, 0xD9BAA0
  LDI r14, 30
loop_0:
  LDI r11, 0x8D3F95
  LDI r11, 1
  LDI r2, 63
  LDI r13, 2
  LDI r10, 0xC2876C
  LINE r11, r11, r2, r13, r10
  CMPI r2, r4, 0x1873E4
  SUBI r9, r3, 0
  LDI r13, 1703
  LDI r1, 1986
  LDI r7, 2643
  WPIXEL
  LDI r30, 1
  SUB r14, r14, r30
  JNZ r14, loop_0
  LDI r3, 40
loop_1:
  CMPI r13, r4, 32
  CMPI r14, r29, 99
  ADD r15, r5, r13
  LDI r6, 1
  SUB r3, r3, r6
  JNZ r3, loop_1
  LDI r2, 0xCEF78E
loop_2:
  CMPI r26, r20, 0x0002AD
  LDI r2, 0x724A85
  LDI r10, 2
  LDI r6, 0x681C96
  LDI r12, 0x9D2435
  CIRCLE r2, r10, r6, r12
  CMPI r0, r1, 0x851ED9
  MOD r12, r9, r8
  LDI r19, 1
  SUB r2, r2, r19
  JNZ r2, loop_2
  HALT
