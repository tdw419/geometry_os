; DESCRIPTION: Draws a orange rectangle at (311, 167) with width 78 and height 80.
; PLAN: r0=311(x), r1=167(y), r2=78(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 167
LDI r2, 78
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
