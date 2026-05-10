; DESCRIPTION: Composite: Places a red dot at position (419, 6) then Draws a orange rectangle at (399, 89) with width 37 and height 66.
; PLAN: r0=419(x), r1=6(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=399(x), r6=89(y), r7=37(width), r8=66(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 6
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 399
LDI r6, 89
LDI r7, 37
LDI r8, 66
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
