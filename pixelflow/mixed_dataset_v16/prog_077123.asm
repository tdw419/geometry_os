; DESCRIPTION: Places a green line segment connecting (348, 14) to (309, 116).
; PLAN: r0=348(x1), r1=14(y1), r2=309(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 14
LDI r2, 309
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
