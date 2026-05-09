; DESCRIPTION: Places a red line segment connecting (136, 78) to (3, 247).
; PLAN: r0=136(x1), r1=78(y1), r2=3(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 78
LDI r2, 3
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
