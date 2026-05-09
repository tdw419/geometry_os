; DESCRIPTION: Draws a purple rectangle at (211, 36) with width 87 and height 101.
; PLAN: r0=211(x), r1=36(y), r2=87(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 36
LDI r2, 87
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
