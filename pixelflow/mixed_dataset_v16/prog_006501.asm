; DESCRIPTION: Places a blue line segment connecting (151, 89) to (408, 105).
; PLAN: r0=151(x1), r1=89(y1), r2=408(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 89
LDI r2, 408
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
