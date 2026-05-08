; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `PSET` instruction to set a pixel on the display at coordinates (255, 0x31D2AD) with color 0xE9955D. The program halts after setting the pixel.

; simple draw program
; initialization
  LDI r3, 2671
  LDI r12, 255
  LDI r18, 0xD545CB
  LDI r14, 0x16609D
  LDI r0, 255
  LDI r9, 0x31D2AD
  LDI r2, 0xE9955D
  PSET r0, r9, r2
  HALT
