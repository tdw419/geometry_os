; DESCRIPTION: Places a green line segment connecting (413, 100) to (109, 72).
; PLAN: r0=413(x1), r1=100(y1), r2=109(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 100
LDI r2, 109
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
