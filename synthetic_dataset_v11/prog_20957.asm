; DESCRIPTION: Places a black line segment connecting (199, 109) to (212, 102).
; PLAN: r0=199(x1), r1=109(y1), r2=212(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 109
LDI r2, 212
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
