; DESCRIPTION: Draws a purple rectangle at (268, 119) with width 39 and height 83.
; PLAN: r0=268(x), r1=119(y), r2=39(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 119
LDI r2, 39
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
