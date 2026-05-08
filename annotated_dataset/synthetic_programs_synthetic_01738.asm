; DESCRIPTION: This GeOS assembly code initializes a drawing environment with specific register values and sets up a color palette. It then enters a loop (`main_0`) where it draws the text "WORLD" at position (796, 128) using color 0xA40E79, followed by "HELLO" at position (3144, 0x163307) using color 2. The loop continuously updates the screen with these texts and calls `FRAME` to refresh the display.

; drawing loop program
; initialization
  LDI r8, 32
  LDI r6, 3186
  LDI r15, 2745
  LDI r2, 3690
; palette
  LDI r3, 0x20A3
  LDI r0, 1
  LDI r2, 0xFF8800
  STORE r3, r2
  ADD r3, r3, r0
  LDI r2, 0xAAAAAA
  STORE r3, r2
  ADD r3, r3, r0
  LDI r2, 0xFF0000
  STORE r3, r2
  ADD r3, r3, r0
  LDI r2, 0xFFEE00
  STORE r3, r2
  ADD r3, r3, r0
  LDI r2, 0x0044FF
  STORE r3, r2
  ADD r3, r3, r0
  LDI r2, 0x444444
  STORE r3, r2
  ADD r3, r3, r0
  LDI r2, 0x444444
  STORE r3, r2
  ADD r3, r3, r0
  LDI r2, 0xAA00AA
  STORE r3, r2
  ADD r3, r3, r0
  LDI r2, 0x8800FF
  STORE r3, r2
  ADD r3, r3, r0
  LDI r2, 0xFFEE00
  STORE r3, r2
  ADD r3, r3, r0
  LDI r2, 0x444444
  STORE r3, r2
  ADD r3, r3, r0
  LDI r2, 0x444444
  STORE r3, r2
  ADD r3, r3, r0
  LDI r2, 0x00FF44
  STORE r3, r2
  ADD r3, r3, r0
  LDI r2, 0xFF00FF
  STORE r3, r2
  ADD r3, r3, r0
main_0:
  CMP r6, r10
  CMPI r0, 128
  LDI r14, 796
  LDI r5, 128
  LDI r8, 0xA40E79
  DRAWTEXT r14, r5, r8, "WORLD"
  LDI r8, 2
  LDI r10, 3144
  LDI r11, 0x163307
  TEXT r8, r10, r11, "HELLO"
  FRAME
  JMP main_0
