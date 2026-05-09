; DESCRIPTION: Renders a purple box of size 100x98 starting at (115, 85).
; PLAN: r0=115(x), r1=85(y), r2=100(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 85
LDI r2, 100
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
