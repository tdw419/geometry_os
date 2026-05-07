; DESCRIPTION: This GeOS assembly code initializes a drawing loop that sets up a color palette and repeatedly draws the text "WORLD" at specific coordinates on the screen.

; drawing loop program
; initialization
  LDI r15, 2411
  LDI r5, 0x350D3F
; palette
  LDI r8, 0x21F5
  LDI r4, 1
  LDI r10, 0x008888
  STORE r8, r10
  ADD r8, r8, r4
  LDI r10, 0x000000
  STORE r8, r10
  ADD r8, r8, r4
  LDI r10, 0xFF4400
  STORE r8, r10
  ADD r8, r8, r4
  LDI r10, 0x0044FF
  STORE r8, r10
  ADD r8, r8, r4
  LDI r10, 0x0044FF
  STORE r8, r10
  ADD r8, r8, r4
  LDI r10, 0xFFEE00
  STORE r8, r10
  ADD r8, r8, r4
  LDI r10, 0x00FF44
  STORE r8, r10
  ADD r8, r8, r4
  LDI r10, 0x444444
  STORE r8, r10
  ADD r8, r8, r4
  LDI r10, 0x00FFFF
  STORE r8, r10
  ADD r8, r8, r4
  LDI r10, 0xFF0000
  STORE r8, r10
  ADD r8, r8, r4
  LDI r10, 0x00FFFF
  STORE r8, r10
  ADD r8, r8, r4
  LDI r10, 0x0000FF
  STORE r8, r10
  ADD r8, r8, r4
  LDI r10, 0xFF8800
  STORE r8, r10
  ADD r8, r8, r4
  LDI r10, 0xFFEE00
  STORE r8, r10
  ADD r8, r8, r4
  LDI r10, 0xFFFFFF
  STORE r8, r10
  ADD r8, r8, r4
  LDI r10, 0xFFEE00
  STORE r8, r10
  ADD r8, r8, r4
main_0:
  ADDI r13, r10, 0xCAF442
  SUBI r8, r1, 256
  CMPI r6, r11, 1
  LDI r2, 1597
  LDI r2, 3918
  LDI r15, 2
  DRAWTEXT r2, r2, r15, "WORLD"
  FRAME
  JMP main_0
