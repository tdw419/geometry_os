; DESCRIPTION: Renders a purple box of size 15x106 starting at (54, 93).
; PLAN: r0=54(x), r1=93(y), r2=15(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 93
LDI r2, 15
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
