; DESCRIPTION: Renders a yellow line between points (163, 35) and (4, 218).
; PLAN: r0=163(x1), r1=35(y1), r2=4(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 35
LDI r2, 4
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
