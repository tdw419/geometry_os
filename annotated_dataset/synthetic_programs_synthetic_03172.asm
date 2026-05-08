; DESCRIPTION: This GeOS assembly code initializes drawing parameters and sets up a color palette. It then enters a loop where it waits for a specific key press (key 10) to trigger the drawing of a frame using a predefined color scheme. The program repeatedly checks for this key press and draws frames until further notice.

; drawing loop program
; initialization
  LDI r5, 1934
  LDI r8, 619
  LDI r3, 0x46E194
; palette
  LDI r15, 0x2006
  LDI r1, 1
  LDI r4, 0xFFFFFF
  STORE r15, r4
  ADD r15, r15, r1
  LDI r4, 0xDD0044
  STORE r15, r4
  ADD r15, r15, r1
  LDI r4, 0xFF8800
  STORE r15, r4
  ADD r15, r15, r1
  LDI r4, 0x444444
  STORE r15, r4
  ADD r15, r15, r1
  LDI r4, 0x0000CC
  STORE r15, r4
  ADD r15, r15, r1
  LDI r4, 0x000066
  STORE r15, r4
  ADD r15, r15, r1
  LDI r4, 0xFFEE00
  STORE r15, r4
  ADD r15, r15, r1
  LDI r4, 0xFF00FF
  STORE r15, r4
  ADD r15, r15, r1
  LDI r4, 0xFFFFFF
  STORE r15, r4
  ADD r15, r15, r1
  LDI r4, 0x00FF00
  STORE r15, r4
  ADD r15, r15, r1
  LDI r4, 0x00FFFF
  STORE r15, r4
  ADD r15, r15, r1
  LDI r4, 0xAAFF00
  STORE r15, r4
  ADD r15, r15, r1
  LDI r4, 0xAAFF00
  STORE r15, r4
  ADD r15, r15, r1
  LDI r4, 0x550077
  STORE r15, r4
  ADD r15, r15, r1
  LDI r4, 0x008888
  STORE r15, r4
  ADD r15, r15, r1
  LDI r4, 0xFF4400
  STORE r15, r4
  ADD r15, r15, r1
main_0:
  IKEY r11
  CMPI r11, 10
  JNZ r11, key_1
  CMPI r6, 0x6EE31A
  FRAME
  JMP main_0
