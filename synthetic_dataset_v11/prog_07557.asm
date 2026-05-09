; DESCRIPTION: Places a black line segment connecting (245, 57) to (62, 85).
; PLAN: r0=245(x1), r1=57(y1), r2=62(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 57
LDI r2, 62
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
