; DESCRIPTION: Draws a purple rectangle at (5, 89) with width 98 and height 78.
; PLAN: r0=5(x), r1=89(y), r2=98(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 89
LDI r2, 98
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
