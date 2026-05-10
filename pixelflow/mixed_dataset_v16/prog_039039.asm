; DESCRIPTION: Draws a purple rectangle at (382, 91) with width 84 and height 119.
; PLAN: r0=382(x), r1=91(y), r2=84(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 91
LDI r2, 84
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
