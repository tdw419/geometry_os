; DESCRIPTION: Draws a purple rectangle at (172, 58) with width 75 and height 118.
; PLAN: r0=172(x), r1=58(y), r2=75(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 58
LDI r2, 75
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
