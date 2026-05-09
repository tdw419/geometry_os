; DESCRIPTION: Places a white line segment connecting (348, 92) to (220, 58).
; PLAN: r0=348(x1), r1=92(y1), r2=220(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 92
LDI r2, 220
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
