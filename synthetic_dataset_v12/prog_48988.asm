; DESCRIPTION: Places a blue line segment connecting (323, 62) to (110, 64).
; PLAN: r0=323(x1), r1=62(y1), r2=110(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 62
LDI r2, 110
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
