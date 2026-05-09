; DESCRIPTION: Places a black line segment connecting (508, 218) to (454, 222).
; PLAN: r0=508(x1), r1=218(y1), r2=454(x2), r3=222(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 218
LDI r2, 454
LDI r3, 222
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
