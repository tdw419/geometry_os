; DESCRIPTION: Draws a purple rectangle at (72, 50) with width 17 and height 89.
; PLAN: r0=72(x), r1=50(y), r2=17(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 50
LDI r2, 17
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
