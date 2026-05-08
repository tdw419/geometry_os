; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `PSETI` instruction to draw a pixel at coordinates (0, 1096) on a display. The program halts afterward.

; simple draw program
; initialization
  LDI r9, 0xEEB877
  LDI r2, 864
  LDI r5, 0xA1C822
  LDI r13, 32
  LDI r6, 0x088586
  LDI r12, 8
  LDI r2, 0
  LDI r5, 1096
  LDI r4, 41
  PSETI
  HALT
