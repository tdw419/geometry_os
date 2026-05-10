; DESCRIPTION: Renders a red line between points (400, 77) and (447, 137).
; PLAN: r0=400(x1), r1=77(y1), r2=447(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 77
LDI r2, 447
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
