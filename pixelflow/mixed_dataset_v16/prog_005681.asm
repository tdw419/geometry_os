; DESCRIPTION: Places a white line segment connecting (85, 158) to (474, 47).
; PLAN: r0=85(x1), r1=158(y1), r2=474(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 158
LDI r2, 474
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
