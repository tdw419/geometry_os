; DESCRIPTION: Renders a black line between points (54, 80) and (89, 218).
; PLAN: r0=54(x1), r1=80(y1), r2=89(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 80
LDI r2, 89
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
