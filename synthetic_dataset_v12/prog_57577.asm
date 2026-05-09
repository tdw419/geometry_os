; DESCRIPTION: Draws a purple rectangle at (19, 120) with width 90 and height 118.
; PLAN: r0=19(x), r1=120(y), r2=90(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 120
LDI r2, 90
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
