; DESCRIPTION: Draws a purple rectangle at (311, 143) with width 97 and height 35.
; PLAN: r0=311(x), r1=143(y), r2=97(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 143
LDI r2, 97
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
