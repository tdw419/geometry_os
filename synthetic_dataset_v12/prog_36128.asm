; DESCRIPTION: Places a black line segment connecting (62, 150) to (84, 31).
; PLAN: r0=62(x1), r1=150(y1), r2=84(x2), r3=31(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 150
LDI r2, 84
LDI r3, 31
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
