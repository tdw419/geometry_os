; DESCRIPTION: Renders a blue line between points (437, 87) and (312, 147).
; PLAN: r0=437(x1), r1=87(y1), r2=312(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 87
LDI r2, 312
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
