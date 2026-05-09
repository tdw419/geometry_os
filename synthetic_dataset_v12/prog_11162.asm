; DESCRIPTION: Draws a black rectangle at (79, 136) with width 73 and height 100.
; PLAN: r0=79(x), r1=136(y), r2=73(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 136
LDI r2, 73
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
