; DESCRIPTION: Draws a black rectangle at (29, 78) with width 79 and height 79.
; PLAN: r0=29(x), r1=78(y), r2=79(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 78
LDI r2, 79
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
