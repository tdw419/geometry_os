; DESCRIPTION: Draws a green rectangle at (26, 157) with width 34 and height 78.
; PLAN: r0=26(x), r1=157(y), r2=34(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 157
LDI r2, 34
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
