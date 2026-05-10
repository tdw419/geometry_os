; DESCRIPTION: Places a red line segment connecting (442, 169) to (186, 11).
; PLAN: r0=442(x1), r1=169(y1), r2=186(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 169
LDI r2, 186
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
