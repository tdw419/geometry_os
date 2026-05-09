; DESCRIPTION: Places a yellow line segment connecting (133, 77) to (335, 64).
; PLAN: r0=133(x1), r1=77(y1), r2=335(x2), r3=64(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 77
LDI r2, 335
LDI r3, 64
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
