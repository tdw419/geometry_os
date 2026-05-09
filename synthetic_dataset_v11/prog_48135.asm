; DESCRIPTION: Draws a green rectangle at (24, 49) with width 88 and height 51.
; PLAN: r0=24(x), r1=49(y), r2=88(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 49
LDI r2, 88
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
