; DESCRIPTION: Places a green line segment connecting (105, 211) to (78, 1).
; PLAN: r0=105(x1), r1=211(y1), r2=78(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 211
LDI r2, 78
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
