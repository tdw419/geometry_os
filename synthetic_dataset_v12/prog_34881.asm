; DESCRIPTION: Renders a red line between points (482, 77) and (369, 106).
; PLAN: r0=482(x1), r1=77(y1), r2=369(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 77
LDI r2, 369
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
