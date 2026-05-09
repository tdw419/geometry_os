; DESCRIPTION: Places a white line segment connecting (325, 125) to (348, 54).
; PLAN: r0=325(x1), r1=125(y1), r2=348(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 125
LDI r2, 348
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
