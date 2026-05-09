; DESCRIPTION: Draws a black rectangle at (49, 125) with width 89 and height 62.
; PLAN: r0=49(x), r1=125(y), r2=89(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 125
LDI r2, 89
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
