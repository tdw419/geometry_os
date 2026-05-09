; DESCRIPTION: Renders a blue line between points (508, 167) and (98, 201).
; PLAN: r0=508(x1), r1=167(y1), r2=98(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 167
LDI r2, 98
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
