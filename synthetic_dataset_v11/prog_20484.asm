; DESCRIPTION: Places a white line segment connecting (169, 211) to (38, 109).
; PLAN: r0=169(x1), r1=211(y1), r2=38(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 211
LDI r2, 38
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
