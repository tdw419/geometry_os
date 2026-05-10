; DESCRIPTION: Draws a purple rectangle at (106, 124) with width 101 and height 61.
; PLAN: r0=106(x), r1=124(y), r2=101(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 124
LDI r2, 101
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
