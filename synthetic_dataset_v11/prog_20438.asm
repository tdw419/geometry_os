; DESCRIPTION: Renders a yellow line between points (101, 200) and (11, 218).
; PLAN: r0=101(x1), r1=200(y1), r2=11(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 200
LDI r2, 11
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
