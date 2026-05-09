; DESCRIPTION: Places a white line segment connecting (216, 219) to (78, 169).
; PLAN: r0=216(x1), r1=219(y1), r2=78(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 219
LDI r2, 78
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
