; DESCRIPTION: Renders a yellow line between points (188, 22) and (204, 34).
; PLAN: r0=188(x1), r1=22(y1), r2=204(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 22
LDI r2, 204
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
