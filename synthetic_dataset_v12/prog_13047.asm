; DESCRIPTION: Renders a yellow line between points (437, 8) and (177, 123).
; PLAN: r0=437(x1), r1=8(y1), r2=177(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 8
LDI r2, 177
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
