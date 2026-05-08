; DESCRIPTION: This GeOS assembly code initializes several registers to define a rectangle with vertices at (1, 849) and (64, 255), sets the color to 0xC38803, and uses the `PSETI` instruction to draw pixels within this rectangle before halting the program.

; simple draw program
; initialization
  LDI r11, 1
  LDI r5, 849
  LDI r6, 1651
  LDI r8, 64
  LDI r9, 255
  LDI r2, 0xC38803
  PSETI
  HALT
