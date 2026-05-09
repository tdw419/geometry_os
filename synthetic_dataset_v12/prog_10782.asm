; DESCRIPTION: Draws a purple rectangle at (347, 30) with width 94 and height 32.
; PLAN: r0=347(x), r1=30(y), r2=94(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 30
LDI r2, 94
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
