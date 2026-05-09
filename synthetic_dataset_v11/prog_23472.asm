; DESCRIPTION: Draws a purple rectangle at (150, 99) with width 99 and height 105.
; PLAN: r0=150(x), r1=99(y), r2=99(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 99
LDI r2, 99
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
