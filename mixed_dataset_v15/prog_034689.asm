; DESCRIPTION: Places a black line segment connecting (496, 218) to (393, 30).
; PLAN: r0=496(x1), r1=218(y1), r2=393(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 218
LDI r2, 393
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
