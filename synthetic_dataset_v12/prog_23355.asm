; DESCRIPTION: Renders a blue line between points (468, 169) and (66, 82).
; PLAN: r0=468(x1), r1=169(y1), r2=66(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 169
LDI r2, 66
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
