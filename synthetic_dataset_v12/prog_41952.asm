; DESCRIPTION: Renders a black line between points (169, 139) and (46, 112).
; PLAN: r0=169(x1), r1=139(y1), r2=46(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 139
LDI r2, 46
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
