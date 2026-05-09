; DESCRIPTION: Draws a purple rectangle at (122, 57) with width 81 and height 31.
; PLAN: r0=122(x), r1=57(y), r2=81(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 57
LDI r2, 81
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
