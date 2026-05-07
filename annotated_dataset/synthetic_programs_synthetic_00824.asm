; DESCRIPTION: This GeOS assembly code initializes a drawing environment by setting up registers and defining a color palette. It then enters a loop where it repeatedly displays the text "HELLO" on the screen with varying colors from the palette until a condition is met (CMP r7, r2) that triggers a jump back to the start of the loop (JMP main_0).

; drawing loop program
; initialization
  LDI r1, 0
  LDI r11, 1580
  LDI r12, 8
  LDI r6, 1363
  LDI r17, 1
  LDI r3, 4
; palette
  LDI r12, 0x3077
  LDI r6, 1
  LDI r14, 0xFFFFFF
  STORE r12, r14
  ADD r12, r12, r6
  LDI r14, 0x008888
  STORE r12, r14
  ADD r12, r12, r6
  LDI r14, 0xAAFF00
  STORE r12, r14
  ADD r12, r12, r6
  LDI r14, 0x0044FF
  STORE r12, r14
  ADD r12, r12, r6
  LDI r14, 0x0044FF
  STORE r12, r14
  ADD r12, r12, r6
  LDI r14, 0x880088
  STORE r12, r14
  ADD r12, r12, r6
  LDI r14, 0x44FF00
  STORE r12, r14
  ADD r12, r12, r6
  LDI r14, 0x00FFAA
  STORE r12, r14
  ADD r12, r12, r6
  LDI r14, 0x888800
  STORE r12, r14
  ADD r12, r12, r6
  LDI r14, 0x0044FF
  STORE r12, r14
  ADD r12, r12, r6
  LDI r14, 0xFFFFFF
  STORE r12, r14
  ADD r12, r12, r6
  LDI r14, 0x000066
  STORE r12, r14
  ADD r12, r12, r6
  LDI r14, 0xFF4400
  STORE r12, r14
  ADD r12, r12, r6
  LDI r14, 0xAAFF00
  STORE r12, r14
  ADD r12, r12, r6
  LDI r14, 0xFFFFFF
  STORE r12, r14
  ADD r12, r12, r6
main_0:
  LDI r0, 0x9B5604
  LDI r3, 16
  LDI r9, 1264
  TEXT r0, r3, r9, "HELLO"
  CMP r7, r2
  FRAME
  JMP main_0
