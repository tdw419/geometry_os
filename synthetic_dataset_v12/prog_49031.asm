; DESCRIPTION: Places a black line segment connecting (54, 151) to (458, 92).
; PLAN: r0=54(x1), r1=151(y1), r2=458(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 151
LDI r2, 458
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
