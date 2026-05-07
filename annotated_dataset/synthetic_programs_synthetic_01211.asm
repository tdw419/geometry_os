; DESCRIPTION: The GeOS assembly code initializes graphics settings and draws two pixels on the screen: one at position (256, 0x3EE495) with color 0xFF4M10 and another at position (8, 255) with color 0xC029CF.

; simple draw program
; initialization
  LDI r0, 2
  LDI r8, 0x4A4F31
  LDI r9, 0xFF4D10
  LDI r0, 256
  LDI r1, 0x3EE495
  LDI r25, 1
  PSETI
  LDI r0, 8
  LDI r14, 255
  LDI r3, 0xC029CF
  PSET r0, r14, r3
  HALT
