; DESCRIPTION: Renders a orange line between points (53, 3) and (382, 201).
; PLAN: r0=53(x1), r1=3(y1), r2=382(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 3
LDI r2, 382
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
