; DESCRIPTION: Draws a purple rectangle at (241, 141) with width 67 and height 25.
; PLAN: r0=241(x), r1=141(y), r2=67(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 141
LDI r2, 67
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
