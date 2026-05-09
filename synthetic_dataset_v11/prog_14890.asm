; DESCRIPTION: Renders a purple line between points (181, 177) and (73, 191).
; PLAN: r0=181(x1), r1=177(y1), r2=73(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 177
LDI r2, 73
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
