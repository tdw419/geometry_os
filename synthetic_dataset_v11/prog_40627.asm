; DESCRIPTION: Draws a green rectangle at (55, 175) with width 112 and height 12.
; PLAN: r0=55(x), r1=175(y), r2=112(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 175
LDI r2, 112
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
