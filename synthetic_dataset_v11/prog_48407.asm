; DESCRIPTION: Renders a purple line between points (247, 94) and (36, 191).
; PLAN: r0=247(x1), r1=94(y1), r2=36(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 94
LDI r2, 36
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
