; DESCRIPTION: Draws a purple rectangle at (140, 142) with width 57 and height 74.
; PLAN: r0=140(x), r1=142(y), r2=57(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 142
LDI r2, 57
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
