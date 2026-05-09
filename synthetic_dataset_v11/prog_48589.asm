; DESCRIPTION: Draws a black rectangle at (36, 79) with width 109 and height 29.
; PLAN: r0=36(x), r1=79(y), r2=109(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 79
LDI r2, 109
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
