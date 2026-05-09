; DESCRIPTION: Places a white line segment connecting (250, 63) to (348, 141).
; PLAN: r0=250(x1), r1=63(y1), r2=348(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 63
LDI r2, 348
LDI r3, 141
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
