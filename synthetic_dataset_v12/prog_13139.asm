; DESCRIPTION: Draws a purple rectangle at (170, 132) with width 37 and height 61.
; PLAN: r0=170(x), r1=132(y), r2=37(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 132
LDI r2, 37
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
