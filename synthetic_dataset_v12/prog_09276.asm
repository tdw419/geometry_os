; DESCRIPTION: Draws a blue line from (227, 179) to (414, 119).
; PLAN: r0=227(x1), r1=179(y1), r2=414(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 179
LDI r2, 414
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
