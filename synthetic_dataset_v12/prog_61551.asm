; DESCRIPTION: Draws a yellow line from (331, 217) to (199, 77).
; PLAN: r0=331(x1), r1=217(y1), r2=199(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 217
LDI r2, 199
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
