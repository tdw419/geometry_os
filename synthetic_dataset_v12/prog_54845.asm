; DESCRIPTION: Renders a blue line between points (77, 200) and (55, 66).
; PLAN: r0=77(x1), r1=200(y1), r2=55(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 200
LDI r2, 55
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
