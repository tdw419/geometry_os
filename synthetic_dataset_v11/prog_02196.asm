; DESCRIPTION: Draws a purple rectangle at (181, 132) with width 39 and height 94.
; PLAN: r0=181(x), r1=132(y), r2=39(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 132
LDI r2, 39
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
