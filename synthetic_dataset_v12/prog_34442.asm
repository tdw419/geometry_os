; DESCRIPTION: Renders a yellow line between points (169, 53) and (64, 77).
; PLAN: r0=169(x1), r1=53(y1), r2=64(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 53
LDI r2, 64
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
