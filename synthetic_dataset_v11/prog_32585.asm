; DESCRIPTION: Draws a purple rectangle at (193, 11) with width 43 and height 112.
; PLAN: r0=193(x), r1=11(y), r2=43(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 11
LDI r2, 43
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
