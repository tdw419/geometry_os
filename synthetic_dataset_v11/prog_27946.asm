; DESCRIPTION: Renders a black line between points (169, 97) and (129, 205).
; PLAN: r0=169(x1), r1=97(y1), r2=129(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 97
LDI r2, 129
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
