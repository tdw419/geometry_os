; DESCRIPTION: Places a black line segment connecting (495, 112) to (439, 227).
; PLAN: r0=495(x1), r1=112(y1), r2=439(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 112
LDI r2, 439
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
