; DESCRIPTION: Draws a blue line from (147, 74) to (99, 109).
; PLAN: r0=147(x1), r1=74(y1), r2=99(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 74
LDI r2, 99
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
