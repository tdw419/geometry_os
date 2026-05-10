; DESCRIPTION: Draws a white line from (348, 89) to (203, 158).
; PLAN: r0=348(x1), r1=89(y1), r2=203(x2), r3=158(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 89
LDI r2, 203
LDI r3, 158
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
