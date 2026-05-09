; DESCRIPTION: Places a red line segment connecting (115, 115) to (474, 105).
; PLAN: r0=115(x1), r1=115(y1), r2=474(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 115
LDI r2, 474
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
