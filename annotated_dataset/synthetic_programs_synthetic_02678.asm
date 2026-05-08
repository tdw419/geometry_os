; DESCRIPTION: This GeOS assembly code initializes a drawing loop by setting up registers with specific values and configuring a color palette. It then enters an infinite loop where it repeatedly draws pixels and fills areas on the screen, creating a visual pattern or animation.

; drawing loop program
; initialization
  LDI r7, 0xC67D1D
  LDI r9, 1267
  LDI r6, 2
; palette
  LDI r1, 0x40F9
  LDI r6, 1
  LDI r0, 0x00FFAA
  STORE r1, r0
  ADD r1, r1, r6
  LDI r0, 0x8800FF
  STORE r1, r0
  ADD r1, r1, r6
  LDI r0, 0x0044FF
  STORE r1, r0
  ADD r1, r1, r6
  LDI r0, 0xFFEE00
  STORE r1, r0
  ADD r1, r1, r6
  LDI r0, 0x0044FF
  STORE r1, r0
  ADD r1, r1, r6
  LDI r0, 0x0044FF
  STORE r1, r0
  ADD r1, r1, r6
  LDI r0, 0xFFFF00
  STORE r1, r0
  ADD r1, r1, r6
  LDI r0, 0xFFFFFF
  STORE r1, r0
  ADD r1, r1, r6
  LDI r0, 0xAA00AA
  STORE r1, r0
  ADD r1, r1, r6
  LDI r0, 0x00FF44
  STORE r1, r0
  ADD r1, r1, r6
  LDI r0, 0x444444
  STORE r1, r0
  ADD r1, r1, r6
  LDI r0, 0x008888
  STORE r1, r0
  ADD r1, r1, r6
  LDI r0, 0xFFFFFF
  STORE r1, r0
  ADD r1, r1, r6
  LDI r0, 0xFFFF00
  STORE r1, r0
  ADD r1, r1, r6
  LDI r0, 0x880088
  STORE r1, r0
  ADD r1, r1, r6
  LDI r0, 0x008888
  STORE r1, r0
  ADD r1, r1, r6
main_0:
  SUBI r4, r10, 0x27EB89
  LDI r0, 0xFB6675
  LDI r8, 1213
  LDI r8, 0x570BE3
  PSETI
  LDI r9, 0x13001D
  FILL r9
  FRAME
  JMP main_0
