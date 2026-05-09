; DESCRIPTION: Places a white line segment connecting (423, 217) to (374, 21).
; PLAN: r0=423(x1), r1=217(y1), r2=374(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 217
LDI r2, 374
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
