; DESCRIPTION: The GeOS assembly code initializes registers with specific values and enters a counted animation loop. It performs bitwise operations, arithmetic operations, and pixel drawing commands until the specified counters reach zero, then halts execution.

; counted animation
; initialization
  LDI r14, 0x98EE64
  LDI r6, 306
  LDI r5, 0x203811
loop_0:
  OR r9, r12, r11
  LDI r11, 1
  SUB r5, r5, r11
  JNZ r5, loop_0
  LDI r19, 0x048C73
loop_1:
  MUL r16, r2, r15
  ANDI r9, r15, 57
  LDI r11, 1
  LDI r11, 0x68F265
  LDI r0, 8
  WPIXEL
  LDI r7, 1
  SUB r19, r19, r7
  JNZ r19, loop_1
  HALT
