; DESCRIPTION: Places a red line segment connecting (463, 50) to (29, 185).
; PLAN: r0=463(x1), r1=50(y1), r2=29(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 50
LDI r2, 29
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
