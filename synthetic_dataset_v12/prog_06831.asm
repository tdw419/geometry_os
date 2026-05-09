; DESCRIPTION: Draws a purple rectangle at (237, 119) with width 115 and height 114.
; PLAN: r0=237(x), r1=119(y), r2=115(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 119
LDI r2, 115
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
