; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `PSETI` instruction to plot a pixel on the screen at coordinates defined by those register values. The program halts after executing these operations.

; simple draw program
; initialization
  LDI r13, 2244
  LDI r0, 566
  LDI r4, 3869
  LDI r10, 0
  LDI r14, 1451
  LDI r0, 3439
  LDI r7, 64
  LDI r11, 0x8307D4
  PSETI
  HALT
