; DESCRIPTION: Draws a purple rectangle at (153, 144) with width 37 and height 84.
; PLAN: r0=153(x), r1=144(y), r2=37(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 144
LDI r2, 37
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
