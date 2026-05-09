; DESCRIPTION: Draws a purple rectangle at (44, 50) with width 105 and height 54.
; PLAN: r0=44(x), r1=50(y), r2=105(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 50
LDI r2, 105
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
