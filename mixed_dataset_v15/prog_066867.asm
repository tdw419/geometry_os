; DESCRIPTION: Renders a purple rectangular region spanning 110 by 25 at (93, 89).
; PLAN: r0=93(x), r1=89(y), r2=110(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 89
LDI r2, 110
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
