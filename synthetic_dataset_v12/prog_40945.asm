; DESCRIPTION: Places a white line segment connecting (89, 35) to (506, 102).
; PLAN: r0=89(x1), r1=35(y1), r2=506(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 35
LDI r2, 506
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
