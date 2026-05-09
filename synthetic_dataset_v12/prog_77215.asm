; DESCRIPTION: Renders a blue line between points (115, 119) and (321, 44).
; PLAN: r0=115(x1), r1=119(y1), r2=321(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 119
LDI r2, 321
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
