; DESCRIPTION: Places a red line segment connecting (185, 75) to (77, 141).
; PLAN: r0=185(x1), r1=75(y1), r2=77(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 75
LDI r2, 77
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
