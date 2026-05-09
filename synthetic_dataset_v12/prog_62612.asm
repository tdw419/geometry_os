; DESCRIPTION: Places a yellow line segment connecting (300, 137) to (348, 124).
; PLAN: r0=300(x1), r1=137(y1), r2=348(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 137
LDI r2, 348
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
