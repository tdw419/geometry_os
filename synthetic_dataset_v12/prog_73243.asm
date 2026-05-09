; DESCRIPTION: Draws a purple rectangle at (322, 132) with width 57 and height 94.
; PLAN: r0=322(x), r1=132(y), r2=57(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 132
LDI r2, 57
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
