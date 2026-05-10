; DESCRIPTION: Renders a yellow line between points (227, 198) and (181, 149).
; PLAN: r0=227(x1), r1=198(y1), r2=181(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 198
LDI r2, 181
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
