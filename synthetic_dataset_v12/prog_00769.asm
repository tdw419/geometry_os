; DESCRIPTION: Places a red line segment connecting (314, 254) to (285, 192).
; PLAN: r0=314(x1), r1=254(y1), r2=285(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 254
LDI r2, 285
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
