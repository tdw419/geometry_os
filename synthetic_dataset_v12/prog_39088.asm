; DESCRIPTION: Places a green line segment connecting (45, 137) to (233, 250).
; PLAN: r0=45(x1), r1=137(y1), r2=233(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 137
LDI r2, 233
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
