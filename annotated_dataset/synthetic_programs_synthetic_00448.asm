; DESCRIPTION: This GeOS assembly code initializes registers with specific values and then uses the `PSET` instruction to plot two points on a display. The first point is plotted at coordinates (3530, 2448) with color 0x2072CA, and the second point is plotted at coordinates (0x29549B, 32) with color 4. The program then halts execution.

; simple draw program
; initialization
  LDI r2, 16
  LDI r9, 0xDB67FB
  LDI r0, 255
  LDI r6, 3530
  LDI r13, 2448
  LDI r15, 1861
  LDI r6, 10
  LDI r5, 3171
  LDI r2, 0x2072CA
  PSET r6, r5, r2
  LDI r5, 0x29549B
  LDI r7, 32
  LDI r1, 4
  PSET r5, r7, r1
  HALT
