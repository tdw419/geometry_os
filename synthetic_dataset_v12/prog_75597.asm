; DESCRIPTION: Places a blue line segment connecting (263, 85) to (147, 212).
; PLAN: r0=263(x1), r1=85(y1), r2=147(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 85
LDI r2, 147
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
