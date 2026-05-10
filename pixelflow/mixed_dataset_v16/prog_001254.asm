; DESCRIPTION: Draws a purple rectangle at (18, 105) with width 112 and height 63.
; PLAN: r0=18(x), r1=105(y), r2=112(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 105
LDI r2, 112
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
