; DESCRIPTION: Places a white line segment connecting (399, 89) to (218, 22).
; PLAN: r0=399(x1), r1=89(y1), r2=218(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 89
LDI r2, 218
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
