; DESCRIPTION: Draws a green rectangle at (195, 33) with width 106 and height 29.
; PLAN: r0=195(x), r1=33(y), r2=106(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 33
LDI r2, 106
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
