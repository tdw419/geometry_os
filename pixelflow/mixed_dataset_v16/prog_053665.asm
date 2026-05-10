; DESCRIPTION: Draws a purple rectangle at (230, 118) with width 48 and height 39.
; PLAN: r0=230(x), r1=118(y), r2=48(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 118
LDI r2, 48
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
