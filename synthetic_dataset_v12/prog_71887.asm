; DESCRIPTION: Renders a yellow line between points (169, 68) and (225, 49).
; PLAN: r0=169(x1), r1=68(y1), r2=225(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 68
LDI r2, 225
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
