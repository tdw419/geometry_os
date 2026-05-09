; DESCRIPTION: Renders a red line between points (247, 211) and (162, 201).
; PLAN: r0=247(x1), r1=211(y1), r2=162(x2), r3=201(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 211
LDI r2, 162
LDI r3, 201
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
