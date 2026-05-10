; DESCRIPTION: Draws a black rectangle at (100, 135) with width 79 and height 73.
; PLAN: r0=100(x), r1=135(y), r2=79(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 135
LDI r2, 79
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
