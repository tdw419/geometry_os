; DESCRIPTION: Draws a purple rectangle at (12, 135) with width 118 and height 28.
; PLAN: r0=12(x), r1=135(y), r2=118(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 135
LDI r2, 118
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
