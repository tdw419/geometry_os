; DESCRIPTION: Places a red line segment connecting (422, 137) to (236, 115).
; PLAN: r0=422(x1), r1=137(y1), r2=236(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 137
LDI r2, 236
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
