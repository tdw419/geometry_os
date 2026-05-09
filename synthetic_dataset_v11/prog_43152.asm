; DESCRIPTION: Places a blue line segment connecting (250, 4) to (11, 91).
; PLAN: r0=250(x1), r1=4(y1), r2=11(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 4
LDI r2, 11
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
