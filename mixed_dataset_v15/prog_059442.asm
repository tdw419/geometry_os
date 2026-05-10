; DESCRIPTION: Renders a blue line between points (140, 221) and (201, 145).
; PLAN: r0=140(x1), r1=221(y1), r2=201(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 221
LDI r2, 201
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
