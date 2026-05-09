; DESCRIPTION: Renders a purple line between points (365, 185) and (2, 97).
; PLAN: r0=365(x1), r1=185(y1), r2=2(x2), r3=97(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 185
LDI r2, 2
LDI r3, 97
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
