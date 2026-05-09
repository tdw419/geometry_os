; DESCRIPTION: Renders a purple line between points (489, 52) and (73, 191).
; PLAN: r0=489(x1), r1=52(y1), r2=73(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 52
LDI r2, 73
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
