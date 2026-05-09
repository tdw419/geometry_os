; DESCRIPTION: Draws a purple rectangle at (3, 12) with width 92 and height 15.
; PLAN: r0=3(x), r1=12(y), r2=92(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 12
LDI r2, 92
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
