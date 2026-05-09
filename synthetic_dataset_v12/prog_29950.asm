; DESCRIPTION: Places a white line segment connecting (418, 144) to (112, 61).
; PLAN: r0=418(x1), r1=144(y1), r2=112(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 144
LDI r2, 112
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
