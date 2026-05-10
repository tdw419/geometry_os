; DESCRIPTION: Places a yellow line segment connecting (20, 251) to (403, 77).
; PLAN: r0=20(x1), r1=251(y1), r2=403(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 251
LDI r2, 403
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
