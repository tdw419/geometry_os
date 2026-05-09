; DESCRIPTION: Draws a purple line from (205, 218) to (11, 77).
; PLAN: r0=205(x1), r1=218(y1), r2=11(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 218
LDI r2, 11
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
