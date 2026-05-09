; DESCRIPTION: Places a blue line segment connecting (31, 10) to (229, 149).
; PLAN: r0=31(x1), r1=10(y1), r2=229(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 10
LDI r2, 229
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
