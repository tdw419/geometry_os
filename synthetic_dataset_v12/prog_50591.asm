; DESCRIPTION: Draws a purple rectangle at (129, 25) with width 17 and height 109.
; PLAN: r0=129(x), r1=25(y), r2=17(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 25
LDI r2, 17
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
