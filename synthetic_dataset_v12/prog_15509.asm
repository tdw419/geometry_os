; DESCRIPTION: Places a blue line segment connecting (110, 194) to (11, 89).
; PLAN: r0=110(x1), r1=194(y1), r2=11(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 194
LDI r2, 11
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
