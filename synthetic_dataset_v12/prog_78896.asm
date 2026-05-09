; DESCRIPTION: Places a black line segment connecting (317, 80) to (14, 104).
; PLAN: r0=317(x1), r1=80(y1), r2=14(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 80
LDI r2, 14
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
