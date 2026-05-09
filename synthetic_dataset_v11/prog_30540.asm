; DESCRIPTION: Renders a purple line between points (195, 34) and (193, 9).
; PLAN: r0=195(x1), r1=34(y1), r2=193(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 34
LDI r2, 193
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
