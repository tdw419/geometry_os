; DESCRIPTION: Draws a green rectangle at (55, 81) with width 40 and height 49.
; PLAN: r0=55(x), r1=81(y), r2=40(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 81
LDI r2, 40
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
