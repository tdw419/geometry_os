; DESCRIPTION: Places a white line segment connecting (341, 218) to (433, 136).
; PLAN: r0=341(x1), r1=218(y1), r2=433(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 218
LDI r2, 433
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
