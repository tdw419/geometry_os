; DESCRIPTION: Renders a green line between points (484, 34) and (335, 55).
; PLAN: r0=484(x1), r1=34(y1), r2=335(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 34
LDI r2, 335
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
