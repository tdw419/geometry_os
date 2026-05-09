; DESCRIPTION: Draws a purple rectangle at (313, 101) with width 79 and height 92.
; PLAN: r0=313(x), r1=101(y), r2=79(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 101
LDI r2, 79
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
