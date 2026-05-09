; DESCRIPTION: Places a blue line segment connecting (149, 4) to (3, 10).
; PLAN: r0=149(x1), r1=4(y1), r2=3(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 4
LDI r2, 3
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
