; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and uses the `PSETI` instruction to draw a pixel at the coordinates defined by these registers. The program then halts execution.

; simple draw program
; initialization
  LDI r14, 849
  LDI r7, 4
  LDI r6, 1076
  LDI r11, 1984
  LDI r13, 0
  PSETI
  HALT
