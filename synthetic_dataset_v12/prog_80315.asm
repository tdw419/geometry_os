; DESCRIPTION: Places a white line segment connecting (169, 100) to (65, 31).
; PLAN: r0=169(x1), r1=100(y1), r2=65(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 100
LDI r2, 65
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
