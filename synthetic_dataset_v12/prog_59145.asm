; DESCRIPTION: Places a blue line segment connecting (376, 254) to (378, 200).
; PLAN: r0=376(x1), r1=254(y1), r2=378(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 254
LDI r2, 378
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
