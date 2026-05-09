; DESCRIPTION: Renders a red line between points (124, 99) and (71, 112).
; PLAN: r0=124(x1), r1=99(y1), r2=71(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 99
LDI r2, 71
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
