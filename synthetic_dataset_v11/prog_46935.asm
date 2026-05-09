; DESCRIPTION: Places a white line segment connecting (105, 227) to (10, 86).
; PLAN: r0=105(x1), r1=227(y1), r2=10(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 227
LDI r2, 10
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
