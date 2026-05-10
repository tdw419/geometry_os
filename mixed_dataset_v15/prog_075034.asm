; DESCRIPTION: Places a black line segment connecting (451, 145) to (452, 47).
; PLAN: r0=451(x1), r1=145(y1), r2=452(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 145
LDI r2, 452
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
