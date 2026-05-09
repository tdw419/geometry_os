; DESCRIPTION: Draws a purple rectangle at (364, 96) with width 114 and height 75.
; PLAN: r0=364(x), r1=96(y), r2=114(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 96
LDI r2, 114
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
