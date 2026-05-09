; DESCRIPTION: Places a yellow line segment connecting (47, 38) to (245, 200).
; PLAN: r0=47(x1), r1=38(y1), r2=245(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 38
LDI r2, 245
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
