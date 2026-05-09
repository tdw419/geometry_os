; DESCRIPTION: Draws a purple rectangle at (63, 161) with width 81 and height 44.
; PLAN: r0=63(x), r1=161(y), r2=81(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 161
LDI r2, 81
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
