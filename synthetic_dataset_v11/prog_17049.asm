; DESCRIPTION: Places a red line segment connecting (78, 218) to (233, 16).
; PLAN: r0=78(x1), r1=218(y1), r2=233(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 218
LDI r2, 233
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
