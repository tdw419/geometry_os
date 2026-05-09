; DESCRIPTION: Draws a purple rectangle at (25, 136) with width 91 and height 53.
; PLAN: r0=25(x), r1=136(y), r2=91(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 136
LDI r2, 91
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
