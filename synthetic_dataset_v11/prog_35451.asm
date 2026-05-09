; DESCRIPTION: Draws a blue line from (149, 147) to (63, 100).
; PLAN: r0=149(x1), r1=147(y1), r2=63(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 147
LDI r2, 63
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
