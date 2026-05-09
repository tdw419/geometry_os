; DESCRIPTION: Draws a yellow rectangle at (155, 96) with width 79 and height 30.
; PLAN: r0=155(x), r1=96(y), r2=79(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 96
LDI r2, 79
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
