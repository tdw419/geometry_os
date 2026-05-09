; DESCRIPTION: Composite: . Then Draws a purple line from (252, 85) to (101, 182). Then Creates a black circular shape at (52, 24) with radius 10.
; PLAN: r0=252(x1), r1=85(y1), r2=101(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=52(x), r1=24(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a purple line from (252, 85) to (101, 182).
; PLAN: r0=252(x1), r1=85(y1), r2=101(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 85
LDI r2, 101
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (52, 24) with radius 10.
; PLAN: r0=52(x), r1=24(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 24
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
