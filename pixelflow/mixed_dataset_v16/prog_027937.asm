; DESCRIPTION: Renders a purple line between points (425, 132) and (312, 14).
; PLAN: r0=425(x1), r1=132(y1), r2=312(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 132
LDI r2, 312
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
