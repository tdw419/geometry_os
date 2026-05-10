; DESCRIPTION: Draws a purple rectangle at (260, 77) with width 94 and height 96.
; PLAN: r0=260(x), r1=77(y), r2=94(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 77
LDI r2, 94
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
