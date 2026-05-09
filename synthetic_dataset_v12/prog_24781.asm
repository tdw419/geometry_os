; DESCRIPTION: Places a white line segment connecting (468, 217) to (360, 10).
; PLAN: r0=468(x1), r1=217(y1), r2=360(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 217
LDI r2, 360
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
