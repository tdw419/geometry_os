; DESCRIPTION: Renders a purple box of size 49x15 starting at (93, 123).
; PLAN: r0=93(x), r1=123(y), r2=49(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 123
LDI r2, 49
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
