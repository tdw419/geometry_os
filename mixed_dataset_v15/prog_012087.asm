; DESCRIPTION: Draws a purple rectangle at (252, 54) with width 66 and height 92.
; PLAN: r0=252(x), r1=54(y), r2=66(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 54
LDI r2, 66
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
