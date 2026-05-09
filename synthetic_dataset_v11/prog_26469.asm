; DESCRIPTION: Renders a yellow line between points (133, 223) and (56, 25).
; PLAN: r0=133(x1), r1=223(y1), r2=56(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 223
LDI r2, 56
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
