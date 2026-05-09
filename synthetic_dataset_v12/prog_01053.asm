; DESCRIPTION: Draws a purple line from (422, 109) to (52, 34).
; PLAN: r0=422(x1), r1=109(y1), r2=52(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 109
LDI r2, 52
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
