; DESCRIPTION: Renders a yellow line between points (163, 229) and (227, 46).
; PLAN: r0=163(x1), r1=229(y1), r2=227(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 229
LDI r2, 227
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
