; DESCRIPTION: Draws a green rectangle at (31, 52) with width 63 and height 35.
; PLAN: r0=31(x), r1=52(y), r2=63(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 52
LDI r2, 63
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
