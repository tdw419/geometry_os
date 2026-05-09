; DESCRIPTION: Places a purple line segment connecting (204, 14) to (199, 6).
; PLAN: r0=204(x1), r1=14(y1), r2=199(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 14
LDI r2, 199
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
