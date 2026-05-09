; DESCRIPTION: Places a blue line segment connecting (166, 62) to (83, 147).
; PLAN: r0=166(x1), r1=62(y1), r2=83(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 62
LDI r2, 83
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
