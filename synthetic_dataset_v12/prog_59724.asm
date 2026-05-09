; DESCRIPTION: Places a blue line segment connecting (83, 163) to (348, 244).
; PLAN: r0=83(x1), r1=163(y1), r2=348(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 163
LDI r2, 348
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
