; DESCRIPTION: Places a orange line segment connecting (131, 202) to (474, 185).
; PLAN: r0=131(x1), r1=202(y1), r2=474(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 202
LDI r2, 474
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
