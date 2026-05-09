; DESCRIPTION: Renders a yellow line between points (395, 119) and (193, 223).
; PLAN: r0=395(x1), r1=119(y1), r2=193(x2), r3=223(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 119
LDI r2, 193
LDI r3, 223
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
