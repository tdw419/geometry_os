; DESCRIPTION: The GeOS assembly code initializes registers with specific values, sets up a color palette, and enters an infinite loop where it fills the screen with a color, draws pixels, writes text at a specified position, and updates the frame.

; drawing loop program
; initialization
  LDI r6, 0x512293
  LDI r0, 2870
  LDI r4, 1673
  LDI r7, 0xBF1EC6
  LDI r1, 128
  LDI r9, 3451
  LDI r8, 1071
; palette
  LDI r9, 0x40D6
  LDI r7, 1
  LDI r11, 0xDD0044
  STORE r9, r11
  ADD r9, r9, r7
  LDI r11, 0xFFAA00
  STORE r9, r11
  ADD r9, r9, r7
  LDI r11, 0x0044FF
  STORE r9, r11
  ADD r9, r9, r7
  LDI r11, 0xAA00AA
  STORE r9, r11
  ADD r9, r9, r7
  LDI r11, 0x444444
  STORE r9, r11
  ADD r9, r9, r7
  LDI r11, 0xFFFFFF
  STORE r9, r11
  ADD r9, r9, r7
main_0:
  LDI r15, 0x6F19E9
  FILL r15
  LDI r0, 346
  LDI r1, 4
  LDI r1, 32
  WPIXEL
  LDI r9, 0x4EE682
  LDI r3, 64
  LDI r8, 0xF13159
  DRAWTEXT r9, r3, r8, "WORLD"
  FRAME
  JMP main_0
