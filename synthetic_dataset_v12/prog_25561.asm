; DESCRIPTION: Renders a yellow line between points (72, 157) and (314, 169).
; PLAN: r0=72(x1), r1=157(y1), r2=314(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 157
LDI r2, 314
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
