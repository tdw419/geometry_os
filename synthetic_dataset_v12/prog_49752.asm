; DESCRIPTION: Draws a purple rectangle at (34, 55) with width 30 and height 98.
; PLAN: r0=34(x), r1=55(y), r2=30(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 55
LDI r2, 30
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
