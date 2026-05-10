; DESCRIPTION: Places a purple line segment connecting (100, 125) to (302, 106).
; PLAN: r0=100(x1), r1=125(y1), r2=302(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 125
LDI r2, 302
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
