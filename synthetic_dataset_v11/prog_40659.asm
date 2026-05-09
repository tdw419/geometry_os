; DESCRIPTION: Draws a purple rectangle at (101, 45) with width 66 and height 21.
; PLAN: r0=101(x), r1=45(y), r2=66(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 45
LDI r2, 66
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
