; DESCRIPTION: Draws a green rectangle at (162, 142) with width 48 and height 106.
; PLAN: r0=162(x), r1=142(y), r2=48(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 142
LDI r2, 48
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
