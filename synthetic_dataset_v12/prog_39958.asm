; DESCRIPTION: Places a white line segment connecting (129, 119) to (506, 236).
; PLAN: r0=129(x1), r1=119(y1), r2=506(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 119
LDI r2, 506
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
