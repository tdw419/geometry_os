; DESCRIPTION: Places a white line segment connecting (489, 23) to (36, 69).
; PLAN: r0=489(x1), r1=23(y1), r2=36(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 23
LDI r2, 36
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
