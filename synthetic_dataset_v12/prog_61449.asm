; DESCRIPTION: Places a black line segment connecting (189, 218) to (341, 220).
; PLAN: r0=189(x1), r1=218(y1), r2=341(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 218
LDI r2, 341
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
