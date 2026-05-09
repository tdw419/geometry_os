; DESCRIPTION: Renders a yellow line between points (83, 162) and (73, 133).
; PLAN: r0=83(x1), r1=162(y1), r2=73(x2), r3=133(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 162
LDI r2, 73
LDI r3, 133
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
