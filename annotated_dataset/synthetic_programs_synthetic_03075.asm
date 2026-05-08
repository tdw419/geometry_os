; DESCRIPTION: This GeOS assembly code initializes a drawing loop with specific color palette entries and repeatedly executes a frame update in an infinite loop.

; drawing loop program
; initialization
  LDI r8, 0xA327BB
  LDI r0, 0x0C45D0
; palette
  LDI r2, 0x30E8
  LDI r8, 1
  LDI r3, 0x44FF00
  STORE r2, r3
  ADD r2, r2, r8
  LDI r3, 0xFF00FF
  STORE r2, r3
  ADD r2, r2, r8
  LDI r3, 0x00FF44
  STORE r2, r3
  ADD r2, r2, r8
  LDI r3, 0x00FF44
  STORE r2, r3
  ADD r2, r2, r8
  LDI r3, 0x000066
  STORE r2, r3
  ADD r2, r2, r8
  LDI r3, 0x000066
  STORE r2, r3
  ADD r2, r2, r8
  LDI r3, 0xFFFFFF
  STORE r2, r3
  ADD r2, r2, r8
  LDI r3, 0x880088
  STORE r2, r3
  ADD r2, r2, r8
  LDI r3, 0x00FFFF
  STORE r2, r3
  ADD r2, r2, r8
  LDI r3, 0xAAFF00
  STORE r2, r3
  ADD r2, r2, r8
  LDI r3, 0x0000CC
  STORE r2, r3
  ADD r2, r2, r8
  LDI r3, 0x880088
  STORE r2, r3
  ADD r2, r2, r8
  LDI r3, 0xAAFF00
  STORE r2, r3
  ADD r2, r2, r8
  LDI r3, 0x00FFFF
  STORE r2, r3
  ADD r2, r2, r8
  LDI r3, 0x444444
  STORE r2, r3
  ADD r2, r2, r8
  LDI r3, 0xFFEE00
  STORE r2, r3
  ADD r2, r2, r8
main_0:
  ANDI r5, r2, 79
  ADDI r0, r9, 122
  FRAME
  JMP main_0
