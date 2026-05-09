; DESCRIPTION: Places a white line segment connecting (466, 30) to (172, 35).
; PLAN: r0=466(x1), r1=30(y1), r2=172(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 30
LDI r2, 172
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
