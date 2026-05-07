; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then enters a counted animation loop. It performs bitwise operations, arithmetic calculations, and draws rectangles on the screen before halting execution.

; counted animation
; initialization
  LDI r13, 3300
  LDI r15, 3342
  LDI r4, 0xD80660
  LDI r6, 0x48D08E
  LDI r11, 23
loop_0:
  OR r2, r11, r21
  ANDI r7, r15, 0x7F853F
  MUL r3, r15, r11
  LDI r6, 1
  SUB r11, r11, r6
  JNZ r11, loop_0
  LDI r9, 16
loop_1:
  LDI r7, 0x738140
  LDI r8, 0x3C5545
  LDI r6, 134
  LDI r21, 0x20925E
  LDI r3, 0x4E5069
  RECTF r7, r8, r6, r21, r3
  ADDI r2, r14, 54
  LDI r12, 1
  SUB r9, r9, r12
  JNZ r9, loop_1
  HALT
