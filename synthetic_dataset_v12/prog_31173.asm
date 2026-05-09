; DESCRIPTION: Draws a purple rectangle at (105, 46) with width 26 and height 94.
; PLAN: r0=105(x), r1=46(y), r2=26(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 46
LDI r2, 26
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
