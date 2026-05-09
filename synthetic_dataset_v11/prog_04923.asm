; DESCRIPTION: Places a white line segment connecting (210, 211) to (229, 137).
; PLAN: r0=210(x1), r1=211(y1), r2=229(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 211
LDI r2, 229
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
