; DESCRIPTION: Places a red line segment connecting (338, 184) to (478, 61).
; PLAN: r0=338(x1), r1=184(y1), r2=478(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 184
LDI r2, 478
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
