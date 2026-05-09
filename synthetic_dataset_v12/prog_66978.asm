; DESCRIPTION: Places a red line segment connecting (413, 13) to (435, 106).
; PLAN: r0=413(x1), r1=13(y1), r2=435(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 13
LDI r2, 435
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
