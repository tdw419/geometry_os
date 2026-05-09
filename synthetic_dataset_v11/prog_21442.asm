; DESCRIPTION: Draws a green rectangle at (155, 85) with width 100 and height 39.
; PLAN: r0=155(x), r1=85(y), r2=100(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 85
LDI r2, 100
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
