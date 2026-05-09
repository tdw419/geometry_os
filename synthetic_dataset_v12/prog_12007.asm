; DESCRIPTION: Draws a black rectangle at (136, 96) with width 51 and height 70.
; PLAN: r0=136(x), r1=96(y), r2=51(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 96
LDI r2, 51
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
