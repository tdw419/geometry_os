; DESCRIPTION: Draws a purple rectangle at (66, 132) with width 37 and height 21.
; PLAN: r0=66(x), r1=132(y), r2=37(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 132
LDI r2, 37
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
