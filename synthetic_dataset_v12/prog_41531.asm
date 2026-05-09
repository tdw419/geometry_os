; DESCRIPTION: Draws a green rectangle at (19, 123) with width 24 and height 43.
; PLAN: r0=19(x), r1=123(y), r2=24(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 123
LDI r2, 24
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
