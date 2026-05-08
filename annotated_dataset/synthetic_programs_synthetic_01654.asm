; DESCRIPTION: This GeOS assembly code initializes registers with specific values, sets up a color palette, and enters a loop where it draws text "WORLD", a line, and a circle on the screen, then updates the frame. The loop repeats indefinitely.

; drawing loop program
; initialization
  LDI r9, 0xE5E339
  LDI r14, 0x1A70B1
  LDI r10, 0
  LDI r0, 0x4600CE
  LDI r6, 0x9B7320
  LDI r7, 3189
  LDI r11, 0x3B2444
; palette
  LDI r7, 0x2090
  LDI r28, 1
  LDI r13, 0xFFFF00
  STORE r7, r13
  ADD r7, r7, r28
  LDI r13, 0x00FF00
  STORE r7, r13
  ADD r7, r7, r28
  LDI r13, 0x0044FF
  STORE r7, r13
  ADD r7, r7, r28
  LDI r13, 0xFF4400
  STORE r7, r13
  ADD r7, r7, r28
  LDI r13, 0x00FFAA
  STORE r7, r13
  ADD r7, r7, r28
  LDI r13, 0xFFAA00
  STORE r7, r13
  ADD r7, r7, r28
  LDI r13, 0x8800FF
  STORE r7, r13
  ADD r7, r7, r28
main_0:
  XOR r24, r13, r3
  LDI r13, 0
  LDI r3, 4021
  LDI r8, 0xB7ACDB
  DRAWTEXT r13, r3, r8, "WORLD"
  LDI r12, 1057
  LDI r7, 1034
  LDI r13, 128
  LDI r5, 0
  LDI r3, 0xF9F8FC
  LINE r12, r7, r13, r5, r3
  LDI r4, 97
  LDI r7, 0x176AAB
  LDI r11, 2
  LDI r15, 8
  CIRCLE r4, r7, r11, r15
  FRAME
  JMP main_0
