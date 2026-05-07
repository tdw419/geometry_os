; DESCRIPTION: This GeOS assembly code initializes registers and sets up a color palette. It then enters a loop where it draws the text "WORLD" at specific coordinates, checks for a key press, and redraws the text with a different color if the key is pressed. The loop continues indefinitely, updating the display frame after each iteration.

; drawing loop program
; initialization
  LDI r11, 16
  LDI r9, 2
  LDI r10, 0x6B9DB0
  LDI r13, 8
  LDI r5, 16
; palette
  LDI r11, 0x2193
  LDI r3, 1
  LDI r30, 0xFF4400
  STORE r11, r30
  ADD r11, r11, r3
  LDI r30, 0x000000
  STORE r11, r30
  ADD r11, r11, r3
  LDI r30, 0xFF4400
  STORE r11, r30
  ADD r11, r11, r3
  LDI r30, 0x0044FF
  STORE r11, r30
  ADD r11, r11, r3
  LDI r30, 0xFFAA00
  STORE r11, r30
  ADD r11, r11, r3
  LDI r30, 0x00FFFF
  STORE r11, r30
  ADD r11, r11, r3
main_0:
  LDI r14, 8
  LDI r7, 1746
  LDI r7, 2768
  DRAWTEXT r14, r7, r7, "WORLD"
  IKEY r14
  CMPI r14, 0x985873
  JNZ r14, key_1
  LDI r29, 0xDE6D53
  LDI r11, 16
  LDI r25, 3181
  DRAWTEXT r29, r11, r25, "WORLD"
  SHL r15, r0, r10
  FRAME
  JMP main_0
