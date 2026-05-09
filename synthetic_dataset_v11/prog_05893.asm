; DESCRIPTION: Renders a yellow line between points (112, 118) and (24, 46).
; PLAN: r0=112(x1), r1=118(y1), r2=24(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 118
LDI r2, 24
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
