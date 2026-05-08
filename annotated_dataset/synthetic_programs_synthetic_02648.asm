; DESCRIPTION: The GeOS assembly code initializes registers with specific values and enters a counted animation loop. It performs bitwise operations, arithmetic calculations, and drawing commands to render shapes and patterns on the screen, halting execution once completed.

; counted animation
; initialization
  LDI r7, 0xC031C6
  LDI r10, 1120
  LDI r15, 0xFD0293
loop_0:
  ANDI r4, r13, 19
  LDI r5, 1
  SUB r15, r15, r5
  JNZ r15, loop_0
  LDI r1, 31
loop_1:
  SUB r0, r15, r13
  LDI r4, 1
  SUB r1, r1, r4
  JNZ r1, loop_1
  LDI r12, 0xEB9BDD
loop_2:
  LDI r3, 1
  FILL r3
  ANDI r8, r12, 238
  LDI r5, 255
  LDI r15, 1267
  LDI r0, 0x199600
  LDI r10, 0xFD7DAB
  LDI r3, 256
  RECTF r5, r15, r0, r10, r3
  LDI r11, 0xE3088D
  LDI r7, 16
  LDI r0, 3981
  LDI r0, 861
  CIRCLE r11, r7, r0, r0
  LDI r13, 1
  SUB r12, r12, r13
  JNZ r12, loop_2
  HALT
