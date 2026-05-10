; DESCRIPTION: Places a purple line segment connecting (300, 212) to (321, 200).
; PLAN: r0=300(x1), r1=212(y1), r2=321(x2), r3=200(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 212
LDI r2, 321
LDI r3, 200
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
