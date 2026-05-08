; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a counted animation loop (`loop_0`) that runs 2 times. Inside this loop, it draws a pixel, a circle, and a rectangle on the screen. After completing the loops, it halts the system.

; counted animation
; initialization
  LDI r11, 0x892A54
  LDI r5, 1006
  LDI r1, 3866
  LDI r6, 2
loop_0:
  LDI r12, 0x51E9E9
  LDI r29, 4068
  LDI r0, 3537
  WPIXEL
  LDI r12, 32
  LDI r4, 256
  LDI r5, 0xACBC23
  LDI r10, 128
  CIRCLE r12, r4, r5, r10
  LDI r13, 10
  LDI r0, 8
  LDI r5, 2707
  LDI r7, 0xF3D540
  LDI r3, 693
  RECTF r13, r0, r5, r7, r3
  LDI r13, 1
  SUB r6, r6, r13
  JNZ r6, loop_0
  LDI r0, 10
loop_1:
  LDI r2, 64
  LDI r1, 0xA527A6
  LDI r6, 0x48AAAE
  LDI r17, 2161
  CIRCLE r2, r1, r6, r17
  ANDI r22, r10, 0x93F7E1
  SHR r2, r13, r7
  OR r7, r10, r8
  LDI r8, 1
  SUB r0, r0, r8
  JNZ r0, loop_1
  HALT
