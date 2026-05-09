; DESCRIPTION: Draws a black rectangle at (112, 11) with width 79 and height 58.
; PLAN: r0=112(x), r1=11(y), r2=79(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 11
LDI r2, 79
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
