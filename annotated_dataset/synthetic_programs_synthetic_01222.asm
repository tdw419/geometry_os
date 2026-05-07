; DESCRIPTION: This GeOS assembly code initializes registers and repeatedly draws a rectangle filled with color at specific coordinates, sets up text parameters, displays the string "HELLO" on the screen, and refreshes the frame. It loops indefinitely without modifying its state.

; input driven program
; initialization
  LDI r7, 1766
  LDI r30, 0x6430D1
main_0:
  LDI r7, 1447
  LDI r6, 10
  LDI r3, 16
  WPIXEL
  LDI r8, 0xC70019
  LDI r8, 0xF63365
  LDI r0, 64
  LDI r1, 1176
  LDI r7, 0xB8EF6D
  RECTF r8, r8, r0, r1, r7
  SAR r9, r6, r27
  SAR r11, r9, r1
  SUBI r8, r4, 16
  CMP r3, r14
  LDI r28, 0x854052
  LDI r12, 256
  LDI r14, 0
  TEXT r28, r12, r14, "HELLO"
  FRAME
  JMP main_0
