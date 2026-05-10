; DESCRIPTION: Places a black line segment connecting (458, 54) to (314, 32).
; PLAN: r0=458(x1), r1=54(y1), r2=314(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 54
LDI r2, 314
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
