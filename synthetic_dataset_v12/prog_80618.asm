; DESCRIPTION: Places a blue line segment connecting (150, 181) to (250, 89).
; PLAN: r0=150(x1), r1=181(y1), r2=250(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 181
LDI r2, 250
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
