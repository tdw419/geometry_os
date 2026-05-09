; DESCRIPTION: Renders a red line between points (490, 201) and (317, 189).
; PLAN: r0=490(x1), r1=201(y1), r2=317(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 201
LDI r2, 317
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
