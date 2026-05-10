; DESCRIPTION: Draws a purple rectangle at (424, 76) with width 87 and height 85.
; PLAN: r0=424(x), r1=76(y), r2=87(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 76
LDI r2, 87
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
