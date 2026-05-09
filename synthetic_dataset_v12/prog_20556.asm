; DESCRIPTION: Places a black line segment connecting (439, 194) to (163, 14).
; PLAN: r0=439(x1), r1=194(y1), r2=163(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 194
LDI r2, 163
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
