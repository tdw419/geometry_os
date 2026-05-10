; DESCRIPTION: Draws a purple rectangle at (486, 141) with width 19 and height 14.
; PLAN: r0=486(x), r1=141(y), r2=19(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 141
LDI r2, 19
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
