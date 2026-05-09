; DESCRIPTION: Draws a purple rectangle at (95, 92) with width 78 and height 98.
; PLAN: r0=95(x), r1=92(y), r2=78(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 92
LDI r2, 78
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
