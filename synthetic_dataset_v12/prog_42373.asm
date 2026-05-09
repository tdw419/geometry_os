; DESCRIPTION: Draws a purple rectangle at (455, 66) with width 18 and height 26.
; PLAN: r0=455(x), r1=66(y), r2=18(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 66
LDI r2, 18
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
