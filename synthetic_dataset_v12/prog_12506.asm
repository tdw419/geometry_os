; DESCRIPTION: Places a yellow line segment connecting (424, 218) to (30, 96).
; PLAN: r0=424(x1), r1=218(y1), r2=30(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 218
LDI r2, 30
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
