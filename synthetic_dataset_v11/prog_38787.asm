; DESCRIPTION: Draws a purple rectangle at (31, 169) with width 32 and height 36.
; PLAN: r0=31(x), r1=169(y), r2=32(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 169
LDI r2, 32
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
