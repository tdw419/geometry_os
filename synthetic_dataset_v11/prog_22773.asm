; DESCRIPTION: Draws a purple rectangle at (80, 106) with width 17 and height 117.
; PLAN: r0=80(x), r1=106(y), r2=17(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 106
LDI r2, 17
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
