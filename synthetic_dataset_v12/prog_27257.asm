; DESCRIPTION: Places a black line segment connecting (414, 110) to (271, 221).
; PLAN: r0=414(x1), r1=110(y1), r2=271(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 110
LDI r2, 271
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
