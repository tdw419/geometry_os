; DESCRIPTION: Draws a blue line from (141, 169) to (399, 77).
; PLAN: r0=141(x1), r1=169(y1), r2=399(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 169
LDI r2, 399
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
