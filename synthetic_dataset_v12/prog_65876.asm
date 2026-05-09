; DESCRIPTION: Draws a green rectangle at (238, 14) with width 106 and height 73.
; PLAN: r0=238(x), r1=14(y), r2=106(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 14
LDI r2, 106
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
