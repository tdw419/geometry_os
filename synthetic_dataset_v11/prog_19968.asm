; DESCRIPTION: Places a blue line segment connecting (147, 254) to (37, 63).
; PLAN: r0=147(x1), r1=254(y1), r2=37(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 254
LDI r2, 37
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
