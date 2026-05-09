; DESCRIPTION: Places a red line segment connecting (15, 204) to (369, 221).
; PLAN: r0=15(x1), r1=204(y1), r2=369(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 204
LDI r2, 369
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
