; DESCRIPTION: Draws a purple rectangle at (425, 56) with width 66 and height 62.
; PLAN: r0=425(x), r1=56(y), r2=66(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 56
LDI r2, 66
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
