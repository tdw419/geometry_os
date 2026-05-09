; DESCRIPTION: Draws a black rectangle at (194, 106) with width 93 and height 119.
; PLAN: r0=194(x), r1=106(y), r2=93(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 106
LDI r2, 93
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
