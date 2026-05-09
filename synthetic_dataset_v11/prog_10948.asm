; DESCRIPTION: Draws a purple rectangle at (106, 117) with width 76 and height 94.
; PLAN: r0=106(x), r1=117(y), r2=76(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 117
LDI r2, 76
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
