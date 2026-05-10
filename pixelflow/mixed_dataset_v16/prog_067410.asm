; DESCRIPTION: Places a white line segment connecting (143, 251) to (485, 116).
; PLAN: r0=143(x1), r1=251(y1), r2=485(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 251
LDI r2, 485
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
