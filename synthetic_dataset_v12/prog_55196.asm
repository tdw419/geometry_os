; DESCRIPTION: Draws a black rectangle at (411, 136) with width 87 and height 110.
; PLAN: r0=411(x), r1=136(y), r2=87(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 136
LDI r2, 87
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
