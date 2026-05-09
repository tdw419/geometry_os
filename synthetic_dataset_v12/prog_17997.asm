; DESCRIPTION: Places a red line segment connecting (356, 112) to (414, 86).
; PLAN: r0=356(x1), r1=112(y1), r2=414(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 112
LDI r2, 414
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
