; DESCRIPTION: Draws a purple rectangle at (230, 13) with width 116 and height 49.
; PLAN: r0=230(x), r1=13(y), r2=116(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 13
LDI r2, 116
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
