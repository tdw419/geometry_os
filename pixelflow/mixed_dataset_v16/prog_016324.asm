; DESCRIPTION: Renders a purple box of size 88x106 starting at (93, 62).
; PLAN: r0=93(x), r1=62(y), r2=88(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 62
LDI r2, 88
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
