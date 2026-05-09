; DESCRIPTION: Renders a purple line between points (208, 112) and (345, 13).
; PLAN: r0=208(x1), r1=112(y1), r2=345(x2), r3=13(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 112
LDI r2, 345
LDI r3, 13
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
