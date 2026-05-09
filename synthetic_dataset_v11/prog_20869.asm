; DESCRIPTION: Draws a purple rectangle at (99, 30) with width 118 and height 113.
; PLAN: r0=99(x), r1=30(y), r2=118(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 30
LDI r2, 118
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
