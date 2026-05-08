; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a loop where it draws the text "WORLD" at coordinates (3282, 399) using color 0x58CE94. It also performs a right shift operation on register r6, compares register r11 with r12, and draws a filled rectangle with upper-left corner at (2163, 1133), lower-right corner at (1132, 0x4DE40A) using color 0x6AA9A4. The loop repeats indefinitely after displaying the frame.

; input driven program
; initialization
  LDI r5, 0x221086
  LDI r11, 64
  LDI r3, 0x71A006
  LDI r14, 128
  LDI r2, 933
  LDI r0, 0xB71369
  LDI r13, 1
main_0:
  LDI r12, 3282
  LDI r3, 399
  LDI r4, 0x58CE94
  DRAWTEXT r12, r3, r4, "WORLD"
  SHR r6, r10, r4
  CMP r11, r12
  LDI r9, 2163
  LDI r11, 1133
  LDI r8, 0x6AA9A4
  LDI r4, 0x4DE40A
  LDI r19, 1132
  RECTF r9, r11, r8, r4, r19
  FRAME
  JMP main_0
