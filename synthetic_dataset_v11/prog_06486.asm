; DESCRIPTION: Draws a green rectangle at (136, 169) with width 34 and height 45.
; PLAN: r0=136(x), r1=169(y), r2=34(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 169
LDI r2, 34
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
