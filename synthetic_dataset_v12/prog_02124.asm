; DESCRIPTION: Draws a purple rectangle at (301, 119) with width 13 and height 118.
; PLAN: r0=301(x), r1=119(y), r2=13(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 119
LDI r2, 13
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
