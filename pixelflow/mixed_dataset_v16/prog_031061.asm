; DESCRIPTION: Draws a purple rectangle at (82, 109) with width 15 and height 94.
; PLAN: r0=82(x), r1=109(y), r2=15(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 109
LDI r2, 15
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
