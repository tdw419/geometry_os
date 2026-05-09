; DESCRIPTION: Places a black line segment connecting (129, 92) to (87, 11).
; PLAN: r0=129(x1), r1=92(y1), r2=87(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 92
LDI r2, 87
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
