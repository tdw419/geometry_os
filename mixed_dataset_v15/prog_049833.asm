; DESCRIPTION: Places a white line segment connecting (348, 17) to (66, 144).
; PLAN: r0=348(x1), r1=17(y1), r2=66(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 17
LDI r2, 66
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
