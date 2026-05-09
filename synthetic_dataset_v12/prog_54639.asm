; DESCRIPTION: Places a black line segment connecting (438, 153) to (419, 233).
; PLAN: r0=438(x1), r1=153(y1), r2=419(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 153
LDI r2, 419
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
