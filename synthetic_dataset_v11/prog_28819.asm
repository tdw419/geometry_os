; DESCRIPTION: Draws a blue line from (8, 147) to (136, 6).
; PLAN: r0=8(x1), r1=147(y1), r2=136(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 147
LDI r2, 136
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
