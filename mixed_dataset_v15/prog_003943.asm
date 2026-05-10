; DESCRIPTION: Places a red line segment connecting (312, 154) to (356, 140).
; PLAN: r0=312(x1), r1=154(y1), r2=356(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 154
LDI r2, 356
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
