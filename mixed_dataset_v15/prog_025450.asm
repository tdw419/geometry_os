; DESCRIPTION: Renders a red line between points (8, 200) and (369, 221).
; PLAN: r0=8(x1), r1=200(y1), r2=369(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 200
LDI r2, 369
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
