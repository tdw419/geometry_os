; DESCRIPTION: Places a white line segment connecting (500, 7) to (457, 247).
; PLAN: r0=500(x1), r1=7(y1), r2=457(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 7
LDI r2, 457
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
