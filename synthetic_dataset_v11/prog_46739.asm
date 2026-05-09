; DESCRIPTION: Draws a white rectangle at (132, 136) with width 95 and height 101.
; PLAN: r0=132(x), r1=136(y), r2=95(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 136
LDI r2, 95
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
