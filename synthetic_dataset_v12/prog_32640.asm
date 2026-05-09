; DESCRIPTION: Draws a purple rectangle at (20, 77) with width 117 and height 99.
; PLAN: r0=20(x), r1=77(y), r2=117(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 77
LDI r2, 117
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
