; DESCRIPTION: Draws a purple rectangle at (135, 124) with width 118 and height 105.
; PLAN: r0=135(x), r1=124(y), r2=118(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 124
LDI r2, 118
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
