; DESCRIPTION: Places a black line segment connecting (400, 218) to (452, 9).
; PLAN: r0=400(x1), r1=218(y1), r2=452(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 218
LDI r2, 452
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
