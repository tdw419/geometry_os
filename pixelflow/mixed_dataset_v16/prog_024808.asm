; DESCRIPTION: Places a red line segment connecting (420, 147) to (76, 247).
; PLAN: r0=420(x1), r1=147(y1), r2=76(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 147
LDI r2, 76
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
