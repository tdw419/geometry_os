; DESCRIPTION: Draws a purple rectangle at (339, 72) with width 90 and height 14.
; PLAN: r0=339(x), r1=72(y), r2=90(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 72
LDI r2, 90
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
