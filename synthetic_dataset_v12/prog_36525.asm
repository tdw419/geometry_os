; DESCRIPTION: Places a red line segment connecting (462, 211) to (129, 211).
; PLAN: r0=462(x1), r1=211(y1), r2=129(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 211
LDI r2, 129
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
