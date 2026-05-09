; DESCRIPTION: Renders a purple line between points (90, 26) and (250, 191).
; PLAN: r0=90(x1), r1=26(y1), r2=250(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 26
LDI r2, 250
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
