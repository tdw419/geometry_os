; DESCRIPTION: Draws a purple rectangle at (266, 144) with width 31 and height 97.
; PLAN: r0=266(x), r1=144(y), r2=31(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 144
LDI r2, 31
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
