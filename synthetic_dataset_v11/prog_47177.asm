; DESCRIPTION: Draws a purple rectangle at (5, 201) with width 74 and height 53.
; PLAN: r0=5(x), r1=201(y), r2=74(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 201
LDI r2, 74
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
