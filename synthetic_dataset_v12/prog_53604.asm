; DESCRIPTION: Draws a green rectangle at (10, 35) with width 43 and height 49.
; PLAN: r0=10(x), r1=35(y), r2=43(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 35
LDI r2, 43
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
