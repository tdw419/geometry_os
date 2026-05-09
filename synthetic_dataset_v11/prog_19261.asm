; DESCRIPTION: Draws a black rectangle at (188, 136) with width 65 and height 115.
; PLAN: r0=188(x), r1=136(y), r2=65(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 136
LDI r2, 65
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
