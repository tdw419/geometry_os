; DESCRIPTION: Places a black line segment connecting (418, 64) to (112, 109).
; PLAN: r0=418(x1), r1=64(y1), r2=112(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 64
LDI r2, 112
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
