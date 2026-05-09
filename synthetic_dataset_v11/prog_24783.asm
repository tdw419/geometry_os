; DESCRIPTION: Draws a purple rectangle at (144, 0) with width 34 and height 26.
; PLAN: r0=144(x), r1=0(y), r2=34(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 0
LDI r2, 34
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
