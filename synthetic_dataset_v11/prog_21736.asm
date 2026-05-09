; DESCRIPTION: Draws a purple rectangle at (109, 161) with width 90 and height 89.
; PLAN: r0=109(x), r1=161(y), r2=90(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 161
LDI r2, 90
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
