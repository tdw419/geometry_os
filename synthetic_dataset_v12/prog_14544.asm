; DESCRIPTION: Places a red line segment connecting (95, 169) to (474, 132).
; PLAN: r0=95(x1), r1=169(y1), r2=474(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 169
LDI r2, 474
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
