; DESCRIPTION: Renders a red line segment connecting (323, 81) to (199, 170).
; PLAN: r0=323(x1), r1=81(y1), r2=199(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 81
LDI r2, 199
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
