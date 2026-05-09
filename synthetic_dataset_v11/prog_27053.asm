; DESCRIPTION: Draws a purple rectangle at (3, 127) with width 49 and height 17.
; PLAN: r0=3(x), r1=127(y), r2=49(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 127
LDI r2, 49
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
