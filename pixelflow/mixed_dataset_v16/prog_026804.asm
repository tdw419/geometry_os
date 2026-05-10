; DESCRIPTION: Renders a purple line between points (137, 101) and (66, 48).
; PLAN: r0=137(x1), r1=101(y1), r2=66(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 101
LDI r2, 66
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
