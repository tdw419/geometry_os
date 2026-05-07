; DESCRIPTION: This GeOS assembly code initializes a drawing loop that displays the text "WORLD" on the screen using a predefined palette of colors. It handles user input to change color settings and refreshes the frame continuously.

; drawing loop program
; initialization
  LDI r9, 3026
  LDI r3, 609
  LDI r5, 0xC03F5B
  LDI r15, 3205
  LDI r0, 0x51CF3B
  LDI r4, 3002
  LDI r14, 0xDF20A5
  LDI r2, 10
; palette
  LDI r10, 0x30D2
  LDI r4, 1
  LDI r3, 0xAAFF00
  STORE r10, r3
  ADD r10, r10, r4
  LDI r3, 0xAA00AA
  STORE r10, r3
  ADD r10, r10, r4
  LDI r3, 0xAAFF00
  STORE r10, r3
  ADD r10, r10, r4
  LDI r3, 0xFF0000
  STORE r10, r3
  ADD r10, r10, r4
  LDI r3, 0x00FF44
  STORE r10, r3
  ADD r10, r10, r4
  LDI r3, 0xFFFFFF
  STORE r10, r3
  ADD r10, r10, r4
  LDI r3, 0x8800FF
  STORE r10, r3
  ADD r10, r10, r4
  LDI r3, 0x008888
  STORE r10, r3
  ADD r10, r10, r4
  LDI r3, 0x0000FF
  STORE r10, r3
  ADD r10, r10, r4
  LDI r3, 0x00FFFF
  STORE r10, r3
  ADD r10, r10, r4
  LDI r3, 0xAAFF00
  STORE r10, r3
  ADD r10, r10, r4
  LDI r3, 0x880088
  STORE r10, r3
  ADD r10, r10, r4
  LDI r3, 0x550077
  STORE r10, r3
  ADD r10, r10, r4
  LDI r3, 0x888800
  STORE r10, r3
  ADD r10, r10, r4
  LDI r3, 0x880088
  STORE r10, r3
  ADD r10, r10, r4
main_0:
  LDI r8, 32
  LDI r13, 32
  LDI r0, 2236
  DRAWTEXT r8, r13, r0, "WORLD"
  SAR r4, r2, r19
  SHL r14, r5, r0
  IKEY r8
  CMPI r8, 165
  JNZ r8, key_1
  SHL r5, r4, r11
  SAR r27, r3, r15
  IKEY r10
  CMPI r10, 0xDC39D8
  JNZ r10, key_2
  FRAME
  JMP main_0
