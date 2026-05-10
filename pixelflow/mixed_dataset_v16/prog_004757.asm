; DESCRIPTION: Draws a purple rectangle at (24, 60) with width 22 and height 25.
; PLAN: r0=24(x), r1=60(y), r2=22(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 60
LDI r2, 22
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
