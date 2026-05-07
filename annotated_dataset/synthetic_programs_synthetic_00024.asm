; DESCRIPTION: This GeOS assembly code initializes a drawing loop with specific color values and draws the text "WORLD" repeatedly on the screen. The palette is set up with various colors, and the program continuously updates the frame to display the text in different positions based on modulo operations.

; drawing loop program
; initialization
  LDI r6, 2173
  LDI r9, 0x1969D1
; palette
  LDI r15, 0x24F5
  LDI r11, 1
  LDI r2, 0x00FF00
  STORE r15, r2
  ADD r15, r15, r11
  LDI r2, 0x000000
  STORE r15, r2
  ADD r15, r15, r11
  LDI r2, 0xFF00FF
  STORE r15, r2
  ADD r15, r15, r11
  LDI r2, 0xFFFF00
  STORE r15, r2
  ADD r15, r15, r11
  LDI r2, 0xAAFF00
  STORE r15, r2
  ADD r15, r15, r11
  LDI r2, 0x8800FF
  STORE r15, r2
  ADD r15, r15, r11
  LDI r2, 0xFF0000
  STORE r15, r2
  ADD r15, r15, r11
main_0:
  MOD r15, r8, r12
  CMP r5, r8
  LDI r7, 1238
  LDI r3, 0xB0056C
  LDI r13, 499
  DRAWTEXT r7, r3, r13, "WORLD"
  CMPI r7, r2, 17
  CMP r5, r22
  FRAME
  JMP main_0
