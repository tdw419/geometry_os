; DESCRIPTION: Draws a white line from (266, 22) to (348, 252).
; PLAN: r0=266(x1), r1=22(y1), r2=348(x2), r3=252(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 22
LDI r2, 348
LDI r3, 252
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
