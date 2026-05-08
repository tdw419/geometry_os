; DESCRIPTION: This GeOS assembly code initializes several registers and then enters a loop where it repeatedly draws lines on the screen with varying parameters. The loop continues until a counter in register `r9` reaches zero, at which point the program halts.

; counted animation
; initialization
  LDI r7, 4
  LDI r4, 64
  LDI r30, 0xC6AF99
  LDI r9, 0x1470CD
loop_0:
  LDI r12, 356
  FILL r12
  ANDI r19, r11, 8
  LDI r0, 0
  LDI r14, 0x38D8A0
  LDI r16, 16
  LDI r1, 2998
  LDI r8, 4
  LINE r0, r14, r16, r1, r8
  DIV r8, r6, r1
  LDI r5, 1
  SUB r9, r9, r5
  JNZ r9, loop_0
  HALT
