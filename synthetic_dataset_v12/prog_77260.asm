; DESCRIPTION: Places a white line segment connecting (374, 120) to (407, 116).
; PLAN: r0=374(x1), r1=120(y1), r2=407(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 120
LDI r2, 407
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
