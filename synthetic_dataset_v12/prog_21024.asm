; DESCRIPTION: Places a white line segment connecting (348, 117) to (347, 123).
; PLAN: r0=348(x1), r1=117(y1), r2=347(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 117
LDI r2, 347
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
