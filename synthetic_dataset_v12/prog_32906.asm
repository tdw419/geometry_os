; DESCRIPTION: Renders a black line between points (2, 81) and (428, 201).
; PLAN: r0=2(x1), r1=81(y1), r2=428(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 81
LDI r2, 428
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
