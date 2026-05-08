; DESCRIPTION: This GeOS assembly code initializes a simple draw program by loading specific values into registers and using the `PSETI` instruction to set a pixel on the screen at coordinates defined by the register values. The program then halts execution.

; simple draw program
; initialization
  LDI r11, 0xAB4F1E
  LDI r6, 10
  LDI r8, 8
  LDI r5, 3682
  LDI r0, 802
  PSETI
  HALT
