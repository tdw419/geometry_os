; DESCRIPTION: Places a white line segment connecting (78, 200) to (357, 98).
; PLAN: r0=78(x1), r1=200(y1), r2=357(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 200
LDI r2, 357
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
