; DESCRIPTION: Draws a purple rectangle at (136, 10) with width 119 and height 109.
; PLAN: r0=136(x), r1=10(y), r2=119(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 10
LDI r2, 119
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
