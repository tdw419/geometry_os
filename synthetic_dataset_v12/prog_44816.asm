; DESCRIPTION: Draws a black rectangle at (132, 142) with width 95 and height 79.
; PLAN: r0=132(x), r1=142(y), r2=95(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 142
LDI r2, 95
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
