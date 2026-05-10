; DESCRIPTION: Draws a orange rectangle at (324, 182) with width 89 and height 35.
; PLAN: r0=324(x), r1=182(y), r2=89(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 182
LDI r2, 89
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
