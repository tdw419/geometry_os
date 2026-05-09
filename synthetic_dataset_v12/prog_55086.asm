; DESCRIPTION: Places a black line segment connecting (223, 74) to (348, 25).
; PLAN: r0=223(x1), r1=74(y1), r2=348(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 74
LDI r2, 348
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
