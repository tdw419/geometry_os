; DESCRIPTION: This GeOS assembly code initializes the system for drawing by setting up specific registers with values related to screen coordinates and color settings. It then uses the `PSETI` instruction to plot two points on the screen at specified coordinates, followed by a `HALT` command to terminate execution.

; simple draw program
; initialization
  LDI r14, 0x1250C0
  LDI r12, 1
  LDI r6, 1
  LDI r5, 763
  LDI r6, 613
  LDI r2, 16
  PSETI
  LDI r7, 1869
  LDI r12, 0x3680D8
  LDI r4, 8
  PSETI
  HALT
