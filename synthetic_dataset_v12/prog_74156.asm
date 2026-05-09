; DESCRIPTION: Places a purple line segment connecting (350, 53) to (139, 69).
; PLAN: r0=350(x1), r1=53(y1), r2=139(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 53
LDI r2, 139
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
