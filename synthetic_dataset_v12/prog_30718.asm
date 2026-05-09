; DESCRIPTION: Renders a purple line between points (312, 97) and (263, 204).
; PLAN: r0=312(x1), r1=97(y1), r2=263(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 97
LDI r2, 263
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
