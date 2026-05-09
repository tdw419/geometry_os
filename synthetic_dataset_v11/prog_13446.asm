; DESCRIPTION: Renders a red line between points (77, 38) and (148, 124).
; PLAN: r0=77(x1), r1=38(y1), r2=148(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 38
LDI r2, 148
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
