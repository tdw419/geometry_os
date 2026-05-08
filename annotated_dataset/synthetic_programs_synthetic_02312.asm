; DESCRIPTION: This GeOS assembly code initializes a palette with various colors and then performs a series of register manipulations. It loads values into registers, stores them, and uses the `DRAWTEXT` instruction to display the text "WORLD" on the screen at a specified position, followed by a halt command.

; mixed program
; initialization
  LDI r3, 168
  LDI r4, 8
  LDI r5, 8
; palette
  LDI r2, 0x7005
  LDI r12, 1
  LDI r11, 0x888800
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0x00FF00
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0xFFAA00
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0x444444
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0x0044FF
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0x00FFFF
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0xFF4400
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0x0000CC
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0xFF00FF
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0x0000FF
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0xAAAAAA
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0xFF00FF
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0xFF4400
  STORE r2, r11
  ADD r2, r2, r12
  PUSH r13
  AND r5, r7, r3
  ADD r3, r9, r10
  OR r26, r14, r9
  POP r13
  LDI r11, 886
  STORE r11, r11
  LOAD r5, r11
  LDI r0, 255
  STORE r0, r6
  LOAD r10, r0
  LDI r15, 0x14A681
  STORE r15, r0
  LOAD r10, r15
  LDI r14, 3116
  LDI r6, 255
  LDI r13, 1
  DRAWTEXT r14, r6, r13, "WORLD"
  HALT
