; DESCRIPTION: Renders a purple box of size 85x35 starting at (93, 2).
; PLAN: r0=93(x), r1=2(y), r2=85(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 2
LDI r2, 85
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
