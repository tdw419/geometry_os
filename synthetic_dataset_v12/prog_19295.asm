; DESCRIPTION: Renders a purple box of size 12x58 starting at (484, 31).
; PLAN: r0=484(x), r1=31(y), r2=12(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 31
LDI r2, 12
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
