; DESCRIPTION: Renders a purple line between points (247, 250) and (468, 89).
; PLAN: r0=247(x1), r1=250(y1), r2=468(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 250
LDI r2, 468
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
