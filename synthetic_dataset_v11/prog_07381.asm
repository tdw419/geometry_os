; DESCRIPTION: Draws a purple rectangle at (85, 25) with width 61 and height 22.
; PLAN: r0=85(x), r1=25(y), r2=61(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 25
LDI r2, 61
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
