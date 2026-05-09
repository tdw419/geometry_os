; DESCRIPTION: Draws a yellow line from (200, 36) to (47, 145).
; PLAN: r0=200(x1), r1=36(y1), r2=47(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 36
LDI r2, 47
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
