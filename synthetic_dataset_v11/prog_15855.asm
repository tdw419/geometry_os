; DESCRIPTION: Places a red line segment connecting (61, 95) to (48, 201).
; PLAN: r0=61(x1), r1=95(y1), r2=48(x2), r3=201(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 95
LDI r2, 48
LDI r3, 201
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
