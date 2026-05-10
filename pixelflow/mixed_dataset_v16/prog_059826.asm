; DESCRIPTION: Draws a purple rectangle at (338, 133) with width 20 and height 23.
; PLAN: r0=338(x), r1=133(y), r2=20(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 133
LDI r2, 20
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
