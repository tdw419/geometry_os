; DESCRIPTION: Places a black line segment connecting (85, 218) to (313, 199).
; PLAN: r0=85(x1), r1=218(y1), r2=313(x2), r3=199(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 218
LDI r2, 313
LDI r3, 199
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
