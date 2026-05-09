; DESCRIPTION: Renders a red line between points (414, 237) and (129, 77).
; PLAN: r0=414(x1), r1=237(y1), r2=129(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 237
LDI r2, 129
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
