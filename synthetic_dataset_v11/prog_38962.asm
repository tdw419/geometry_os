; DESCRIPTION: Draws a purple rectangle at (148, 76) with width 79 and height 55.
; PLAN: r0=148(x), r1=76(y), r2=79(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 76
LDI r2, 79
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
