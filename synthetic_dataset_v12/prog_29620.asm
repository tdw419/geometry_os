; DESCRIPTION: Places a black line segment connecting (139, 218) to (187, 250).
; PLAN: r0=139(x1), r1=218(y1), r2=187(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 218
LDI r2, 187
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
