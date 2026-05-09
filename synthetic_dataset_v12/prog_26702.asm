; DESCRIPTION: Draws a green rectangle at (194, 97) with width 115 and height 119.
; PLAN: r0=194(x), r1=97(y), r2=115(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 97
LDI r2, 115
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
