; DESCRIPTION: Draws a purple rectangle at (248, 142) with width 81 and height 109.
; PLAN: r0=248(x), r1=142(y), r2=81(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 142
LDI r2, 81
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
