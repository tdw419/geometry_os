; DESCRIPTION: Draws a purple rectangle at (460, 118) with width 29 and height 107.
; PLAN: r0=460(x), r1=118(y), r2=29(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 118
LDI r2, 29
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
