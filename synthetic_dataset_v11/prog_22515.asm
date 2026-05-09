; DESCRIPTION: Places a white line segment connecting (124, 83) to (34, 95).
; PLAN: r0=124(x1), r1=83(y1), r2=34(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 83
LDI r2, 34
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
