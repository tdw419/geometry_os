; DESCRIPTION: Draws a purple rectangle at (117, 201) with width 18 and height 32.
; PLAN: r0=117(x), r1=201(y), r2=18(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 201
LDI r2, 18
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
