; DESCRIPTION: Draws a purple rectangle at (319, 149) with width 69 and height 52.
; PLAN: r0=319(x), r1=149(y), r2=69(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 149
LDI r2, 69
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
