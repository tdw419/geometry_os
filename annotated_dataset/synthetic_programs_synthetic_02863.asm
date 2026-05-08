; DESCRIPTION: This GeOS assembly code initializes a drawing loop, setting up a palette of colors and then repeatedly displaying the text "HELLO" on the screen within a frame, likely in an infinite loop.

; drawing loop program
; initialization
  LDI r7, 902
  LDI r11, 64
; palette
  LDI r12, 0x20B4
  LDI r7, 1
  LDI r15, 0x00FFAA
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0xFFAA00
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0xFFFFFF
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0x888800
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0xFFEE00
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0xDD0044
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0x000000
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0x0044FF
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0x00FF00
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0x00FFFF
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0xFF4400
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0x00FF44
  STORE r12, r15
  ADD r12, r12, r7
  LDI r15, 0xAAFF00
  STORE r12, r15
  ADD r12, r12, r7
main_0:
  CMP r12, r2
  OR r1, r15, r3
  OR r12, r11, r1
  OR r5, r0, r11
  OR r10, r8, r11
  LDI r7, 64
  LDI r6, 3841
  LDI r11, 716
  TEXT r7, r6, r11, "HELLO"
  CMP r20, r31
  FRAME
  JMP main_0
