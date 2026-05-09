; DESCRIPTION: Places a white line segment connecting (348, 159) to (63, 6).
; PLAN: r0=348(x1), r1=159(y1), r2=63(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 159
LDI r2, 63
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
