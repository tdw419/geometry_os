; DESCRIPTION: Draws a purple rectangle at (203, 75) with width 31 and height 39.
; PLAN: r0=203(x), r1=75(y), r2=31(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 75
LDI r2, 31
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
