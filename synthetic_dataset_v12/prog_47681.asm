; DESCRIPTION: Renders a red line between points (413, 9) and (369, 71).
; PLAN: r0=413(x1), r1=9(y1), r2=369(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 9
LDI r2, 369
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
