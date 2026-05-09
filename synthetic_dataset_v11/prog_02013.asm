; DESCRIPTION: Draws a green rectangle at (205, 119) with width 51 and height 73.
; PLAN: r0=205(x), r1=119(y), r2=51(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 119
LDI r2, 51
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
