; DESCRIPTION: Places a red line segment connecting (289, 229) to (141, 218).
; PLAN: r0=289(x1), r1=229(y1), r2=141(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 229
LDI r2, 141
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
