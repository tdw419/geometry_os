; DESCRIPTION: Draws a purple line from (199, 52) to (124, 3).
; PLAN: r0=199(x1), r1=52(y1), r2=124(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 52
LDI r2, 124
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
