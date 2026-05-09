; DESCRIPTION: Draws a purple rectangle at (28, 58) with width 118 and height 68.
; PLAN: r0=28(x), r1=58(y), r2=118(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 58
LDI r2, 118
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
