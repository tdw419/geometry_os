; DESCRIPTION: Renders a red line between points (192, 124) and (314, 245).
; PLAN: r0=192(x1), r1=124(y1), r2=314(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 124
LDI r2, 314
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
