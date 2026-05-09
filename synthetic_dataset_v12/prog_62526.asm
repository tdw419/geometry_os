; DESCRIPTION: Places a white line segment connecting (233, 133) to (78, 218).
; PLAN: r0=233(x1), r1=133(y1), r2=78(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 133
LDI r2, 78
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
