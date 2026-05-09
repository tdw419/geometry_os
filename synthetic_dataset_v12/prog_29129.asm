; DESCRIPTION: Draws a purple rectangle at (258, 171) with width 118 and height 66.
; PLAN: r0=258(x), r1=171(y), r2=118(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 171
LDI r2, 118
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
