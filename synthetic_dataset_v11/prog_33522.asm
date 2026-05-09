; DESCRIPTION: Draws a purple rectangle at (93, 40) with width 116 and height 87.
; PLAN: r0=93(x), r1=40(y), r2=116(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 40
LDI r2, 116
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
