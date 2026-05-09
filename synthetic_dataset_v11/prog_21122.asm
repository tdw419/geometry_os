; DESCRIPTION: Renders a purple box of size 118x54 starting at (100, 163).
; PLAN: r0=100(x), r1=163(y), r2=118(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 163
LDI r2, 118
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
