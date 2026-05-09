; DESCRIPTION: Places a red line segment connecting (373, 6) to (119, 88).
; PLAN: r0=373(x1), r1=6(y1), r2=119(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 6
LDI r2, 119
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
