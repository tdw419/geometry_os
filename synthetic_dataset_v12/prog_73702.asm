; DESCRIPTION: Draws a purple rectangle at (46, 86) with width 105 and height 86.
; PLAN: r0=46(x), r1=86(y), r2=105(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 86
LDI r2, 105
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
