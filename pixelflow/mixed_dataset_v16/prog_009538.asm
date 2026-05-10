; DESCRIPTION: Draws a green rectangle at (183, 76) with width 110 and height 110.
; PLAN: r0=183(x), r1=76(y), r2=110(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 76
LDI r2, 110
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
