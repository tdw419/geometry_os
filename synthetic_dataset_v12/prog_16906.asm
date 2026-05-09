; DESCRIPTION: Draws a green rectangle at (377, 184) with width 35 and height 22.
; PLAN: r0=377(x), r1=184(y), r2=35(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 184
LDI r2, 35
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
