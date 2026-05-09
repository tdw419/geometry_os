; DESCRIPTION: Draws a purple rectangle at (155, 48) with width 120 and height 97.
; PLAN: r0=155(x), r1=48(y), r2=120(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 48
LDI r2, 120
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
