; DESCRIPTION: Places a blue line segment connecting (84, 156) to (147, 82).
; PLAN: r0=84(x1), r1=156(y1), r2=147(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 156
LDI r2, 147
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
