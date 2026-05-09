; DESCRIPTION: Places a purple line segment connecting (45, 47) to (91, 1).
; PLAN: r0=45(x1), r1=47(y1), r2=91(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 47
LDI r2, 91
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
