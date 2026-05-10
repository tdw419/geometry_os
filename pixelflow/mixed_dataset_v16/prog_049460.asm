; DESCRIPTION: Places a white line segment connecting (418, 116) to (348, 236).
; PLAN: r0=418(x1), r1=116(y1), r2=348(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 116
LDI r2, 348
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
