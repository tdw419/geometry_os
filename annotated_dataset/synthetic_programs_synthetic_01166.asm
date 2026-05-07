; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `PSET` instruction to set pixel colors at given coordinates on a display. After setting two pixels, it fills an area starting from a specific point using the `FILL` instruction before halting execution.

; simple draw program
; initialization
  LDI r13, 757
  LDI r0, 0
  LDI r6, 542
  LDI r12, 2376
  LDI r12, 0x1745C5
  LDI r11, 10
  LDI r9, 255
  PSET r12, r11, r9
  LDI r11, 256
  LDI r9, 1452
  LDI r13, 0
  PSET r11, r9, r13
  LDI r6, 16
  FILL r6
  HALT
