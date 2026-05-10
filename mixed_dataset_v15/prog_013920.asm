; DESCRIPTION: Composite: Places a yellow dot at position (399, 194) then Draws a orange rectangle at (219, 105) with width 79 and height 60.
; PLAN: r0=399(x), r1=194(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=219(x), r6=105(y), r7=79(width), r8=60(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 399
LDI r1, 194
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 219
LDI r6, 105
LDI r7, 79
LDI r8, 60
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
