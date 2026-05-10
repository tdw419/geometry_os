; DESCRIPTION: Places a red line segment connecting (93, 88) to (373, 117).
; PLAN: r0=93(x1), r1=88(y1), r2=373(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 88
LDI r2, 373
LDI r3, 117
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
