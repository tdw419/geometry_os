; DESCRIPTION: Renders a blue line between points (208, 66) and (83, 79).
; PLAN: r0=208(x1), r1=66(y1), r2=83(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 66
LDI r2, 83
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
