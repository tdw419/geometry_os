; DESCRIPTION: Draws a purple rectangle at (172, 105) with width 37 and height 91.
; PLAN: r0=172(x), r1=105(y), r2=37(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 105
LDI r2, 37
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
