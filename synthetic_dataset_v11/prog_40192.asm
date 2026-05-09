; DESCRIPTION: Draws a blue line from (124, 10) to (147, 23).
; PLAN: r0=124(x1), r1=10(y1), r2=147(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 10
LDI r2, 147
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
