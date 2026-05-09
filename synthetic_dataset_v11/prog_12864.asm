; DESCRIPTION: Draws a purple rectangle at (119, 34) with width 40 and height 71.
; PLAN: r0=119(x), r1=34(y), r2=40(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 34
LDI r2, 40
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
