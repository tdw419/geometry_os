; DESCRIPTION: Draws a purple rectangle at (11, 119) with width 77 and height 68.
; PLAN: r0=11(x), r1=119(y), r2=77(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 119
LDI r2, 77
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
