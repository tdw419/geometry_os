; DESCRIPTION: Places a purple line segment connecting (5, 131) to (69, 4).
; PLAN: r0=5(x1), r1=131(y1), r2=69(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 131
LDI r2, 69
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
