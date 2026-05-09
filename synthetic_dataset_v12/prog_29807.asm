; DESCRIPTION: Places a white line segment connecting (129, 226) to (376, 35).
; PLAN: r0=129(x1), r1=226(y1), r2=376(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 226
LDI r2, 376
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
