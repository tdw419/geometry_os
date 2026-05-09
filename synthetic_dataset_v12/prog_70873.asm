; DESCRIPTION: Places a blue line segment connecting (386, 2) to (378, 20).
; PLAN: r0=386(x1), r1=2(y1), r2=378(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 2
LDI r2, 378
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
