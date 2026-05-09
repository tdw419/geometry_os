; DESCRIPTION: Places a white line segment connecting (432, 110) to (504, 13).
; PLAN: r0=432(x1), r1=110(y1), r2=504(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 110
LDI r2, 504
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
