; DESCRIPTION: Draws a green rectangle at (73, 192) with width 35 and height 89.
; PLAN: r0=73(x), r1=192(y), r2=35(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 192
LDI r2, 35
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
