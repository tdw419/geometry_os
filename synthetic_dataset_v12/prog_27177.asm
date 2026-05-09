; DESCRIPTION: Renders a purple line between points (422, 31) and (490, 23).
; PLAN: r0=422(x1), r1=31(y1), r2=490(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 31
LDI r2, 490
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
