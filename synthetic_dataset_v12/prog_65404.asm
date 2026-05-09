; DESCRIPTION: Draws a green rectangle at (227, 19) with width 19 and height 84.
; PLAN: r0=227(x), r1=19(y), r2=19(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 19
LDI r2, 19
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
