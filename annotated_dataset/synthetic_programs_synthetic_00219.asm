; DESCRIPTION: This GeOS assembly code initializes several registers and then uses the `PSETI` instruction to set a pixel on the screen at a specific coordinate, followed by halting the program. The exact coordinates and color values are defined by the loaded register contents.

; simple draw program
; initialization
  LDI r12, 2828
  LDI r11, 0
  LDI r1, 8
  LDI r10, 0xAF875B
  LDI r4, 0xCCA70F
  LDI r11, 0xAF6901
  PSETI
  HALT
