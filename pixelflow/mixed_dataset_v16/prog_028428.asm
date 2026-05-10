; DESCRIPTION: Draws a purple rectangle at (93, 48) with width 88 and height 93.
; PLAN: r0=93(x), r1=48(y), r2=88(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 48
LDI r2, 88
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
