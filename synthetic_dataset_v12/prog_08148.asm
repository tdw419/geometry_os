; DESCRIPTION: Draws a purple rectangle at (252, 38) with width 29 and height 112.
; PLAN: r0=252(x), r1=38(y), r2=29(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 38
LDI r2, 29
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
