; DESCRIPTION: Places a white line segment connecting (342, 115) to (112, 160).
; PLAN: r0=342(x1), r1=115(y1), r2=112(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 115
LDI r2, 112
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
