; DESCRIPTION: Draws a purple rectangle at (26, 114) with width 26 and height 40.
; PLAN: r0=26(x), r1=114(y), r2=26(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 114
LDI r2, 26
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
