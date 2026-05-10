; DESCRIPTION: Places a purple line segment connecting (89, 63) to (13, 12).
; PLAN: r0=89(x1), r1=63(y1), r2=13(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 63
LDI r2, 13
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
