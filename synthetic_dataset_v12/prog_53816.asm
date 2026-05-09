; DESCRIPTION: Renders a white line between points (34, 101) and (423, 218).
; PLAN: r0=34(x1), r1=101(y1), r2=423(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 101
LDI r2, 423
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
