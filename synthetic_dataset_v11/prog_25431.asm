; DESCRIPTION: Draws a blue rectangle at (136, 222) with width 112 and height 17.
; PLAN: r0=136(x), r1=222(y), r2=112(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 222
LDI r2, 112
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
