; DESCRIPTION: Renders a blue line between points (508, 156) and (17, 233).
; PLAN: r0=508(x1), r1=156(y1), r2=17(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 156
LDI r2, 17
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
