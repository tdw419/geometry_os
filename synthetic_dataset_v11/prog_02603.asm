; DESCRIPTION: Renders a blue line between points (77, 82) and (201, 204).
; PLAN: r0=77(x1), r1=82(y1), r2=201(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 82
LDI r2, 201
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
