; DESCRIPTION: Draws a purple rectangle at (109, 172) with width 77 and height 66.
; PLAN: r0=109(x), r1=172(y), r2=77(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 172
LDI r2, 77
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
