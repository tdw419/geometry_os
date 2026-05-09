; DESCRIPTION: Draws a purple rectangle at (94, 196) with width 110 and height 34.
; PLAN: r0=94(x), r1=196(y), r2=110(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 196
LDI r2, 110
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
