; DESCRIPTION: Places a red line segment connecting (435, 123) to (343, 48).
; PLAN: r0=435(x1), r1=123(y1), r2=343(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 123
LDI r2, 343
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
