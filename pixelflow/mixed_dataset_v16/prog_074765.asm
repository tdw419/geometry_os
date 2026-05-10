; DESCRIPTION: Draws a purple rectangle at (160, 99) with width 105 and height 117.
; PLAN: r0=160(x), r1=99(y), r2=105(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 99
LDI r2, 105
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
