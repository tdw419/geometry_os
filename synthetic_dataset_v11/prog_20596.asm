; DESCRIPTION: Draws a purple rectangle at (9, 141) with width 68 and height 114.
; PLAN: r0=9(x), r1=141(y), r2=68(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 141
LDI r2, 68
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
