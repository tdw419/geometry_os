; DESCRIPTION: Draws a blue line from (179, 147) to (134, 30).
; PLAN: r0=179(x1), r1=147(y1), r2=134(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 147
LDI r2, 134
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
