; DESCRIPTION: Draws a purple rectangle at (319, 31) with width 75 and height 35.
; PLAN: r0=319(x), r1=31(y), r2=75(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 31
LDI r2, 75
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
