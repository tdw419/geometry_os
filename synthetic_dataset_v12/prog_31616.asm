; DESCRIPTION: Places a white line segment connecting (466, 157) to (348, 61).
; PLAN: r0=466(x1), r1=157(y1), r2=348(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 157
LDI r2, 348
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
