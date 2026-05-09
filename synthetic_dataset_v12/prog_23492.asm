; DESCRIPTION: Draws a orange rectangle at (338, 113) with width 118 and height 73.
; PLAN: r0=338(x), r1=113(y), r2=118(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 113
LDI r2, 118
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
