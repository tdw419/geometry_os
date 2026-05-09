; DESCRIPTION: Renders a purple line between points (85, 65) and (331, 8).
; PLAN: r0=85(x1), r1=65(y1), r2=331(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 65
LDI r2, 331
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
