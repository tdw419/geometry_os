; DESCRIPTION: Places a green line segment connecting (84, 169) to (324, 77).
; PLAN: r0=84(x1), r1=169(y1), r2=324(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 169
LDI r2, 324
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
