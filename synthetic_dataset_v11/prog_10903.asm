; DESCRIPTION: Draws a purple rectangle at (8, 102) with width 90 and height 92.
; PLAN: r0=8(x), r1=102(y), r2=90(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 102
LDI r2, 90
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
