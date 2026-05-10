; DESCRIPTION: Places a black line segment connecting (245, 53) to (370, 34).
; PLAN: r0=245(x1), r1=53(y1), r2=370(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 53
LDI r2, 370
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
