; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a loop where it repeatedly draws a line, displays text, performs arithmetic operations, and updates the frame. The loop continues indefinitely, drawing "WORLD" and "HELLO" on the screen at different positions.

; drawing loop program
; initialization
  LDI r0, 3467
  LDI r13, 882
  LDI r14, 64
  LDI r11, 0xADB083
  LDI r6, 337
  LDI r7, 64
  LDI r26, 0xA9A0BE
main_0:
  LDI r6, 128
  LDI r9, 16
  LDI r9, 3957
  LDI r15, 2942
  LDI r9, 8
  LINE r6, r9, r9, r15, r9
  LDI r1, 2
  LDI r15, 0x079123
  LDI r9, 8
  DRAWTEXT r1, r15, r9, "WORLD"
  MUL r15, r17, r6
  LDI r14, 1685
  LDI r0, 852
  LDI r14, 10
  TEXT r14, r0, r14, "HELLO"
  SUBI r6, r13, 160
  FRAME
  JMP main_0
