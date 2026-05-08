; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then performs a series of graphical operations including drawing a circle with a radius of 4 pixels centered at (64, 1050) using color 255, setting a pixel at coordinates (3866, 1953) with color 255, and filling the screen with color 1234 before halting execution.

; simple draw program
; initialization
  LDI r3, 0x245EE7
  LDI r5, 2840
  LDI r12, 0xF64196
  LDI r0, 128
  LDI r2, 64
  LDI r4, 4
  LDI r7, 1050
  LDI r10, 255
  CIRCLE r2, r4, r7, r10
  LDI r10, 3866
  LDI r9, 255
  LDI r11, 1953
  PSET r10, r9, r11
  LDI r4, 1234
  FILL r4
  HALT
