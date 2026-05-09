; DESCRIPTION: Draws a purple rectangle at (15, 49) with width 117 and height 45.
; PLAN: r0=15(x), r1=49(y), r2=117(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 49
LDI r2, 117
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
