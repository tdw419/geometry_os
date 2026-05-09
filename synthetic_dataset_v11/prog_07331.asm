; DESCRIPTION: Places a white line segment connecting (223, 165) to (77, 185).
; PLAN: r0=223(x1), r1=165(y1), r2=77(x2), r3=185(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 165
LDI r2, 77
LDI r3, 185
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
