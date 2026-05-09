; DESCRIPTION: Draws a purple rectangle at (109, 142) with width 84 and height 44.
; PLAN: r0=109(x), r1=142(y), r2=84(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 142
LDI r2, 84
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
