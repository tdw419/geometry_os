; DESCRIPTION: Places a black line segment connecting (439, 77) to (372, 176).
; PLAN: r0=439(x1), r1=77(y1), r2=372(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 77
LDI r2, 372
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
