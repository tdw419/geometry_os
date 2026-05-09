; DESCRIPTION: Renders a blue line between points (31, 201) and (336, 101).
; PLAN: r0=31(x1), r1=201(y1), r2=336(x2), r3=101(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 201
LDI r2, 336
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
