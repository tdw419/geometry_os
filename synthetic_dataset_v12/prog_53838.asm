; DESCRIPTION: Draws a green rectangle at (135, 175) with width 84 and height 29.
; PLAN: r0=135(x), r1=175(y), r2=84(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 175
LDI r2, 84
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
