; DESCRIPTION: Places a blue line segment connecting (100, 91) to (160, 44).
; PLAN: r0=100(x1), r1=91(y1), r2=160(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 91
LDI r2, 160
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
