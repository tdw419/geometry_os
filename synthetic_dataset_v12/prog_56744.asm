; DESCRIPTION: Draws a purple rectangle at (9, 118) with width 103 and height 72.
; PLAN: r0=9(x), r1=118(y), r2=103(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 118
LDI r2, 103
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
