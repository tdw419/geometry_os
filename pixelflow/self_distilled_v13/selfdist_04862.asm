; DESCRIPTION: Renders a purple line segment connecting (236, 124) to (114, 89).
; PLAN: r0=236(x1), r1=124(y1), r2=114(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 124
LDI r2, 114
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
