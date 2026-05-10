; DESCRIPTION: Places a white line segment connecting (358, 138) to (497, 218).
; PLAN: r0=358(x1), r1=138(y1), r2=497(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 138
LDI r2, 497
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
